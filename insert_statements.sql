
        INSERT INTO python_rules (rule, name, severity, technique, technique_id, link, comment, os_name, created, last_modified, rule_written_by)
        SELECT '# This is the Sample Rule 
#   Don''t forget to :
#       1. Wrap all this in Definition/Function
#       2. Return :
#           a. Boolean   (Which determines weather to trigger the rule or not)
#           b. String    (Which display some context about the rule triggered)

def apt_testing(output):
    process_event = output[''row_data'']
    process_tree = output[''process_tree'']
    if ((process_event[''path''] in ["/usr/bin/dash","/usr/bin/zsh", ''/usr/lib/postgresql/14/bin/postgres'']) | (process_event[''path''][-2:] == ''sh'')):
        for e in process_tree:
            if e[''path''] == "/usr/lib/postgresql/14/bin/postgres":
                ss = "[" + str(e[''path'']) + " (pid: " + str(e[''pid'']) +")] spawned [" + str(process_event[''path'']) + " (pid: " + str(process_event[''pid'']) + ")]"
                print(ss)
                return True, ss
    ss = ''''
    return False, ss', 'test99', 1, 'Initial Access', NULL, NULL, NULL, 'Linux', '1721298012', '1721298012', 'admin'
        WHERE NOT EXISTS (
            SELECT 1 FROM python_rules WHERE rule = '# This is the Sample Rule 
#   Don''t forget to :
#       1. Wrap all this in Definition/Function
#       2. Return :
#           a. Boolean   (Which determines weather to trigger the rule or not)
#           b. String    (Which display some context about the rule triggered)

def apt_testing(output):
    process_event = output[''row_data'']
    process_tree = output[''process_tree'']
    if ((process_event[''path''] in ["/usr/bin/dash","/usr/bin/zsh", ''/usr/lib/postgresql/14/bin/postgres'']) | (process_event[''path''][-2:] == ''sh'')):
        for e in process_tree:
            if e[''path''] == "/usr/lib/postgresql/14/bin/postgres":
                ss = "[" + str(e[''path'']) + " (pid: " + str(e[''pid'']) +")] spawned [" + str(process_event[''path'']) + " (pid: " + str(process_event[''pid'']) + ")]"
                print(ss)
                return True, ss
    ss = ''''
    return False, ss' AND name = 'test99' 
        );

        INSERT INTO python_rules (rule, name, severity, technique, technique_id, link, comment, os_name, created, last_modified, rule_written_by)
        SELECT '# This is the Sample Rule 
#   Don''t forget to :
#       1. Wrap all this in Definition/Function
#       2. Return :
#           a. Boolean   (Which determines weather to trigger the rule or not)
#           b. String    (Which display some context about the rule triggered)

def apt_testing(output):
    process_event = output[''row_data'']
    process_tree = output[''process_tree'']
    if ((process_event[''path''] in ["/usr/bin/dash","/usr/bin/zsh", ''/usr/lib/postgresql/14/bin/postgres'']) | (process_event[''path''][-2:] == ''sh'')):
        for e in process_tree:
            if e[''path''] == "/usr/lib/postgresql/14/bin/postgres":
                ss = "[" + str(e[''path'']) + " (pid: " + str(e[''pid'']) +")] spawned [" + str(process_event[''path'']) + " (pid: " + str(process_event[''pid'']) + ")]"
                print(ss)
                return True, ss
    ss = ''''
    return False, ss', 'testwin', 5, 'Initial Access', NULL, NULL, NULL, 'Linux', '1721298092', '1721298092', 'admin'
        WHERE NOT EXISTS (
            SELECT 1 FROM python_rules WHERE rule = '# This is the Sample Rule 
#   Don''t forget to :
#       1. Wrap all this in Definition/Function
#       2. Return :
#           a. Boolean   (Which determines weather to trigger the rule or not)
#           b. String    (Which display some context about the rule triggered)

def apt_testing(output):
    process_event = output[''row_data'']
    process_tree = output[''process_tree'']
    if ((process_event[''path''] in ["/usr/bin/dash","/usr/bin/zsh", ''/usr/lib/postgresql/14/bin/postgres'']) | (process_event[''path''][-2:] == ''sh'')):
        for e in process_tree:
            if e[''path''] == "/usr/lib/postgresql/14/bin/postgres":
                ss = "[" + str(e[''path'']) + " (pid: " + str(e[''pid'']) +")] spawned [" + str(process_event[''path'']) + " (pid: " + str(process_event[''pid'']) + ")]"
                print(ss)
                return True, ss
    ss = ''''
    return False, ss' AND name = 'testwin' 
        );

        INSERT INTO rule_builder_rules (name, description, link, platform, severity, tactics, technique_id, type, rule_written_by, alerters, rule_builder, created, last_modified)
        SELECT 'test99', NULL, NULL, '[{"value":"Linux","label":"Linux"}]', 1, '""', NULL, 'Default', 'admin', '""', '{"operator":"AND","queries":[{"tableName":"bpf_process_events","columnName":"cmdline","conditionType":"contains","value":"ssh","dataType":"string","id":"bd111f74-7425-46a1-abdf-0b29dbe557b8"}]}', '1721298033', '1721298033'
        WHERE NOT EXISTS (
            SELECT 1 FROM rule_builder_rules WHERE name = 'test99'
        );
