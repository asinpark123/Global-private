import psycopg
import datetime

# Connect to an existing database
# globalcore_local public schema connection
with psycopg.connect("dbname=globalcore_local1 user=postgres password='an!mat10N' host='localhost' port= '5432'") as conn:
    
    glEntity_gfResource = []
    gfResource_exists = ()
    gfResource_data = []
    new_glEntity_gfResource = []
    contact_id_resource_id_list = []
    gfContact_resourceEntity_id = []
    contact_names = []
    new_glEntity_gfContacts = []
    contactRole_responsibility = {1:2,2:14,3:15,4:15,5:11,6:17,7:12,8:1,9:12,10:20,11:15,12:8,13:19}
    contact_id_contactRole_list = []
    contactEntity_contactRole_list = []
    contactEntity_responsibilities = []
    gfContact_info = []
    new_entityNotes = []
    defaultTime = datetime.time(9,00)
    
    
    ## Adding client_id column and client_qs_entity to job_gf_job and adding Foerign Key association for new columns added to Job GF and setting client_id column as NOT NULL
    ## NOT NULL constraint have to run after all migration finished
    with conn.cursor() as cur:
        cur.execute("ALTER TABLE public.job_gf_job ADD client_id INTEGER")
        cur.execute("ALTER TABLE public.job_gf_job ADD client_qs_entity INTEGER")
        cur.execute("ALTER TABLE public.job_gf_job ADD CONSTRAINT fk_job_gf_job_client_id FOREIGN KEY (client_id) REFERENCES public.crm_gl_entity(id)")
        # cur.execute("ALTER TABLE public.job_gf_job ALTER COLUMN client_id SET NOT NULL")
        cur.execute("ALTER TABLE public.job_gf_job ADD CONSTRAINT fk_job_gf_job_client_qs_entity FOREIGN KEY (client_qs_entity) REFERENCES public.crm_gl_entity(id)")
        cur.close()
    conn.commit()

    with conn.cursor() as cur:
## Inserting entity id in client_id where GF resource's NZBN = GL Entity NZBN. Creates a txt file (glEntity_gfResource.txt) containing pairs of new entity ids to corresponding gfResource ids, also as list of tuples in new_glEntity_gfResource.
        cur.execute("SELECT public.crm_gl_entity.id as GL_ENTITY_ID, public.crm_gl_entity.name as GL_ENTITY_NAME, temp.resources_resource.id as GF_RESOURCE_ID, temp.resources_resource.legal_name as GF_RESOURCE_NAME FROM public.crm_gl_entity INNER JOIN temp.resources_resource ON public.crm_gl_entity.nzbn = temp.resources_resource.NZBN WHERE public.crm_gl_entity.nzbn <> '' OR temp.resources_resource.NZBN <> '' ORDER BY public.crm_gl_entity.id ASC")
        # cur.fetchall()

        for record in cur:
            glEntity_gfResource += [(record[0],record[2])]
        
        f = open("glEntity_gfResource.txt", "w")
        for pairs in glEntity_gfResource:
            cur.execute("UPDATE public.job_gf_job SET client_id = %s WHERE resource = %s" % (pairs[0],pairs[1]))
            new_glEntity_gfResource += [(pairs[0],pairs[1])]
            f.write("entity: %s = resource: %s \n" % (pairs[0],pairs[1]))
        f.close()

# gfResource_exists_str stores GF resource id's that exist in GL entity that does not have blank NZBN
        cur.execute("SELECT temp.resources_resource.id FROM public.crm_gl_entity INNER JOIN temp.resources_resource ON public.crm_gl_entity.nzbn = temp.resources_resource.NZBN WHERE public.crm_gl_entity.nzbn <> '' OR temp.resources_resource.NZBN <> '' ORDER BY public.crm_gl_entity.id ASC")
        records = cur.fetchall()
        for record in records:
            gfResource_exists += record
        gfResource_exists_str = str(gfResource_exists)

# migrates GF resource that has an NZBN into GL entity EXCEPT resouces that already exist in GL entity AND resource 791 which has a duplicate NZBN with 259(allocated to a job), and adds key value pairs of entity_id-resource_id as tuple in the list new_glEntity_gfResource and appends glEntity_gfResource.txt
        cur.execute("SELECT legal_name, known_name, nzbn, id FROM temp.resources_resource WHERE id NOT IN %s AND NZBN <> '' AND id <> 791 ORDER BY id ASC" % gfResource_exists_str)
        results = cur.fetchall()

        f = open("glEntity_gfResource.txt", "a")
        for result in results:
            result_0 = result[0].replace("'","''")
            gfResource_data = [(result_0,result[1],result[2])]
            cur.execute("INSERT INTO public.crm_gl_entity (name, short_name, nzbn, pending, entity_type_id) VALUES ('%s','%s',%s,false, 1) RETURNING id" % (result_0,result[1],result[2]))
            # cur.fetchone()[0] is receiving new entity_id as each resource migrates
            new_Entity_id = cur.fetchone()[0]
            new_glEntity_gfResource += [(new_Entity_id,result[3])]
            f.write("entity: %s = resource: %s \n" % (new_Entity_id,result[3]))
        f.close()

