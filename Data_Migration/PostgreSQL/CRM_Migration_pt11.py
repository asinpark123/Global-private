import psycopg
import datetime

# Connect to an existing database
# globalcore_local public schema connection
with psycopg.connect("dbname=globalcore_local user=postgres password='an!mat10N' host='localhost' port= '5432'") as conn:

    # Foerign Key association for new columns added to Job GF and setting client_id column as NOT NULL
    with conn.cursor() as cur:
        cur.execute("ALTER TABLE public.job_gf_job ADD CONSTRAINT fk_job_gf_job_client_id FOREIGN KEY (client_id) REFERENCES public.crm_gl_entity(id)")
        cur.execute("ALTER TABLE public.job_gf_job ALTER COLUMN client_id SET NOT NULL")
        cur.execute("ALTER TABLE public.job_gf_job ADD CONSTRAINT fk_job_gf_job_client_qs_entity FOREIGN KEY (client_qs_entity) REFERENCES public.crm_gl_entity(id)")
        cur.close()
    conn.commit()