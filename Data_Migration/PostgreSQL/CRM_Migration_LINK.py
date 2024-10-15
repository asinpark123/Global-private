import psycopg
import datetime

# Connect to an existing database
# globalcore_local public schema connection
with psycopg.connect("dbname=globalcore_local user=postgres password='an!mat10N' host='localhost' port= '5432'") as conn:
    
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
    ## additonal columns in job_gf_job will be created by Alexander, below add columns and FK constraints are only for testing
        cur.execute("ALTER TABLE public.job_gf_job ADD client_id INTEGER")
        cur.execute("ALTER TABLE public.job_gf_job ADD client_qs_entity INTEGER")
        cur.execute("ALTER TABLE public.job_gf_job ADD CONSTRAINT fk_job_gf_job_client_id FOREIGN KEY (client_id) REFERENCES public.crm_gl_entity(id)")
        # cur.execute("ALTER TABLE public.job_gf_job ALTER COLUMN client_id SET NOT NULL")
        cur.execute("ALTER TABLE public.job_gf_job ADD CONSTRAINT fk_job_gf_job_client_qs_entity FOREIGN KEY (client_qs_entity) REFERENCES public.crm_gl_entity(id)")
        cur.close()
    conn.commit()

## loading the glEntity_gfResource, new_glEntity_gfResource, new_glEntity_gfContacts tuple lists into each of their own variable from the saved text files
    with open("glEntity_gfResource_pt2.txt","r") as f:
        lines=f.read().splitlines()
        for line in lines:
            x = line.split(",")
            glEntity = int(x[0].replace("(",""))
            gfResource = int(x[1].replace(")",""))
            glEntity_gfResource+= [(glEntity,gfResource)]
    f.close()

    with open("new_glEntity_gfResource.txt","r") as f:
        lines=f.read().splitlines()
        for line in lines:
            x = line.split(",")
            glEntity = int(x[0].replace("(",""))
            gfResource = int(x[1].replace(")",""))
            new_glEntity_gfResource+= [(glEntity,gfResource)]
    f.close()

    with open("new_glEntity_gfContacts.txt","r") as f:
        lines=f.read().splitlines()
        for line in lines:
            x = line.split(",")
            glEntity = int(x[0].replace("(",""))
            gfContacts = int(x[1].replace(")",""))
            new_glEntity_gfContacts+= [(glEntity,gfContacts)]
    f.close()

    with conn.cursor() as cur:
## Inserting entity id in client_id where GF resource's NZBN = GL Entity NZBN. Creates a txt file (glEntity_gfResource.txt) containing pairs of new entity ids to corresponding gfResource ids, also as list of tuples in new_glEntity_gfResource.
        for pairs in glEntity_gfResource:
            cur.execute("UPDATE public.job_gf_job SET client_id = %s WHERE resource = %s" % (pairs[0],pairs[1]))


# commenting out LINK related part
# updates job_gf_job's client_id from list of glEntity-gfResource tuples in new_glEntity_gfResource that hasn't been updated earlier (when updating GF jobs with already existing GF resources in GL entity)
        for item in new_glEntity_gfResource:
            cur.execute("UPDATE public.job_gf_job SET client_id = %s WHERE resource = %s AND client_id IS NULL" % (item[0],item[1]))

## commenting out LINK related part
    # Inserts newly migrated contacts Entity id to client_qs_entity column where client_QS matches contact_id in new_glEntity_gfContacts. 'Default Contact' client_QS will be NULL in client_qs_entity
        for pairs in new_glEntity_gfContacts:
            cur.execute("UPDATE public.job_gf_job SET client_qs_entity = %s WHERE client_qs = %s" % (pairs[0],pairs[1]))

        cur.close()
        # Make the changes to the database persistent
    conn.commit()