# migrates GF resource that has blank NZBN into GL entity, appends to the list new_glEntity_gfResource and also appends to glEntity_gfResource.txt. Does not bring over known_name of GF resource 607 and 609 as it's too long and just a duplicate of legal_name
        cur.execute("SELECT legal_name, known_name, nzbn, id FROM temp.resources_resource WHERE id NOT IN %s AND NZBN = '' AND id <> 791 ORDER BY id ASC" % gfResource_exists_str)
        results2 = cur.fetchall()
        f = open("glEntity_gfResource.txt", "a")
        for result in results2:
            result_0 = result[0].replace("'","''")
            gfResource_data = [(result_0,result[1],result[2])]
            if result[3] in (607,609):
                cur.execute("INSERT INTO public.crm_gl_entity (name, short_name, nzbn, pending, entity_type_id) VALUES ('%s','',null,false, 1) RETURNING id" % (result_0))
                new_Entity_id = cur.fetchone()[0]
                new_glEntity_gfResource += [(new_Entity_id,result[3])]
                f.write("entity: %s = resource: %s - NO NZBN \n" % (new_Entity_id,result[3]))
            else:
                cur.execute("INSERT INTO public.crm_gl_entity (name, short_name, nzbn, pending, entity_type_id) VALUES ('%s','%s',null,false, 1) RETURNING id" % (result_0,result[1]))
                new_Entity_id = cur.fetchone()[0]
                new_glEntity_gfResource += [(new_Entity_id,result[3])]
                f.write("entity: %s = resource: %s - NO NZBN \n" % (new_Entity_id,result[3]))
        f.close()
        lastNewGFresourceEntity = new_glEntity_gfResource[-1][0]
        # print(new_glEntity_gfResource)
        # print(lastNewGFresourceEntity)

# updates job_gf_job's client_id from list of glEntity-gfResource tuples in new_glEntity_gfResource that hasn't been updated earlier (when updating GF jobs with already existing GF resources in GL entity)
        for item in new_glEntity_gfResource:
            cur.execute("UPDATE public.job_gf_job SET client_id = %s WHERE resource = %s AND client_id IS NULL" % (item[0],item[1]))

# swaps the value positions of tuples in new_glEntity_gfResource and turns it into dictionary and saves it into gfResource_glEntity
        gfResource_glEntity = dict([(pairs[1],pairs[0]) for pairs in new_glEntity_gfResource])
