ALTER TABLE public."resources_resource" ADD old_id INTEGER UNIQUE;
UPDATE public."resources_resource" SET old_id=id;
INSERT INTO temp."crm_Resource" (
    "id",
    "old_id",
    "legal_name",
    "known_name",
    "is_company",
    "main_address",
    "nzbn",
    "nzbn_status",
    "last_credit_check",
    "resource_notes"
        )
SELECT
    "id",
    "id",
    "legal_name",
    "known_name",
    "is_company",
    "main_address_id",
    "nzbn",
    "nzbn_status_id",
    "last_credit_check",
    "resource_notes"
FROM public."resources_resource";


ALTER TABLE public."resources_contact" ADD old_id INTEGER UNIQUE;
UPDATE public."resources_contact" SET old_id=id;
INSERT INTO temp."crm_Contact" 
    ("id",
    "old_id",
    "resource",
    "old_resource",
    "first_name",
    "last_name",
    "job_title",
    "email_address",
    "phone_number",
    "notes",
    "is_active") 
SELECT 
    "id",
    "old_id",
    "resource_id",
    "resource_id",
    "first_name",
    "last_name",
    "job_title",
    "email_address",
    "phone_number",
    "notes",
    "is_active"
FROM public."resources_contact";

INSERT INTO temp."crm_ContactRole" (
    "id",
    "name",
    "is_active"
    )
SELECT
    "id",
    "name",
    "is_active"
FROM public."resources_contactrole";

INSERT INTO temp."crm_ResourceNote" (
    "id",
    "resource",
    "old_resource",
    "added_date",
    "note"
    )
SELECT
    "id",
    "resource_id",
    "resource_id",
    "added_date",
    "note"
FROM public."resources_resourcenote";

INSERT INTO temp."crm_ResourceType" (
    "id",
    "name",
    "is_active"
    )
SELECT
    "id",
    "name",
    "is_active"
FROM public."resources_resourcetype";

INSERT INTO temp."crm_Resource_resource_type" (
    "id",
    "Resource_id",
    "old_Resource_id",
    "ResourceType_id"
    )
SELECT
    "id",
    "resource_id",
    "resource_id",
    "resourcetype_id"
FROM public."resources_resource_resource_type";

INSERT INTO temp."crm_ResourceNameType" (
    "id",
    "Resource_id",
    "old_Resource_id",
    "ResourceType_id"
    )
SELECT
    "id",
    "resource_id",
    "resource_id",
    "resourcetype_id"
FROM public."resources_resource_resource_type";









INSERT INTO temp."crm_Entity" (
    "id",


    )
SELECT
    "id",


FROM public."resources_resourcenote";

