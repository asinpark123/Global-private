INSERT INTO temp."globaluser_AppName" (
    "id",
    "name",
    "current_app"
    )
SELECT
    "id",
    "name",
    "current_app"
FROM public."globaluser_appname";

INSERT INTO temp."globaluser_AppPermissionLevel" (
    "id",
    "name",
    "current_level"
    )
SELECT
    "id",
    "name",
    "current_level"
FROM public."globaluser_apppermissionlevel";

INSERT INTO temp."globaluser_AppPermission" (
    "id",
    "app",
    "permission_level",
    "active_permission"
    )
SELECT
    "id",
    "app_id",
    "permission_level_id",
    "active_permission"
FROM public."globaluser_apppermission";

INSERT INTO temp."globaluser_GlobalBrand" (
    "id",
    "name",
    "current_brand"
    )
SELECT
    "id",
    "name",
    "is_active"
FROM public."globaluser_globalbrand";

INSERT INTO temp."globaluser_OperatingRegion" (
    "id",
    "name",
    "abbreviation",
    "current_region"
    )
SELECT
    "id",
    "name",
    "abbreviation",
    "is_active"
FROM public."globaluser_operatingregion";

INSERT INTO temp."globaluser_GlobalCompany" (
    "id",
    "brand",
    "region",
    "company_prefix",
    "active_company"
    )
SELECT
    "id",
    "brand_id",
    "region_id",
    "company_prefix",
    "is_active"
FROM public."globaluser_globalcompany";

INSERT INTO temp."globaluser_GlobalRole" (
    "id",
    "name",
    "current_role"
    )
SELECT
    "id",
    "name",
    "is_active"
FROM public."globaluser_globalrole";

INSERT INTO temp."globaluser_GlobalUser" (
    "id",
    "password",
    "last_login",
    "is_superuser",
    "username",
    "first_name",
    "last_name",
    "email",
    "mobile_number",
    "is_staff",
    "is_active",
    "date_joined"
    )
SELECT
    "id",
    "password",
    "last_login",
    "is_superuser",
    "username",
    "first_name",
    "last_name",
    "email",
    "mobile",
    "is_staff",
    "is_active",
    "date_joined"
FROM public."globaluser_globaluser";

INSERT INTO temp."globaluser_NZBNStatus" (
    "id",
    "description",
    "good_status"
    )
SELECT
    "id",
    "description",
    "good_status"
FROM public."resources_nzbnstatus";

INSERT INTO temp."globaluser_GlobalUser_role_held" (
    "id",
    "GlobalUser_id",
    "GlobalRole_id"
    )
SELECT
    "id",
    "GlobalUser_id",
    "GlobalRole_id"
FROM public."globaluser_globaluser_global_role";

INSERT INTO temp."globaluser_NZRegion" (
    "id" ,
    "region_short_code",
    "region_name",
    "official_short_code"
    )
VALUES ("1",	"AKL",	"Auckland",	"NZ-AUK"),
("2",	"NTL",	"Northland",	"NZ-NTL"),
("3",	"WAI",	"Waikato",	"NZ-WKO"),
("4",	"BOP",	"Bay of Plenty",	"NZ-BOP"),
("5",	"GIS",	"Gisborne",	"NZ-GIS"),
("6",	"TKI",	"Taranaki",	"NZ-TKI"),
("7",	"HBY",	"Hawke's Bay",	"NZ-HKB"),
("8",	"MWT",	"Manawatu-Wanganui",	"NZ-MWT"),
("9",	"WLG",	"Wellington",	"NZ-WGN"),
("10",	"MAR",	"Marlborough",	"NZ-MGH"),
("11",	"TAS",	"Tasman",	"NZ-TAS"),
("12",	"NSN",	"Nelson",	"NZ-NSN"),
("13",	"CAN",	"Canterbury",	"NZ-CAN"),
("14",	"WTC",	"West Coast",	"NZ-WTC"),
("15",	"OTA",	"Otago",	"NZ-OTA"),
("16",	"SOU",	"Southland",	"NZ-STL");

INSERT INTO temp."globaluser_SalaryStaff" (
    "id",
    "name",
    "abbreviation",
    "current_region"
    )
SELECT
    "id",
    "name",
    "abbreviation",
    "is_active"
FROM public."globaluser_operatingregion";




ALTER TABLE public."resources_resource" ADD old_id INTEGER UNIQUE;
UPDATE public."resources_resource" SET old_id=id;
INSERT INTO temp."crm_gf_Resource" (
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
INSERT INTO temp."crm_gf_Contact" 
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

INSERT INTO temp."crm_gf_ContactRole" (
    "id",
    "name",
    "is_active"
    )
SELECT
    "id",
    "name",
    "is_active"
FROM public."resources_contactrole";

INSERT INTO temp."crm_gf_ResourceNote" (
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

INSERT INTO temp."crm_gf_ResourceType" (
    "id",
    "name",
    "is_active"
    )
SELECT
    "id",
    "name",
    "is_active"
FROM public."resources_resourcetype";

INSERT INTO temp."crm_gf_Resource_resource_type" (
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

INSERT INTO temp."crm_gf_OtherName" (
    "name"
    )
SELECT
    "known_name"
FROM public."resources_resource";


-- temp."crm_gf_ResourceNameType"










-- INSERT INTO temp."crm_gf_Entity" (
--     "id",


--     )
-- SELECT
--     "id",


-- FROM public."resources_resourcenote";

