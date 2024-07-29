import psycopg2

def fetch_data(conn, query):
    with conn.cursor() as cursor:
        cursor.execute(query)
        return cursor.fetchall()

def generate_insert_statements_python_rules(data):
    statements = []
    for row in data:
        rule = row[0].strip().replace("'", "''")
        name = row[1]
        severity = row[2]
        technique = row[3]
        technique_id = f"'{row[4]}'" if row[4] else 'NULL'
        link = f"'{row[5]}'" if row[5] else 'NULL'
        comment = f"'{row[6]}'" if row[6] else 'NULL'
        os_name = row[7]
        created = f"'{row[8]}'"  # Assuming created is a date or timestamp
        last_modified = f"'{row[9]}'"  # Assuming last_modified is a date or timestamp
        rule_written_by = row[10]
        
        insert_statement = f"""
        INSERT INTO python_rules (rule, name, severity, technique, technique_id, link, comment, os_name, created, last_modified, rule_written_by)
        SELECT '{rule}', '{name}', {severity}, '{technique}', {technique_id}, {link}, {comment}, '{os_name}', {created}, {last_modified}, '{rule_written_by}'
        WHERE NOT EXISTS (
            SELECT 1 FROM python_rules WHERE rule = '{rule}' AND name = '{name}' 
        );"""
        
        statements.append(insert_statement)
    return statements
    
def generate_insert_statements_rule_builder_rules(data_rule):
    statements = []
    for row in data_rule:
        
        name = row[0].strip().replace("'", "''")
        description = f"'{row[1]}'" if row[1] else 'NULL'
        link = f"'{row[2]}'" if row[2] else 'NULL'
        platform = f"'{row[3]}'" if row[3] else 'NULL'
        severity = row[4]
        tactics = f"'{row[5]}'" if row[5] else 'NULL'
        technique_id = f"'{row[6]}'" if row[6] else 'NULL'
        type = f"'{row[7]}'" if row[7] else 'NULL'
        rule_written_by = f"'{row[8]}'" if row[8] else 'NULL'
        alerters = f"'{row[9]}'" if row[9] else 'NULL'
        rule_builder = f"'{row[10]}'" if row[10] else 'NULL'
        created = f"'{row[11]}'"
        last_modified = f"'{row[12]}'"
        
        insert_statement = f"""
        INSERT INTO rule_builder_rules (name, description, link, platform, severity, tactics, technique_id, type, rule_written_by, alerters, rule_builder, created, last_modified)
        SELECT '{name}', {description}, {link}, {platform}, {severity}, {tactics}, {technique_id}, {type}, {rule_written_by}, {alerters}, {rule_builder}, {created}, {last_modified}
        WHERE NOT EXISTS (
            SELECT 1 FROM rule_builder_rules WHERE name = '{name}'
        );"""
        
        statements.append(insert_statement)
    return statements
    
def main():
    # Database connection parameters
    conn_params = {
        'dbname': 'fleet',
        'user': 'vajra',
        'password': 'admin',
        'host': 'localhost',
        'port': '5432',
    }

    # Define your queries
    source_query_1 = "SELECT rule, name, severity, technique, technique_id, link, comment, os_name, created, last_modified, rule_written_by FROM python_rules;"
    source_query_2 = "SELECT name, description, link, platform, severity, tactics, technique_id, type, rule_written_by, alerters, rule_builder, created, last_modified FROM rule_builder_rules;"

    # Establish the database connection
    with psycopg2.connect(**conn_params) as conn:
        # Fetch data from source tables
        source_data_1 = fetch_data(conn, source_query_1)
        source_data_2 = fetch_data(conn, source_query_2)

        # Generate INSERT statements for python_rules
        insert_statements_python_rules = generate_insert_statements_python_rules(source_data_1)

        # Generate INSERT statements for rule_builder_rules
        insert_statements_rule_builder_rules = generate_insert_statements_rule_builder_rules(source_data_2)

        # Write INSERT statements to a .sql file
        with open('insert_statements.sql', 'w') as file:
            for statement in insert_statements_python_rules + insert_statements_rule_builder_rules:
                file.write(statement + '\n')
    print("Insert statements have been written to insert_statements.sql")
	
if __name__ == "__main__":
    main()
