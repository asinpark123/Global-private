import psycopg

# Connect to an existing database
# globalcore_local public schema connection
with psycopg.connect("dbname=globalcore_local user=postgres password='an!mat10N' host='localhost' port= '5432'") as conn:
    
    gfResource_exists = ()
    gfResource_data = []
    new_glEntity_gfResource = []
    # Open a cursor to perform database operations
    with conn.cursor() as cur:

        # gfResource_exists_str stores GF resource id's that exist in GL entity that does not have blank NZBN
        cur.execute("SELECT temp.resources_resource.id FROM public.crm_gl_entity INNER JOIN temp.resources_resource ON public.crm_gl_entity.nzbn = temp.resources_resource.NZBN WHERE public.crm_gl_entity.nzbn <> '' OR temp.resources_resource.NZBN <> '' ORDER BY public.crm_gl_entity.id ASC")
        records = cur.fetchall()
        for record in records:
            gfResource_exists += record
        # print(gfResource_exists, "\n", len(gfResource_exists))
        gfResource_exists_str = str(gfResource_exists)

        # migrates GF resource that has blank NZBN into GL entity, appends to the list new_glEntity_gfResource and also appends to glEntity_gfResource.txt. Does not bring over known_name of GF resource 607 and 609 as it's too long and just a duplicate of legal_name
        cur.execute("SELECT legal_name, known_name, nzbn, id FROM temp.resources_resource WHERE id NOT IN %s AND NZBN = '' AND id <> 791 ORDER BY id ASC" % gfResource_exists_str)
        results2 = cur.fetchall()
        f = open("glEntity_gfResource.txt", "a")
        for result in results2:
            result_0 = result[0].replace("'","''")
            gfResource_data = [(result_0,result[1],result[2])]
            # print(gfResource_data)
            if result[3] in (607,609):
                cur.execute("INSERT INTO public.crm_gl_entity (name, short_name, nzbn, pending, entity_type_id) VALUES ('%s','',null,false, 1) RETURNING id" % (result_0))
                # cur.fetchone()[0] is receiving new entity_id as each resource migrates
                new_Entity_id = cur.fetchone()[0]
                new_glEntity_gfResource += [(new_Entity_id,result[3])]
                f.write("entity: %s = resource: %s - NO NZBN \n" % (new_Entity_id,result[3]))
            else:
                cur.execute("INSERT INTO public.crm_gl_entity (name, short_name, nzbn, pending, entity_type_id) VALUES ('%s','%s',null,false, 1) RETURNING id" % (result_0,result[1]))
                # cur.fetchone()[0] is receiving new entity_id as each resource migrates
                new_Entity_id = cur.fetchone()[0]
                new_glEntity_gfResource += [(new_Entity_id,result[3])]
                f.write("entity: %s = resource: %s - NO NZBN \n" % (new_Entity_id,result[3]))
        f.close()
        print(new_glEntity_gfResource)

        
        

        # Make the changes to the database persistent
        # conn.commit()
