import psycopg

# Connect to an existing database
# globalcore_local public schema connection
with psycopg.connect("dbname=globalcore_local user=postgres password='an!mat10N' host='localhost' port= '5432'") as conn:
    
    # Open a cursor to perform database operations
    with conn.cursor() as cur:
        # Migrating ResourceNotes into EntityNotes

        
        # Make the changes to the database persistent
        # conn.commit()