import psycopg

with psycopg.connect("dbname=globalcore user=alexpark password='an!mat10N' host='gl-db04.internal.gl.co.nz' port= '5432'") as conn:
    with conn.cursor() as cur:

        cur.execute("SELECT max(id) FROM public.crm_gl_entity")
        id = cur.fetchall()
        print(id)

        cur.execute("SELECT max(id) FROM temp.resources_resource")
        id = cur.fetchall()
        print(id)

        cur.close()
    conn.commit()