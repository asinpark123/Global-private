import psycopg

# Connect to an existing database
# globalcore_local public schema connection
with psycopg.connect("dbname=globalcore_local user=postgres password='an!mat10N' host='localhost' port= '5432'") as conn:
    
    glEntity_gfResource = []
    gfResource_exists = ()
    gfResource_data = []
    new_glEntity_gfResource = []
    # Open a cursor to perform database operations
    with conn.cursor() as cur:

## Adding entity_id column to GF Jobs table and inserting entity_id where GF resource's NZBN = GL Entity NZBN, and stores entity_id-resource_id pair in glEntity_gfResource.txt and also inside list of tuples in new_glEntity_gfResource
        cur.execute("SELECT public.crm_gl_entity.id as GL_ENTITY_ID, public.crm_gl_entity.name as GL_ENTITY_NAME, temp.resources_resource.id as GF_RESOURCE_ID, temp.resources_resource.legal_name as GF_RESOURCE_NAME FROM public.crm_gl_entity INNER JOIN temp.resources_resource ON public.crm_gl_entity.nzbn = temp.resources_resource.NZBN WHERE public.crm_gl_entity.nzbn <> '' OR temp.resources_resource.NZBN <> '' ORDER BY public.crm_gl_entity.id ASC")
        # cur.fetchall()

        for record in cur:
            # print(record)
            glEntity_gfResource += [(record[0],record[2])]
        
        # print(glEntity_gfResource)

        cur.execute("ALTER TABLE public.job_gf_job ADD client_id INTEGER")

        f = open("glEntity_gfResource.txt", "w")
        for pairs in glEntity_gfResource:
            # print(pairs)
            cur.execute("UPDATE public.job_gf_job SET client_id = %s WHERE resource = %s" % (pairs[0],pairs[1]))
            new_glEntity_gfResource += [(pairs[0],pairs[1])]
            f.write("entity: %s = resource: %s \n" % (pairs[0],pairs[1]))
        f.close()
        print(new_glEntity_gfResource)
        # f = open("existing_glEntity_gfResource.txt", "r")
        # print(f.read())


        # Make the changes to the database persistent
        # conn.commit()