# migrates GF contact into GL entity EXCEPT for all the 'Default Contact', populating GL entity parent_id with contact_id as a placeholder for now, which we'll use to populate the column correctly later. Creates a txt file (glEntity_gfContact.txt) containing pairs of new entity ids to corresponding gfContact ids, also as list of tuples in new_glEntity_gfContacts.
        cur.execute("SELECT id, CONCAT(first_name, ' ', last_name), resource_id FROM temp.resources_contact WHERE CONCAT(first_name, ' ', last_name) NOT LIKE '%Default Contact%' ORDER BY id ASC")
        result_pt5 = cur.fetchall()
        f = open("glEntity_gfContact.txt", "w")
        for results in result_pt5:
            contact_id_resource_id_list += [(results[0],results[2])]
            results_1 = results[1].replace("'","''")
            contact_names += [(results[1])]
            cur.execute("INSERT INTO public.crm_gl_entity (name, short_name, nzbn, pending, entity_type_id, parent_id) VALUES ('%s','', NULL,false, 5,%s) RETURNING id" % (results_1,results[0]))
            new_Entity_id = cur.fetchone()[0]
            new_glEntity_gfContacts += [(new_Entity_id,results[0])]
            f.write("entity: %s = contact: %s \n" % (new_Entity_id,results[0]))
        f.close()
        
    # creating a list of tuples of gfContact_id - gfResource's entity_id from two dict contact_id_resource_id and gfResource_glEntity
        contact_id_resource_id = dict(contact_id_resource_id_list)
        for contact_id, resource_id in contact_id_resource_id.items():
            if resource_id in gfResource_glEntity.keys():
                gfContact_resourceEntity_id += [(contact_id,gfResource_glEntity[resource_id])]

    # Updates the parent_id by replacing the placeholder(contact_id) with its actual parent's entity_id WHERE id > lastNewGFresourceEntity which should be where new data id, after resource migration, starts from
        for items in gfContact_resourceEntity_id:
            cur.execute("UPDATE public.crm_gl_entity SET parent_id = %s WHERE parent_id = %s AND id > %s" % (items[1],items[0],lastNewGFresourceEntity))

    # adds 'Fire Engineer' and 'Health and Safety' to Responsibility table 
        cur.execute("INSERT INTO public.crm_common_responsibility (name, current) VALUES ('Fire Engineer', true),('Health and Safety',true)")

        cur.execute("SELECT * FROM temp.resources_contact_contact_roles order by contact_id")
        result_pt6 = cur.fetchall()
        for results in result_pt6:
            contact_id_contactRole_list += [(results[1],results[2])]
        
        contact_id_contactRole = dict(contact_id_contactRole_list)
        new_gfContacts_glEntity = dict([(pairs[1],pairs[0]) for pairs in new_glEntity_gfContacts])            

        for contact_id, entity_id in new_gfContacts_glEntity.items():
            if contact_id in contact_id_contactRole.keys():
                contactEntity_contactRole_list += [(entity_id,contact_id_contactRole[contact_id])]

        contactEntity_contactRole = dict(contactEntity_contactRole_list)
        for contactEntity, contactRole in contactEntity_contactRole.items():
            if contactRole in contactRole_responsibility.keys():
                contactEntity_responsibilities += [(contactEntity,contactRole_responsibility[contactRole])]
        
    # maps ContactRole to corresponding Responsibility in public.crm_gl_entity_responsibilities
        for items in contactEntity_responsibilities:
            cur.execute("INSERT INTO public.crm_gl_entity_responsibilities (entity_id, responsibility_id) VALUES(%s, %s)" % (items[0],items[1]))
    # Inserts newly migrated contacts Entity id to client_qs_entity column where client_QS matches contact_id in new_glEntity_gfContacts. 'Default Contact' client_QS will be NULL in client_qs_entity
        for pairs in new_glEntity_gfContacts:
            cur.execute("UPDATE public.job_gf_job SET client_qs_entity = %s WHERE client_qs = %s" % (pairs[0],pairs[1]))

    # Extracting contact email and phone number of migrated contacts into gfContact_info for migration
        for pairs in new_glEntity_gfContacts:
            cur.execute("SELECT id, email_address, phone_number FROM temp.resources_contact WHERE CONCAT(first_name, ' ', last_name) NOT LIKE '%Default Contact%' ORDER BY id ASC")
            gfContact_info = cur.fetchall()
        
    # Migrate Entity email address and Entity phone number from gfContact, also updates crm_gl_entityphonenumber_contact_types and crm_gl_entityemailaddress_contact_types with new entity ids, which all will be assigned with contacttype 1 (General) 
        for items in gfContact_info:
            if items[0] in new_gfContacts_glEntity.keys():
                item_1 = items[1].replace("'","''")
                cur.execute("INSERT INTO public.crm_gl_entityemailaddress(email_address, current, entity_id) VALUES('%s', true, %s) RETURNING id" % (item_1, new_gfContacts_glEntity[items[0]]))
                entityemailaddress_id_contacttype_id = cur.fetchone()[0]
                cur.execute("INSERT INTO public.crm_gl_entityemailaddress_contact_types (entityemailaddress_id, contacttype_id) VALUES(%s,1)" % entityemailaddress_id_contacttype_id)

                cur.execute("INSERT INTO public.crm_gl_entityphonenumber(phone_number, current, entity_id) VALUES('%s', true, %s) RETURNING id" % (items[2], new_gfContacts_glEntity[items[0]]))
                entityphonenumber_id_contacttype_id = cur.fetchone()[0]
                cur.execute("INSERT INTO public.crm_gl_entityphonenumber_contact_types (entityphonenumber_id, contacttype_id) VALUES(%s,1)" % entityphonenumber_id_contacttype_id)
            
        # Migrating ResourceNotes into EntityNotes, getting data from GF resourceNotes and from resources_resourcenote_assignee via INNER JOIN, converting resource ID to Entity ID by using gfResource_glEntity dict created earlier.
        cur.execute("SELECT temp.resources_resourcenote.added_date, temp.resources_resourcenote.note, temp.resources_resourcenote.resource_id, temp.resources_resourcenote_assignee.globaluser_id FROM temp.resources_resourcenote INNER JOIN temp.resources_resourcenote_assignee ON temp.resources_resourcenote.id = temp.resources_resourcenote_assignee.resourcenote_id ORDER BY temp.resources_resourcenote.id ASC")
        result_pt9 = cur.fetchall()
        for results in result_pt9:
            datetimeCombine = datetime.datetime.combine(results[0],defaultTime)
            notes = results[1].replace("'","''")
            results_2 = gfResource_glEntity[results[2]]
            new_entityNotes += [(datetimeCombine,notes,results_2,results[3])]
        for items in new_entityNotes:
            cur.execute("INSERT INTO public.crm_gl_entitynote(created, last_modified, pinned, note, creator_id, entity_id, last_modified_by_id) VALUES('%s','%s','false','%s',%s,%s,%s)" % (items[0],items[0],items[1],items[3],items[2],items[3]))

        cur.close()
        # Make the changes to the database persistent
    conn.commit()

