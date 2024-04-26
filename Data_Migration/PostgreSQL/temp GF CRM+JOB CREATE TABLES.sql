CREATE TABLE temp."crm_gf_AssociationGroup" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(50) NOT NULL,
  -- "type_of_group" ManyToManyField NOT NULL,
  "current" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."crm_gf_Contact" (
  "id" SERIAL PRIMARY KEY,
  "old_id" INTEGER UNIQUE,
  "resource" INTEGER NOT NULL,
  "old_resource" INTEGER,
  "first_name" VARCHAR(100) NOT NULL,
  "last_name" VARCHAR(100) NOT NULL,
  "job_title" VARCHAR(100) NOT NULL,
  "email_address" VARCHAR(254) NOT NULL,
  "phone_number" VARCHAR(25) NOT NULL,
  -- "contact_roles" ManyToManyField NOT NULL,
  "notes" TEXT NOT NULL,
  "is_active" BOOLEAN DEFAULT TRUE NOT NULL,
  "known_as" VARCHAR(100),
  "linked_entity" INTEGER
);

CREATE TABLE temp."crm_gf_ContactRole" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(100) UNIQUE NOT NULL,
  "is_active" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."crm_gf_ResourceNote" (
  "id" SERIAL PRIMARY KEY,
  "resource" INTEGER NOT NULL,
  "old_resource" INTEGER,
  "added_date" DATE DEFAULT CURRENT_DATE NOT NULL,
  -- "assignee" ManyToManyField NOT NULL,
  "note" TEXT
);

CREATE TABLE temp."crm_gf_Entity" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(100) NOT NULL,
  "parent" INTEGER,
  "short_name" VARCHAR(50) NOT NULL,
  "old_resource" INTEGER,
  "old_contact" INTEGER,
  "nzbn" VARCHAR(20) UNIQUE,
  "entity_type" INTEGER NOT NULL,
  -- "locations" ManyToManyField NOT NULL,
  -- "tax_specs" ManyToManyField NOT NULL,
  -- "roles" ManyToManyField NOT NULL,
  -- "qualifications" ManyToManyField NOT NULL,
  -- "skills" ManyToManyField NOT NULL,
  -- "assignments" ManyToManyField NOT NULL,
  -- "relationships" ManyToManyField NOT NULL,
  -- "system_associations" ManyToManyField NOT NULL,
  -- "responsibilities" ManyToManyField NOT NULL,
  -- "group_associations" ManyToManyField NOT NULL,
  "pending" BOOLEAN DEFAULT FALSE NOT NULL
);
  ALTER TABLE temp."crm_gf_Entity" ADD CONSTRAINT fk_Entity_parent FOREIGN KEY ("parent") REFERENCES temp."crm_gf_Entity"("id");
-- INSERT INTO "crm_gf_Entity" VALUES(DEFAULT, lastval());

CREATE TABLE temp."crm_gf_EntityAssignmentLink" (
  "entity" INTEGER NOT NULL,
  "assignment" INTEGER NOT NULL,
  -- "regions" ManyToManyField NOT NULL
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY("entity","assignment")
);

CREATE TABLE temp."crm_gf_EntityEmailAddress" (
  "id" SERIAL PRIMARY KEY,
  "entity" INTEGER NOT NULL,
  "email_address" VARCHAR(254) NOT NULL,
  -- "contact_types" ManyToManyField,
  "current" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."crm_gf_EntityLocationLink" (
  "entity" INTEGER NOT NULL,
  "address" INTEGER NOT NULL,
  -- "location_types" ManyToManyField,
  "current" BOOLEAN DEFAULT TRUE NOT NULL,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("entity", "address")
);

CREATE TABLE temp."crm_gf_EntityNote" (
  "id" SERIAL PRIMARY KEY,
  "entity" INTEGER NOT NULL,
  "created" TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "creator" INTEGER NOT NULL,
  "last_modified" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  "last_modified_by" INTEGER NOT NULL,
  "pinned" BOOLEAN DEFAULT FALSE,
  "note" TEXT
);

CREATE TABLE temp."crm_gf_EntityPhoneNumber" (
  "id" SERIAL PRIMARY KEY,
  "entity" INTEGER NOT NULL,
  "phone_number" VARCHAR(25) NOT NULL,
  -- "contact_types" ManyToManyField NOT NULL,
  "current" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."crm_gf_EntityQualificationLink" (
  "entity" INTEGER NOT NULL,
  "qualification" INTEGER NOT NULL,
  "expiration_date" DATE,
  "qualification_reference" VARCHAR(50) NOT NULL,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY("entity","qualification")
);

CREATE TABLE temp."crm_gf_EntityRelationshipLink" (
  "entity" INTEGER NOT NULL,
  "relationship" INTEGER NOT NULL,
  "start_date" DATE DEFAULT CURRENT_DATE NOT NULL,
  "end_date" DATE,
  "pending" BOOLEAN DEFAULT FALSE NOT NULL,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY("entity","relationship")
);

CREATE TABLE temp."crm_gf_EntityRoleLink" (
  "entity" INTEGER NOT NULL,
  "role" INTEGER NOT NULL,
  "role_detail" VARCHAR(100) NOT NULL,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY("entity","role")
);

CREATE TABLE temp."crm_gf_EntitySkillLink" (
  "entity" INTEGER NOT NULL,
  "skill" INTEGER NOT NULL,
  "rating" INTEGER,
  "last_reviewed" TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY("entity","skill")
);

CREATE TABLE temp."crm_gf_EntitySystemAssociationLink" (
  "entity" INTEGER NOT NULL,
  "system" INTEGER NOT NULL,
  "association_reference" VARCHAR(255) NOT NULL,
  "association_category" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY("entity","system")
);

CREATE TABLE temp."crm_gf_EntityTaxSpecificationLink" (
  "entity" INTEGER NOT NULL,
  "tax_specification" INTEGER NOT NULL,
  "tax_id_number" VARCHAR(9) NOT NULL,
  "effective_date" DATE NOT NULL,
  "end_date" DATE,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("entity", "tax_specification")
);

CREATE TABLE temp."crm_gf_NameType" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "type" VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE temp."crm_gf_OtherName" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE temp."crm_gf_Resource" (
  "id" SERIAL PRIMARY KEY,
  "old_id" INTEGER UNIQUE,
  "legal_name" VARCHAR(100) UNIQUE NOT NULL,
  "known_name" VARCHAR(100) NOT NULL,
  -- "other_names" ManyToManyField NOT NULL,
  "is_company" BOOLEAN DEFAULT TRUE NOT NULL,
  "main_address" INTEGER,
  "nzbn" VARCHAR(20) NOT NULL,
  "nzbn_status" INTEGER ,
  "last_credit_check" DATE,
  -- "resource_type" ManyToManyField NOT NULL,
  "resource_notes" TEXT NOT NULL,
  "linked_entity" INTEGER
);

CREATE TABLE temp."crm_gf_Resource_resource_type" (
  "Resource_id" INTEGER NOT NULL,
  "old_Resource_id" INTEGER NOT NULL,
  "ResourceType_id" INTEGER NOT NULL,
  "id" SERIAL PRIMARY KEY
);

CREATE TABLE temp."crm_gf_ResourceNameType" (
  "name" INTEGER NOT NULL,
  "resource" INTEGER NOT NULL,
  "old_resource" INTEGER,
  "type" INTEGER NOT NULL,
  "id" SERIAL PRIMARY KEY NOT NULL
);

CREATE TABLE temp."crm_gf_ResourceType" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(100) UNIQUE NOT NULL,
  "is_active" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."crm_gf_StaffPayRate" (
  "id" SERIAL PRIMARY KEY,
  "staff_member" INTEGER NOT NULL,
  "pay_rate" DECIMAL(5,2) NOT NULL,
  "last_updated" DATE DEFAULT CURRENT_DATE NOT NULL
);

CREATE TABLE temp."crm_common_Assignment" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" VARCHAR(50) NOT NULL,
  "current" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."crm_common_AssociationCategory" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" VARCHAR(50) NOT NULL,
  "current" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."crm_common_AssociationGroupType" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" VARCHAR(50) NOT NULL,
  "current" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."crm_common_ComplianceItem" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" VARCHAR(50) NOT NULL,
  "current" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."crm_common_ContactType" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" VARCHAR(50) NOT NULL,
  "current" BOOLEAN DEFAULT TRUE NOT NULL
);
CREATE TABLE temp."crm_common_EntityType" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" VARCHAR(50) NOT NULL,
  "current" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."crm_common_LocationType" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" VARCHAR(50) NOT NULL,
  "current" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."crm_common_Qualification" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" VARCHAR(50) NOT NULL,
  -- "provided_compliance_items" ManyToManyField NOT NULL,
  "validity" INTEGER DEFAULT 24 NOT NULL,
  "current" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."crm_common_Relationship" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" VARCHAR(50) NOT NULL,
  "current" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."crm_common_Responsibility" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" VARCHAR(50) NOT NULL,
  "current" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."crm_common_Skill" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" VARCHAR(50) NOT NULL,
  "linked_service" INTEGER,
  "current" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."crm_common_SystemAssociation" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "system_type" INTEGER NOT NULL,
  "system_instance" VARCHAR(100) NOT NULL,
  "current" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."crm_common_SystemType" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" VARCHAR(50) NOT NULL,
  "library" VARCHAR(50) NOT NULL,
  "current" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."crm_common_TaxSpecification" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "tax_type" INTEGER NOT NULL,
  "tax_rate" DECIMAL(4,2) NOT NULL,
  "current" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."crm_common_TaxType" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" VARCHAR(50) NOT NULL,
  "current" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."crm_common_Qualification_provided_compliance_items" (
  "Qualification_id" INTEGER,
  "ComplianceItem_id" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY("Qualification_id","ComplianceItem_id")
);



CREATE TABLE temp."job_common_Category" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(50) NOT NULL,
  "current_category" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."job_common_DayWorkRates" (
  "id" SERIAL PRIMARY KEY,
  "rate" DECIMAL(5,2) NOT NULL,
  "current" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."job_common_JobExternalAssociationType" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(25) UNIQUE NOT NULL,
  "current" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."job_common_LongLeadTimeProducts" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(25) UNIQUE NOT NULL,
  "min_lead_time" INTEGER,
  "max_lead_time" INTEGER,
  "current" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."job_common_MeasureUnit" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(50) NOT NULL,
  "unit" VARCHAR(25) NOT NULL,
  "unit_symbol_unicode" VARCHAR(25) NOT NULL,
  "unit_symbol_unicode_slash" VARCHAR(25) NOT NULL
);

CREATE TABLE temp."job_common_OfferedService" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" VARCHAR(50) NOT NULL,
  "service_order" SMALLINT DEFAULT 10 NOT NULL,
  "current_service" BOOLEAN NOT NULL,
  "show_text" BOOLEAN DEFAULT TRUE NOT NULL,
  "show_pay_supplier" BOOLEAN DEFAULT FALSE NULL,
  "show_pay_rates" BOOLEAN DEFAULT FALSE NOT NULL,
  "contract_mjs" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."job_common_PriceType" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(50) NOT NULL,
  "current_type" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."job_common_Product" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(50) NOT NULL,
  "unit" INTEGER NOT NULL
);

CREATE TABLE temp."job_common_QSCheckItem" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(200) NOT NULL,
  "active" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."job_common_ReportingArea" (
  "id" SERIAL PRIMARY KEY,
  "area_name" VARCHAR(100) NOT NULL,
  -- "regions" ManyToManyField NOT NULL,
  "current_area" BOOLEAN DEFAULT TRUE NOT NULL,
  "ordering" INTEGER DEFAULT 1 NOT NULL
);



CREATE TABLE temp."jobs_Address" (
  "id" SERIAL PRIMARY KEY,
  "number" VARCHAR(25) NOT NULL,
  "road_name" VARCHAR(100) NOT NULL,
  "suburb" VARCHAR(100) NOT NULL,
  "town_city" VARCHAR(100) NOT NULL,
  "post_code" VARCHAR(10) NOT NULL,
  "country" VARCHAR(50) DEFAULT 'New Zealand' NOT NULL,
  "latitude" DECIMAL(20,17),
  "longitude" DECIMAL(20,17),
  "place_id" VARCHAR(100) NOT NULL,
  "address_note" TEXT NOT NULL
);

CREATE TABLE temp."jobs_BuildingConsentBase" (
  "id" SERIAL PRIMARY KEY,
  "building_consent_number" VARCHAR(25) UNIQUE NOT NULL,
  "legal_description" TEXT NOT NULL,
  "consented_area" VARCHAR(25) NOT NULL
);

CREATE TABLE temp."jobs_BuildingConsent" (
  "id" SERIAL PRIMARY KEY,
  "building_consent_number" VARCHAR(25) UNIQUE NOT NULL,
  "legal_description" TEXT NOT NULL,
  "consented_area" VARCHAR(25) NOT NULL
);

CREATE TABLE temp."jobs_CSQ" (
  "id" SERIAL PRIMARY KEY,
  "reference" VARCHAR(50) NOT NULL,
  "manufacturer" INTEGER,
  "merchant" INTEGER,
  "valid_from" DATE,
  "valid_to" DATE
);

CREATE TABLE temp."jobs_JobExternalAssociation" (
  "id" SERIAL PRIMARY KEY,
  "job" INTEGER,
  "association_type" INTEGER NOT NULL,
  "association_key" VARCHAR(50) NOT NULL
);

CREATE TABLE temp."jobs_JobLongLeadProductLink" (
  "job" INTEGER NOT NULL,
  "long_lead_product" INTEGER NOT NULL,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("job","long_lead_product")
);

CREATE TABLE temp."jobs_JobNoteFollowUp" (
  "note_id" SERIAL PRIMARY KEY,
  "assigned_to" INTEGER,
  -- "also_notify" ManyToManyField NOT NULL,
  "due_date" DATE NOT NULL,
  "completed_at" TIMESTAMP,
  "completed_by" INTEGER
);

CREATE TABLE temp."jobs_JobNote" (
  "id" SERIAL PRIMARY KEY,
  "job" INTEGER NOT NULL,
  "original" INTEGER,
  "created_by" INTEGER,
  "created_at" TIMESTAMP NOT NULL,
  "last_modified_by" INTEGER,
  "last_modified_at" TIMESTAMP NOT NULL,
  "pinned" BOOLEAN DEFAULT FALSE NOT NULL,
  "note" TEXT NOT NULL
  -- "associated_files" ManyToManyField NOT NULL
);
  ALTER TABLE temp."jobs_JobNote" ADD CONSTRAINT fk_JobNote_original FOREIGN KEY ("original") REFERENCES temp."jobs_JobNote"("id");
-- INSERT INTO "jobs_JobNote" VALUES(DEFAULT, lastval());

CREATE TABLE temp."jobs_JobNotificationLog" (
  "id" SERIAL PRIMARY KEY,
  "job" INTEGER NOT NULL,
  "notification_sent" TIMESTAMP NOT NULL,
  "notification_type" TIMESTAMP NOT NULL
);

CREATE TABLE temp."jobs_JobNotificationRecipient" (
  "id" SERIAL PRIMARY KEY,
  "notification" INTEGER NOT NULL,
  "email_address" VARCHAR(254) NOT NULL
);

CREATE TABLE temp."jobs_JobQSChecklistLink" (
  "job" INTEGER NOT NULL,
  "check_item" INTEGER NOT NULL,
  "completed" BOOLEAN NOT NULL,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("job","check_item")
);

CREATE TABLE temp."jobs_JobRequestLongLeadProductLink" (
  "job_request" INTEGER NOT NULL,
  "long_lead_product" INTEGER NOT NULL,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("job_request", "long_lead_product")
);

CREATE TABLE temp."jobs_JobRequestQSChecklistLink" (
  "job_request" INTEGER NOT NULL,
  "check_item" INTEGER NOT NULL,
  "completed" BOOLEAN NOT NULL,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("job_request","check_item")
);

CREATE TABLE temp."jobs_JobRequestServiceLink" (
  "job_request" INTEGER NOT NULL,
  "service" INTEGER NOT NULL,
  "variation" BOOLEAN DEFAULT FALSE NOT NULL,
  "variation_reference" VARCHAR(100) NOT NULL,
  "notes" TEXT NOT NULL,
  "cost" DECIMAL(11,2) DEFAULT 0 NOT NULL,
  "supplier" VARCHAR(100) NOT NULL,
  "supplier_entity" INTEGER,
  "pay_supplier" DECIMAL(11,2),
  "pricebook" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("job_request","service")
);

CREATE TABLE temp."jobs_JobRequest" (
  "id" SERIAL PRIMARY KEY,
  "quote_identifier" VARCHAR(100) NOT NULL,
  "resource" INTEGER,
  "old_resource" INTEGER,
  "client_qs" INTEGER,
  "old_client_qs" INTEGER,
  "fire_engineer" INTEGER,
  "internal_qs" INTEGER,
  "internal_supervisor" INTEGER,
  "business_category" INTEGER NOT NULL,
  "job_name" VARCHAR(100) NOT NULL,
  "main_address" INTEGER NOT NULL,
  "region" INTEGER DEFAULT 1 NOT NULL,
  "price_type" INTEGER NOT NULL,
  "linings_on_job" BOOLEAN DEFAULT FALSE NOT NULL,
  -- "job_services" ManyToManyField NOT NULL,
  -- "qs_checklist" ManyToManyField NOT NULL,
  "job_notes" TEXT NOT NULL,
  "sub_address_identifier" VARCHAR(100) NOT NULL,
  "claim_date" SMALLINT,
  "dl_period" INTEGER DEFAULT 0 NOT NULL,
  "retention_threshold_one" DECIMAL(11,2) DEFAULT 0 NOT NULL,
  "retention_threshold_two" DECIMAL(11,2) DEFAULT 0 NOT NULL,
  "retention_threshold_three" DECIMAL(11,2) DEFAULT 0 NOT NULL,
  "retention_percentage_one" DECIMAL(4,2) DEFAULT 0 NOT NULL,
  "retention_percentage_two" DECIMAL(4,2) DEFAULT 0 NOT NULL,
  "retention_percentage_three" DECIMAL(4,2) DEFAULT 0 NOT NULL,
  "admin_verify_details" BOOLEAN DEFAULT TRUE NOT NULL,
  "job_request_date" DATE NOT NULL,
  "final_bill_date" DATE,
  "rejected" BOOLEAN DEFAULT FALSE NOT NULL,
  "client" INTEGER NOT NULL,
  "client_qs_entity" INTEGER,
  "out_of_zone_distance" INTEGER DEFAULT 0 NOT NULL,
  "vaccine_required" BOOLEAN DEFAULT FALSE NOT NULL,
  "csq_reference" VARCHAR(50) NOT NULL,
  -- "job_csq" ManyToManyField NOT NULL,
  -- "long_lead_products" ManyToManyField NOT NULL,
  -- "consent" ManyToManyField NOT NULL,
  "legal_description" TEXT NOT NULL,
  "day_work_rate" INTEGER DEFAULT 1 NOT NULL
);

CREATE TABLE temp."jobs_JobServiceLink" (
  "job" INTEGER NOT NULL,
  "service" INTEGER NOT NULL,
  "variation" BOOLEAN DEFAULT FALSE NOT NULL,
  "variation_reference" VARCHAR(100) NOT NULL,
  "notes" TEXT NOT NULL,
  "cost" DECIMAL(11,2) NOT NULL,
  "supplier" VARCHAR(100) NOT NULL,
  "supplier_entity" INTEGER,
  "pay_supplier" DECIMAL(11,2),
  "pricebook" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("job","service")
);

CREATE TABLE temp."jobs_Job" (
  "id" SERIAL PRIMARY KEY,
  "quote_identifier" VARCHAR(100) NOT NULL,
  "resource" INTEGER NOT NULL,
  "old_resource" INTEGER,
  "client_qs" INTEGER,
  "old_client_qs" INTEGER,
  "fire_engineer" INTEGER,
  "internal_qs" INTEGER,
  "internal_supervisor" INTEGER,
  "business_category" INTEGER NOT NULL,
  -- "prestart_attendees" ManyToManyField NOT NULL,
  "prestart_date" DATE,
  "job_name" VARCHAR(100) NOT NULL,
  "main_address" INTEGER NOT NULL,
  "region" INTEGER NOT NULL,
  "wiw_site_id" INTEGER,
  "pp_project_id" INTEGER,
  "job_request_id" INTEGER,
  "price_type" INTEGER NOT NULL,
  "linings_on_job" BOOLEAN DEFAULT FALSE NOT NULL,
  -- "job_services" ManyToManyField NOT NULL,
  -- "qs_checklist" ManyToManyField NOT NULL,
  "job_notes" TEXT NOT NULL,
  "sub_address_identifier" VARCHAR(100) NOT NULL,
  "claim_date" SMALLINT,
  "dl_period" INTEGER NOT NULL,
  "retention_threshold_one" DECIMAL(11,2) DEFAULT 0 NOT NULL,
  "retention_threshold_two" DECIMAL(11,2) DEFAULT 0 NOT NULL,
  "retention_threshold_three" DECIMAL(11,2) DEFAULT 0 NOT NULL,
  "retention_percentage_one" DECIMAL(4,2) DEFAULT 0 NOT NULL,
  "retention_percentage_two" DECIMAL(4,2) DEFAULT 0 NOT NULL,
  "retention_percentage_three" DECIMAL(4,2) DEFAULT 0 NOT NULL,
  "admin_verify_details" BOOLEAN DEFAULT TRUE NOT NULL,
  "job_creation_date" DATE NOT NULL,
  "final_bill_date" DATE,
  "client" INTEGER NOT NULL,
  "client_qs_entity" INTEGER,
  "out_of_zone_distance" INTEGER NOT NULL,
  "vaccine_required" BOOLEAN DEFAULT FALSE NOT NULL,
  -- "job_csq" ManyToManyField NOT NULL,
  -- "long_lead_products" ManyToManyField NOT NULL,
  -- "consent" ManyToManyField NOT NULL,
  "legal_description" TEXT NOT NULL,
  "day_work_rate" INTEGER NOT NULL,
  "job_operational_approval_datetime" TIMESTAMP,
  "job_operational_approval_user" INTEGER,
  "user_hidden_job" BOOLEAN DEFAULT FALSE NOT NULL,
  "legacy_job_id" VARCHAR(25) NOT NULL,
  "under_review" BOOLEAN DEFAULT FALSE NOT NULL,
  "latitude" DECIMAL(20,17),
  "longitude" DECIMAL(20,17)
);

CREATE TABLE temp."jobs_StoredFile" (
  "id" SERIAL PRIMARY KEY,
  "request_job" INTEGER,
  "approved_job" INTEGER,
  "original_file_name" VARCHAR(100) NOT NULL,
  "object_path" VARCHAR(100) NOT NULL,
  "file_size" BIGINT NOT NULL,
  "file_category" INTEGER NOT NULL,
  "content_type" VARCHAR(100) NOT NULL,
  "stored_datetime" TIMESTAMP NOT NULL,
  "stored_by" INTEGER,
  "original" INTEGER NOT NULL
);
  ALTER TABLE temp."jobs_StoredFile" ADD CONSTRAINT fk_StoredFile_original FOREIGN KEY ("original") REFERENCES temp."jobs_StoredFile"("id");
-- INSERT INTO "jobs_StoredFile" VALUES(DEFAULT, lastval());

CREATE TABLE temp."jobs_Variation" (
  "id" SERIAL PRIMARY KEY,
  "job" INTEGER NOT NULL,
  "variation_number" INTEGER NOT NULL,
  "date_created" DATE NOT NULL,
  "variation_summary" TEXT NOT NULL
  -- "associated_files" ManyToManyField NOT NULL
);




CREATE TABLE temp."pricing_PriceBook" (
  "id" SERIAL PRIMARY KEY,
  "entity" INTEGER NOT NULL,
  "pricebook_reference" VARCHAR(50) NOT NULL,
  -- "pricebook_attributes" ManyToManyField NOT NULL,
  "csq_association" INTEGER,
  "added_at" TIMESTAMP NOT NULL,
  "effective_from" DATE NOT NULL,
  "expiration_date" DATE
);

CREATE TABLE temp."pricing_PricingAttribute" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(50) NOT NULL,
  "current" BOOLEAN NOT NULL
);




CREATE TABLE temp."globaluser_GlobalUser_global_vehicle" (
  "GlobalUser_id" INTEGER,
  "stock_v2_Vehicle_id" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("GlobalUser_id", "stock_v2_Vehicle_id")
);

CREATE TABLE temp."globaluser_GlobalUser_authorised_company" (
  "GlobalUser_id" INTEGER,
  "GlobalCompany_id" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("GlobalUser_id", "GlobalCompany_id")
);

CREATE TABLE temp."globaluser_GlobalUser_user_app_permission" (
  "GlobalUser_id" INTEGER,
  "AppPermission_id" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("GlobalUser_id", "AppPermission_id")
);

CREATE TABLE temp."crm_gf_ResourceNote_assignee" (
  "ResourceNote_id" INTEGER,
  "GlobalUser_id" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("ResourceNote_id", "GlobalUser_id")
);

CREATE TABLE temp."crm_gf_EntityEmailAddress_contact_types" (
  "EntityEmailAddress_id" INTEGER,
  "ContactType_id" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("EntityEmailAddress_id", "ContactType_id")
);

CREATE TABLE temp."crm_gf_EntityPhoneNumber_contact_types" (
  "EntityPhoneNumber_id" INTEGER,
  "ContactType_id" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("EntityPhoneNumber_id", "ContactType_id")
);

CREATE TABLE temp."crm_gf_EntityLocationLink_location_types" (
  "EntityLocationLink_id" INTEGER,
  "LocationType_id" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("EntityLocationLink_id", "LocationType_id")
);

CREATE TABLE temp."crm_gf_Entity_responsibilities" (
  "Entity_id" INTEGER,
  "Responsibility_id" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("Entity_id", "Responsibility_id")
);


CREATE TABLE temp."crm_gf_Entity_group_associations" (
  "Entity_id" INTEGER,
  "AssociationGroup_id" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("Entity_id", "AssociationGroup_id")
);


CREATE TABLE temp."crm_gf_AssociationGroup_type_of_group" (
  "AssociationGroup_id" INTEGER,
  "AssociationGroupType_id" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("AssociationGroup_id", "AssociationGroupType_id")
);

CREATE TABLE temp."crm_gf_Contact_Contact_Roles" (
  "contact_id" INTEGER,
  "old_contact_id" INTEGER,
  "ContactRole_id" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("contact_id", "ContactRole_id")
);

CREATE TABLE temp."crm_gf_EntityAssignmentLink_regions" (
  "EntityAssignmentLink_id" INTEGER,
  "NZRegion_id" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("EntityAssignmentLink_id", "NZRegion_id")
);


CREATE TABLE temp."jobs_JobRequest_job_csq" (
  "JobRequest_id" INTEGER,
  "CSQ_id" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("JobRequest_id", "CSQ_id")
);

CREATE TABLE temp."jobs_JobRequest_consent" (
  "JobRequest_id" INTEGER,
  "BuildingConsent_id" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("JobRequest_id", "BuildingConsent_id")
);

CREATE TABLE temp."jobs_Job_prestart_attendees" (
  "Job_id" INTEGER,
  "GlobalUser_id" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("Job_id", "GlobalUser_id")
);

CREATE TABLE temp."jobs_Job_job_csq" (
  "Job_id" INTEGER,
  "CSQ_id" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("Job_id", "CSQ_id")
);

CREATE TABLE temp."jobs_Job_consent" (
  "Job_id" INTEGER,
  "BuildingConsent_id" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("Job_id", "BuildingConsent_id")
);

CREATE TABLE temp."jobs_JobNote_associated_files" (
  "JobNote_id" INTEGER,
  "StoredFile_id" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("JobNote_id", "StoredFile_id")
);

CREATE TABLE temp."job_common_ReportingArea_regions" (
  "ReportingArea_id" INTEGER,
  "NZRegion_id" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("ReportingArea_id", "NZRegion_id")
);

CREATE TABLE temp."pricing_PriceBook_pricebook_attributes" (
  "PriceBook_id" INTEGER,
  "PricingAttribute_id" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("PriceBook_id", "PricingAttribute_id")
);

CREATE TABLE temp."jobs_JobNoteFollowUp_also_notify" (
  "JobNoteFollowUp_id" INTEGER,
  "GlobalUser_id" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("JobNoteFollowUp_id", "GlobalUser_id")
);

CREATE TABLE temp."jobs_Variation_associated_files" (
  "Variation_id" INTEGER,
  "StoredFile_id" INTEGER,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY ("Variation_id", "StoredFile_id")
);


CREATE TABLE temp."stock_v2_Vehicle" (
  "id" INTEGER PRIMARY KEY,
  "name" VARCHAR(100) NOT NULL,
  "stock_location" INTEGER
);

CREATE TABLE temp."stock_v2_StockLocationType" (
  "id" INTEGER PRIMARY KEY,
  "name" VARCHAR(100) NOT NULL,
  "record_stock_level" BOOLEAN DEFAULT FALSE NOT NULL
);

CREATE TABLE temp."stock_v2_StockLocation"(
  "id" INTEGER PRIMARY KEY,
  "name" VARCHAR(100) NOT NULL,
  -- "product_variants" ManyToManyField NOT NULL,
  "type" INTEGER NOT NULL,
  "is_infinite" BOOLEAN DEFAULT FALSE NOT NULL,
  "is_active" BOOLEAN DEFAULT TRUE NOT NULL,
  "portal_job_id" INTEGER
);

CREATE TABLE temp."stock_v2_StockLevel"(
  "stock_location" INTEGER NOT NULL,
  "product_variants" INTEGER NOT NULL,
  "minimum_quantity" SMALLINT DEFAULT 0 NOT NULL,
  "order_at_quantity" SMALLINT DEFAULT 0 NOT NULL,
  "on_hand_quantity" SMALLINT DEFAULT 0 NOT NULL,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY("stock_location","product_variants")
);

CREATE TABLE temp."products_Brand"(
  "id" INTEGER PRIMARY KEY,
  "name" VARCHAR(100) UNIQUE NOT NULL,
  "is_active" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."products_ProductType"(
  "id" INTEGER PRIMARY KEY,
  "name" VARCHAR(100) UNIQUE NOT NULL,
  "is_active" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."products_Product"(
  "id" INTEGER PRIMARY KEY,
  "name" VARCHAR(100) NOT NULL,
  "brand" INTEGER NOT NULL,
  "product_type" INTEGER NOT NULL,
  "is_active" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."products_ProductUnit"(
  "id" INTEGER PRIMARY KEY,
  "name" VARCHAR(100) UNIQUE NOT NULL,
  "is_active" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."products_ProductVariant"(
  "id" INTEGER PRIMARY KEY,
  "name" VARCHAR(100) NOT NULL,
  "product" INTEGER NOT NULL,
  -- "valid_unit" ManyToManyField NOT NULL,
  "base_unit" INTEGER
);

CREATE TABLE temp."products_ValidUnit"(
  "product_unit" INTEGER NOT NULL,
  "product_variant" INTEGER NOT NULL,
  "base" INTEGER NOT NULL,
  "is_active" BOOLEAN DEFAULT TRUE NOT NULL,
  "is_supplier_ordering_unit" BOOLEAN DEFAULT FALSE NOT NULL,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY("product_unit","product_variant")
);

CREATE TABLE temp."products_Supplier"(
  "id" INTEGER PRIMARY KEY,
  "resource" INTEGER NOT NULL,
  "old_resource" INTEGER,
  -- "stock_location" ManyToManyField NOT NULL,
  "is_active" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."products_Supplier_stock_location"(
  "Supplier_id" INTEGER NOT NULL,
  "StockLocation_id" INTEGER NOT NULL,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY("Supplier_id","StockLocation_id")
);

CREATE TABLE temp."products_SupplierPricing"(
  "id" INTEGER PRIMARY KEY,
  "reference" VARCHAR(100) NOT NULL,
  "supplier" INTEGER NOT NULL,
  -- "product_variant" ManyToManyField NOT NULL,
  "effective_date" TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE temp."products_SupplierVariantItemPricing"(
  "product_variant" INTEGER NOT NULL,
  "supplier_pricing" INTEGER NOT NULL,
  "pricing" DECIMAL(8,2) NOT NULL,
  "quantity" SMALLINT NOT NULL,
  "order_unit" INTEGER NOT NULL,
  "is_active" BOOLEAN DEFAULT TRUE NOT NULL,
  "sku" VARCHAR(100) NOT NULL,
  "id" SERIAL PRIMARY KEY
  -- PRIMARY KEY("product_variant", "supplier_pricing")
);



CREATE TABLE temp."globaluser_AppName" (
  "id" INTEGER PRIMARY KEY,
  "name" VARCHAR(100) NOT NULL,
  "current_app" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."globaluser_AppPermissionLevel" (
  "id" INTEGER PRIMARY KEY,
  "name" VARCHAR(100) NOT NULL,
  "current_level" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."globaluser_AppPermission" (
  "id" INTEGER PRIMARY KEY,
  "app" INTEGER NOT NULL,
  "permission_level" INTEGER NOT NULL,
  "active_permission" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."globaluser_GlobalBrand" (
  "id" INTEGER PRIMARY KEY,
  "name" VARCHAR(100) NOT NULL,
  "current_brand" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."globaluser_GlobalCompany" (
  "id" INTEGER PRIMARY KEY,
  "brand" INTEGER NOT NULL,
  "region" INTEGER NOT NULL,
  "company_prefix" VARCHAR(100) NOT NULL,
  "active_company" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."globaluser_GlobalRole" (
  "id" INTEGER PRIMARY KEY,
  "name" VARCHAR(100) NOT NULL,
  "current_role" BOOLEAN DEFAULT TRUE NOT NULL
);

-- CREATE TABLE temp."globaluser_GlobalUser" (
--   "id" INTEGER PRIMARY KEY,
--   -- "role_held" ManyToManyField NOT NULL,
--   -- "authorised_company" ManyToManyField NOT NULL,
--   -- "user_app_permission" ManyToManyField NOT NULL,
--   "mobile_number" VARCHAR(25) NOT NULL,
--   "face_filename" VARCHAR(25) NOT NULL,
--   "home_region" INTEGER NOT NULL,
--   "manager" INTEGER
--   -- "global_vehicle" ManyToManyField NOT NULL
-- );
CREATE TABLE temp."globaluser_GlobalUser" (
  "id" INTEGER PRIMARY KEY,
  -- "role_held" ManyToManyField NOT NULL,
  -- "authorised_company" ManyToManyField NOT NULL,
  -- "user_app_permission" ManyToManyField NOT NULL,
  "mobile_number" VARCHAR(25),
  "face_filename" VARCHAR(25) NOT NULL,
  "home_region" INTEGER NOT NULL,
  "manager" INTEGER
  -- "global_vehicle" ManyToManyField NOT NULL
);

CREATE TABLE temp."globaluser_GlobalUser_role_held" (
  "GlobalUser_id" INTEGER NOT NULL,
  "GlobalRole_id" INTEGER NOT NULL,
  "id" INTEGER PRIMARY KEY
);

CREATE TABLE temp."globaluser_NZRegion" (
  "id" SERIAL PRIMARY KEY,
  "region_short_code" VARCHAR(3) NOT NULL,
  "region_name" VARCHAR(100) NOT NULL,
  "official_short_code" VARCHAR(6) NOT NULL
);

CREATE TABLE temp."globaluser_NZBNStatus" (
  "id" SERIAL PRIMARY KEY,
  "description" VARCHAR(100) NOT NULL,
  "good_status" BOOLEAN DEFAULT FALSE NOT NULL
);

CREATE TABLE temp."globaluser_OperatingRegion" (
  "id" INTEGER PRIMARY KEY,
  "name" VARCHAR(100) NOT NULL,
  "abbreviation" VARCHAR(100) NOT NULL,
  "current_region" BOOLEAN DEFAULT TRUE NOT NULL,
  "show_region" BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE temp."globaluser_SalaryStaff" (
  "user" INTEGER PRIMARY KEY,
  "start_date" DATE NOT NULL,
  "end_date" DATE,
  "employed_by" INTEGER NOT NULL
);

CREATE TABLE temp."globaluser_UploadedFileCategory" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(50) UNIQUE NOT NULL,
  "active" BOOLEAN NOT NULL,
  "operational" BOOLEAN DEFAULT FALSE NOT NULL,
  "administrative" BOOLEAN DEFAULT FALSE NOT NULL,
  "type_is_sensitive" BOOLEAN DEFAULT FALSE NOT NULL
);


ALTER TABLE temp."stock_v2_StockLocation" ADD FOREIGN KEY ("type") REFERENCES temp."stock_v2_StockLocationType"("id");
ALTER TABLE temp."stock_v2_StockLevel" ADD FOREIGN KEY ("stock_location") REFERENCES temp."stock_v2_StockLocation"("id");
ALTER TABLE temp."stock_v2_StockLevel" ADD FOREIGN KEY ("product_variants") REFERENCES temp."products_ProductVariant"("id");
ALTER TABLE temp."products_Product" ADD FOREIGN KEY ("brand") REFERENCES temp."products_Brand"("id");
ALTER TABLE temp."products_Product" ADD FOREIGN KEY ("product_type") REFERENCES temp."products_ProductType"("id");
ALTER TABLE temp."products_ProductVariant" ADD FOREIGN KEY ("product") REFERENCES temp."products_Product"("id");
ALTER TABLE temp."products_ProductVariant" ADD FOREIGN KEY ("base_unit") REFERENCES temp."products_ValidUnit"("id");
ALTER TABLE temp."products_ValidUnit" ADD FOREIGN KEY ("product_unit") REFERENCES temp."products_ProductUnit"("id");
ALTER TABLE temp."products_ValidUnit" ADD FOREIGN KEY ("product_variant") REFERENCES temp."products_ProductVariant"("id");
ALTER TABLE temp."products_Supplier" ADD FOREIGN KEY ("resource") REFERENCES temp."crm_gf_Resource"("id");
ALTER TABLE temp."products_Supplier" ADD FOREIGN KEY ("old_resource") REFERENCES temp."crm_gf_Resource"("old_id");
ALTER TABLE temp."products_Supplier_stock_location" ADD FOREIGN KEY ("Supplier_id") REFERENCES temp."products_Supplier"("id");
ALTER TABLE temp."products_Supplier_stock_location" ADD FOREIGN KEY ("StockLocation_id") REFERENCES temp."stock_v2_StockLocation"("id");
ALTER TABLE temp."products_SupplierPricing" ADD FOREIGN KEY ("supplier") REFERENCES temp."products_Supplier"("id");
ALTER TABLE temp."products_SupplierVariantItemPricing" ADD FOREIGN KEY ("product_variant") REFERENCES temp."products_ProductVariant"("id");
ALTER TABLE temp."products_SupplierVariantItemPricing" ADD FOREIGN KEY ("supplier_pricing") REFERENCES temp."products_SupplierPricing"("id");
ALTER TABLE temp."products_SupplierVariantItemPricing" ADD FOREIGN KEY ("order_unit") REFERENCES temp."products_ValidUnit"("id");

ALTER TABLE temp."crm_gf_Contact_Contact_Roles" ADD FOREIGN KEY ("contact_id") REFERENCES temp."crm_gf_Contact"("id");
ALTER TABLE temp."crm_gf_Contact_Contact_Roles" ADD FOREIGN KEY ("old_contact_id") REFERENCES temp."crm_gf_Contact"("old_id");
ALTER TABLE temp."crm_gf_Contact_Contact_Roles" ADD FOREIGN KEY ("ContactRole_id") REFERENCES temp."crm_gf_ContactRole"("id");

ALTER TABLE temp."crm_gf_Entity" ADD FOREIGN KEY ("old_resource") REFERENCES temp."crm_gf_Resource"("old_id");
ALTER TABLE temp."crm_gf_Entity" ADD FOREIGN KEY ("old_contact") REFERENCES temp."crm_gf_Contact"("old_id");

ALTER TABLE temp."stock_v2_Vehicle" ADD FOREIGN KEY ("stock_location") REFERENCES temp."stock_v2_StockLocation"("id");

ALTER TABLE temp."crm_gf_EntityLocationLink" ADD FOREIGN KEY ("entity") REFERENCES temp."crm_gf_Entity" ("id");

ALTER TABLE temp."crm_gf_EntityLocationLink" ADD FOREIGN KEY ("address") REFERENCES temp."jobs_Address" ("id");

ALTER TABLE temp."crm_gf_EntityTaxSpecificationLink" ADD FOREIGN KEY ("entity") REFERENCES temp."crm_gf_Entity" ("id");

ALTER TABLE temp."crm_gf_EntityTaxSpecificationLink" ADD FOREIGN KEY ("tax_specification") REFERENCES temp."crm_common_TaxSpecification" ("id");

ALTER TABLE temp."crm_gf_EntityRoleLink" ADD FOREIGN KEY ("entity") REFERENCES temp."crm_gf_Entity" ("id");

ALTER TABLE temp."crm_gf_EntityRoleLink" ADD FOREIGN KEY ("role") REFERENCES temp."job_common_OfferedService" ("id");

ALTER TABLE temp."crm_gf_EntityQualificationLink" ADD FOREIGN KEY ("entity") REFERENCES temp."crm_gf_Entity" ("id");

ALTER TABLE temp."crm_gf_EntityQualificationLink" ADD FOREIGN KEY ("qualification") REFERENCES temp."crm_common_Qualification" ("id");

ALTER TABLE temp."crm_gf_EntitySkillLink" ADD FOREIGN KEY ("entity") REFERENCES temp."crm_gf_Entity" ("id");

ALTER TABLE temp."crm_gf_EntitySkillLink" ADD FOREIGN KEY ("skill") REFERENCES temp."crm_common_Skill" ("id");

ALTER TABLE temp."crm_gf_EntityAssignmentLink" ADD FOREIGN KEY ("entity") REFERENCES temp."crm_gf_Entity" ("id");

ALTER TABLE temp."crm_gf_EntityAssignmentLink" ADD FOREIGN KEY ("assignment") REFERENCES temp."crm_common_Assignment" ("id");

ALTER TABLE temp."crm_gf_EntityRelationshipLink" ADD FOREIGN KEY ("entity") REFERENCES temp."crm_gf_Entity" ("id");

ALTER TABLE temp."crm_gf_EntityRelationshipLink" ADD FOREIGN KEY ("relationship") REFERENCES temp."crm_common_Relationship" ("id");

ALTER TABLE temp."crm_gf_EntitySystemAssociationLink" ADD FOREIGN KEY ("entity") REFERENCES temp."crm_gf_Entity" ("id");

ALTER TABLE temp."crm_gf_EntitySystemAssociationLink" ADD FOREIGN KEY ("system") REFERENCES temp."crm_common_SystemAssociation" ("id");

ALTER TABLE temp."crm_common_Qualification_provided_compliance_items" ADD FOREIGN KEY ("Qualification_id") REFERENCES temp."crm_common_Qualification" ("id");
ALTER TABLE temp."crm_common_Qualification_provided_compliance_items" ADD FOREIGN KEY ("ComplianceItem_id") REFERENCES temp."crm_common_ComplianceItem" ("id");

ALTER TABLE temp."crm_gf_StaffPayRate" ADD CONSTRAINT "fk_Entity" FOREIGN KEY("staff_member") REFERENCES temp."crm_gf_StaffPayRate"("id");

ALTER TABLE temp."jobs_Job" ADD CONSTRAINT "fk_JobRequest" FOREIGN KEY ("job_request_id") REFERENCES temp."jobs_JobRequest"("id");

ALTER TABLE temp."jobs_JobRequestServiceLink" ADD FOREIGN KEY ("job_request") REFERENCES temp."jobs_JobRequest" ("id");

ALTER TABLE temp. "jobs_JobRequestServiceLink" ADD FOREIGN KEY ("service") REFERENCES temp."job_common_OfferedService" ("id");

ALTER TABLE temp."jobs_JobRequestLongLeadProductLink" ADD FOREIGN KEY ("job_request") REFERENCES temp."jobs_JobRequest" ("id");

ALTER TABLE temp. "jobs_JobRequestLongLeadProductLink" ADD FOREIGN KEY ("long_lead_product") REFERENCES temp."job_common_LongLeadTimeProducts" ("id");

ALTER TABLE temp."jobs_JobRequestQSChecklistLink" ADD FOREIGN KEY ("job_request") REFERENCES temp."jobs_JobRequest" ("id");

ALTER TABLE temp."jobs_JobRequestQSChecklistLink" ADD FOREIGN KEY ("check_item") REFERENCES temp."job_common_QSCheckItem" ("id");

ALTER TABLE temp. "jobs_JobServiceLink" ADD FOREIGN KEY ("job") REFERENCES temp."jobs_Job" ("id");

ALTER TABLE temp. "jobs_JobServiceLink" ADD FOREIGN KEY ("service") REFERENCES temp."job_common_OfferedService" ("id");

ALTER TABLE temp. "jobs_JobLongLeadProductLink" ADD FOREIGN KEY ("job") REFERENCES temp."jobs_Job" ("id");

ALTER TABLE temp. "jobs_JobLongLeadProductLink" ADD FOREIGN KEY ("long_lead_product") REFERENCES temp."job_common_LongLeadTimeProducts" ("id");

ALTER TABLE temp."jobs_JobQSChecklistLink" ADD FOREIGN KEY ("job") REFERENCES temp."jobs_Job" ("id");

ALTER TABLE temp. "jobs_JobQSChecklistLink" ADD FOREIGN KEY ("check_item") REFERENCES temp."job_common_QSCheckItem" ("id");

ALTER TABLE temp."jobs_JobNoteFollowUp" ADD CONSTRAINT "fk_JobNote" FOREIGN KEY ("note_id") REFERENCES temp."jobs_JobNote"("id");

ALTER TABLE temp."globaluser_SalaryStaff" ADD CONSTRAINT fk_GlobalUser FOREIGN KEY ("user") REFERENCES temp."globaluser_GlobalUser"("id");

ALTER TABLE temp."globaluser_SalaryStaff" ADD FOREIGN KEY ("employed_by") REFERENCES temp."globaluser_GlobalCompany" ("id");



ALTER TABLE temp. "crm_gf_Contact" ADD FOREIGN KEY ("resource") REFERENCES temp."crm_gf_Resource" ("id");

ALTER TABLE temp. "crm_gf_Contact" ADD FOREIGN KEY ("linked_entity") REFERENCES temp."crm_gf_Entity" ("id");

ALTER TABLE temp. "crm_gf_Resource" ADD FOREIGN KEY ("linked_entity") REFERENCES temp."crm_gf_Entity" ("id");

ALTER TABLE temp. "crm_gf_ResourceNote" ADD FOREIGN KEY ("resource") REFERENCES temp."crm_gf_Resource" ("id");

ALTER TABLE temp. "crm_gf_Resource" ADD FOREIGN KEY ("main_address") REFERENCES temp."jobs_Address" ("id");

ALTER TABLE temp. "crm_gf_Resource" ADD FOREIGN KEY ("nzbn_status") REFERENCES temp."globaluser_NZBNStatus" ("id");


ALTER TABLE temp."crm_gf_Resource_resource_type" ADD FOREIGN KEY ("Resource_id") REFERENCES temp."crm_gf_Resource" ("id");

ALTER TABLE temp."crm_gf_Resource_resource_type" ADD FOREIGN KEY ("old_Resource_id") REFERENCES temp."crm_gf_Resource" ("old_id");

ALTER TABLE temp."crm_gf_Resource_resource_type" ADD FOREIGN KEY ("ResourceType_id") REFERENCES temp."crm_gf_ResourceType" ("id");


ALTER TABLE temp."globaluser_GlobalUser_global_vehicle" ADD FOREIGN KEY ("GlobalUser_id") REFERENCES temp."globaluser_GlobalUser" ("id");
ALTER TABLE temp."globaluser_GlobalUser_global_vehicle" ADD FOREIGN KEY ("stock_v2_Vehicle_id") REFERENCES temp."stock_v2_Vehicle" ("id");


ALTER TABLE temp."globaluser_GlobalUser_role_held" ADD FOREIGN KEY ("GlobalUser_id") REFERENCES temp."globaluser_GlobalUser" ("id");
ALTER TABLE temp."globaluser_GlobalUser_role_held" ADD FOREIGN KEY ("GlobalRole_id") REFERENCES temp."globaluser_GlobalRole" ("id");


ALTER TABLE temp."globaluser_GlobalUser_authorised_company" ADD FOREIGN KEY ("GlobalUser_id") REFERENCES temp."globaluser_GlobalUser" ("id");
ALTER TABLE temp."globaluser_GlobalUser_authorised_company" ADD FOREIGN KEY ("GlobalCompany_id") REFERENCES temp."globaluser_GlobalCompany" ("id");


ALTER TABLE temp."globaluser_GlobalUser_user_app_permission" ADD FOREIGN KEY ("GlobalUser_id") REFERENCES temp."globaluser_GlobalUser" ("id");
ALTER TABLE temp."globaluser_GlobalUser_user_app_permission" ADD FOREIGN KEY ("AppPermission_id") REFERENCES temp."globaluser_AppPermission" ("id");

ALTER TABLE temp."globaluser_GlobalCompany" ADD FOREIGN KEY ("brand") REFERENCES temp."globaluser_GlobalBrand"("id");
ALTER TABLE temp."globaluser_GlobalCompany" ADD FOREIGN KEY ("region") REFERENCES temp."globaluser_OperatingRegion"("id");

ALTER TABLE temp. "globaluser_AppPermission" ADD FOREIGN KEY ("app") REFERENCES temp."globaluser_AppName" ("id");

ALTER TABLE temp. "globaluser_AppPermission" ADD FOREIGN KEY ("permission_level") REFERENCES temp."globaluser_AppPermissionLevel" ("id");


ALTER TABLE temp."crm_gf_ResourceNote_assignee" ADD FOREIGN KEY ("ResourceNote_id") REFERENCES temp."crm_gf_ResourceNote" ("id");
ALTER TABLE temp."crm_gf_ResourceNote_assignee" ADD FOREIGN KEY ("GlobalUser_id") REFERENCES temp."globaluser_GlobalUser" ("id");


ALTER TABLE temp. "crm_gf_EntityEmailAddress" ADD FOREIGN KEY ("entity") REFERENCES temp."crm_gf_Entity" ("id");


ALTER TABLE temp."crm_gf_EntityEmailAddress_contact_types" ADD FOREIGN KEY ("EntityEmailAddress_id") REFERENCES temp."crm_gf_EntityEmailAddress" ("id");
ALTER TABLE temp."crm_gf_EntityEmailAddress_contact_types" ADD FOREIGN KEY ("ContactType_id") REFERENCES temp."crm_common_ContactType" ("id");


ALTER TABLE temp."crm_gf_EntityPhoneNumber_contact_types" ADD FOREIGN KEY ("EntityPhoneNumber_id") REFERENCES temp."crm_gf_EntityPhoneNumber" ("id");

ALTER TABLE temp."crm_gf_EntityPhoneNumber_contact_types" ADD FOREIGN KEY ("ContactType_id") REFERENCES temp."crm_common_ContactType" ("id");


ALTER TABLE temp. "crm_gf_EntityPhoneNumber" ADD FOREIGN KEY ("entity") REFERENCES temp."crm_gf_Entity" ("id");

ALTER TABLE temp. "crm_gf_Entity" ADD FOREIGN KEY ("entity_type") REFERENCES temp."crm_common_EntityType" ("id");

ALTER TABLE temp. "crm_common_SystemAssociation" ADD FOREIGN KEY ("system_type") REFERENCES temp."crm_common_SystemType" ("id");

ALTER TABLE temp. "crm_gf_EntitySystemAssociationLink" ADD FOREIGN KEY ("association_category") REFERENCES temp."crm_common_AssociationCategory" ("id");


ALTER TABLE temp."crm_gf_EntityLocationLink_location_types" ADD FOREIGN KEY ("EntityLocationLink_id") REFERENCES temp."crm_gf_EntityLocationLink" ("id");
ALTER TABLE temp."crm_gf_EntityLocationLink_location_types" ADD FOREIGN KEY ("LocationType_id") REFERENCES temp."crm_common_LocationType" ("id");


ALTER TABLE temp."crm_gf_Entity_responsibilities" ADD FOREIGN KEY ("Entity_id") REFERENCES temp."crm_gf_Entity" ("id");
ALTER TABLE temp."crm_gf_Entity_responsibilities" ADD FOREIGN KEY ("Responsibility_id") REFERENCES temp."crm_common_Responsibility" ("id");


ALTER TABLE temp."crm_gf_Entity_group_associations" ADD FOREIGN KEY ("Entity_id") REFERENCES temp."crm_gf_Entity" ("id");
ALTER TABLE temp."crm_gf_Entity_group_associations" ADD FOREIGN KEY ("AssociationGroup_id") REFERENCES temp."crm_gf_AssociationGroup" ("id");



ALTER TABLE temp."crm_gf_AssociationGroup_type_of_group" ADD FOREIGN KEY ("AssociationGroup_id") REFERENCES temp."crm_gf_AssociationGroup" ("id");
ALTER TABLE temp."crm_gf_AssociationGroup_type_of_group" ADD FOREIGN KEY ("AssociationGroupType_id") REFERENCES temp."crm_common_AssociationGroupType" ("id");


ALTER TABLE temp. "crm_gf_ResourceNameType" ADD FOREIGN KEY ("resource") REFERENCES temp."crm_gf_Resource" ("id");
ALTER TABLE temp. "crm_gf_ResourceNameType" ADD FOREIGN KEY ("name") REFERENCES temp."crm_gf_OtherName" ("id");
ALTER TABLE temp. "crm_gf_ResourceNameType" ADD FOREIGN KEY ("type") REFERENCES temp."crm_gf_NameType" ("id");

ALTER TABLE temp. "crm_common_TaxSpecification" ADD FOREIGN KEY ("tax_type") REFERENCES temp."crm_common_TaxType" ("id");


ALTER TABLE temp. "crm_gf_StaffPayRate" ADD FOREIGN KEY ("staff_member") REFERENCES temp."crm_gf_Entity" ("id");

ALTER TABLE temp. "jobs_JobRequest" ADD FOREIGN KEY ("resource") REFERENCES temp."crm_gf_Resource" ("id");

ALTER TABLE temp. "jobs_JobRequest" ADD FOREIGN KEY ("internal_qs") REFERENCES temp."globaluser_GlobalUser" ("id");

ALTER TABLE temp. "jobs_JobRequest" ADD FOREIGN KEY ("internal_supervisor") REFERENCES temp."globaluser_GlobalUser" ("id");

ALTER TABLE temp."jobs_JobRequest"  ADD FOREIGN KEY ("business_category")  REFERENCES temp."job_common_Category"("id");

ALTER TABLE temp."jobs_JobRequest" ADD FOREIGN KEY ("main_address") REFERENCES temp."jobs_Address" ("id");

ALTER TABLE temp."crm_gf_EntityAssignmentLink_regions" ADD FOREIGN KEY ("EntityAssignmentLink_id") REFERENCES temp."crm_gf_EntityAssignmentLink" ("id");
ALTER TABLE temp."crm_gf_EntityAssignmentLink_regions" ADD FOREIGN KEY ("NZRegion_id") REFERENCES temp."globaluser_NZRegion" ("id");


ALTER TABLE temp. "jobs_JobRequest" ADD FOREIGN KEY ("region") REFERENCES temp."globaluser_NZRegion" ("id");

ALTER TABLE temp. "jobs_JobRequest" ADD FOREIGN KEY ("price_type") REFERENCES temp."job_common_PriceType" ("id");



ALTER TABLE temp."jobs_JobRequest_job_csq" ADD FOREIGN KEY ("JobRequest_id") REFERENCES temp."jobs_JobRequest" ("id");
ALTER TABLE temp."jobs_JobRequest_job_csq" ADD FOREIGN KEY ("CSQ_id") REFERENCES temp."jobs_CSQ" ("id");


ALTER TABLE temp. "jobs_JobRequest" ADD FOREIGN KEY ("client") REFERENCES temp."crm_gf_Entity" ("id");

ALTER TABLE temp. "jobs_JobRequest" ADD FOREIGN KEY ("client_qs_entity") REFERENCES temp."crm_gf_Entity" ("id");


ALTER TABLE temp."jobs_JobRequest_consent" ADD FOREIGN KEY ("JobRequest_id") REFERENCES temp."jobs_JobRequest" ("id");
ALTER TABLE temp."jobs_JobRequest_consent" ADD FOREIGN KEY ("BuildingConsent_id") REFERENCES temp."jobs_BuildingConsent" ("id");


ALTER TABLE temp. "jobs_JobRequest" ADD FOREIGN KEY ("day_work_rate") REFERENCES temp."job_common_DayWorkRates" ("id");

ALTER TABLE temp. "jobs_Job" ADD FOREIGN KEY ("job_operational_approval_user") REFERENCES temp."globaluser_GlobalUser" ("id");

ALTER TABLE temp. "jobs_JobRequestServiceLink" ADD FOREIGN KEY ("supplier_entity") REFERENCES temp."crm_gf_Entity" ("id");

ALTER TABLE temp. "jobs_JobRequestServiceLink" ADD FOREIGN KEY ("pricebook") REFERENCES temp."pricing_PriceBook" ("id");

ALTER TABLE temp. "jobs_Job" ADD FOREIGN KEY ("resource") REFERENCES temp."crm_gf_Resource" ("id");

ALTER TABLE temp. "jobs_Job" ADD FOREIGN KEY ("client_qs") REFERENCES temp."crm_gf_Contact" ("id");

ALTER TABLE temp. "jobs_Job" ADD FOREIGN KEY ("internal_qs") REFERENCES temp."globaluser_GlobalUser" ("id");

ALTER TABLE temp. "jobs_Job" ADD FOREIGN KEY ("internal_supervisor") REFERENCES temp."globaluser_GlobalUser" ("id");

ALTER TABLE temp. "jobs_Job" ADD FOREIGN KEY ("business_category") REFERENCES temp."job_common_Category" ("id");


ALTER TABLE temp."jobs_Job_prestart_attendees" ADD FOREIGN KEY ("Job_id") REFERENCES temp."jobs_Job" ("id");
ALTER TABLE temp."jobs_Job_prestart_attendees" ADD FOREIGN KEY ("GlobalUser_id") REFERENCES temp."globaluser_GlobalUser" ("id");


ALTER TABLE temp. "jobs_Job" ADD FOREIGN KEY ("main_address") REFERENCES temp."jobs_Address" ("id");

ALTER TABLE temp. "jobs_Job" ADD FOREIGN KEY ("region") REFERENCES temp."globaluser_NZRegion" ("id");

ALTER TABLE temp. "jobs_Job" ADD FOREIGN KEY ("job_request_id") REFERENCES temp."jobs_JobRequest" ("id");

ALTER TABLE temp. "jobs_Job" ADD FOREIGN KEY ("client") REFERENCES temp."crm_gf_Entity" ("id");

ALTER TABLE temp. "jobs_Job" ADD FOREIGN KEY ("client_qs_entity") REFERENCES temp."crm_gf_Entity" ("id");


ALTER TABLE temp."jobs_Job_job_csq" ADD FOREIGN KEY ("Job_id") REFERENCES temp."jobs_Job" ("id");
ALTER TABLE temp."jobs_Job_job_csq" ADD FOREIGN KEY ("CSQ_id") REFERENCES temp."jobs_CSQ" ("id");


ALTER TABLE temp. "job_common_Product" ADD FOREIGN KEY ("unit") REFERENCES temp."job_common_MeasureUnit" ("id");

ALTER TABLE temp. "jobs_JobRequest" ADD FOREIGN KEY ("client_qs") REFERENCES temp."crm_gf_Contact" ("id");

ALTER TABLE temp. "jobs_JobServiceLink" ADD FOREIGN KEY ("supplier_entity") REFERENCES temp."crm_gf_Entity" ("id");

ALTER TABLE temp. "jobs_JobServiceLink" ADD FOREIGN KEY ("pricebook") REFERENCES temp."pricing_PriceBook" ("id");


ALTER TABLE temp."jobs_Job_consent" ADD FOREIGN KEY ("Job_id") REFERENCES temp."jobs_Job" ("id");
ALTER TABLE temp."jobs_Job_consent" ADD FOREIGN KEY ("BuildingConsent_id") REFERENCES temp."jobs_BuildingConsent" ("id");


ALTER TABLE temp."jobs_BuildingConsent" ADD FOREIGN KEY ("id") REFERENCES temp."jobs_BuildingConsentBase"("id");

ALTER TABLE temp. "jobs_Job" ADD FOREIGN KEY ("day_work_rate") REFERENCES temp."job_common_DayWorkRates" ("id");

ALTER TABLE temp. "jobs_StoredFile" ADD FOREIGN KEY ("request_job") REFERENCES temp."jobs_JobRequest" ("id");

ALTER TABLE temp. "jobs_StoredFile" ADD FOREIGN KEY ("approved_job") REFERENCES temp."jobs_Job" ("id");

ALTER TABLE temp. "jobs_StoredFile" ADD FOREIGN KEY ("file_category") REFERENCES temp."globaluser_UploadedFileCategory" ("id");

ALTER TABLE temp. "jobs_StoredFile" ADD FOREIGN KEY ("stored_by") REFERENCES temp."globaluser_GlobalUser" ("id");

ALTER TABLE temp. "jobs_Variation" ADD FOREIGN KEY ("job") REFERENCES temp."jobs_Job" ("id");

ALTER TABLE temp. "jobs_CSQ" ADD FOREIGN KEY ("manufacturer") REFERENCES temp."crm_gf_Entity" ("id");

ALTER TABLE temp. "jobs_CSQ" ADD FOREIGN KEY ("merchant") REFERENCES temp."crm_gf_Entity" ("id");

ALTER TABLE temp. "jobs_JobNote" ADD FOREIGN KEY ("job") REFERENCES temp."jobs_Job" ("id");

ALTER TABLE temp. "jobs_JobNote" ADD FOREIGN KEY ("created_by") REFERENCES temp."globaluser_GlobalUser" ("id");

ALTER TABLE temp. "jobs_JobNote" ADD FOREIGN KEY ("last_modified_by") REFERENCES temp."globaluser_GlobalUser" ("id");


ALTER TABLE temp."jobs_JobNote_associated_files" ADD FOREIGN KEY ("JobNote_id") REFERENCES temp."jobs_JobNote" ("id");
ALTER TABLE temp."jobs_JobNote_associated_files" ADD FOREIGN KEY ("StoredFile_id") REFERENCES temp."jobs_StoredFile" ("id");


ALTER TABLE temp. "jobs_JobNoteFollowUp" ADD FOREIGN KEY ("assigned_to") REFERENCES temp."globaluser_GlobalUser" ("id");

ALTER TABLE temp. "jobs_JobNoteFollowUp" ADD FOREIGN KEY ("completed_by") REFERENCES temp."globaluser_GlobalUser" ("id");

ALTER TABLE temp. "jobs_JobNotificationLog" ADD FOREIGN KEY ("job") REFERENCES temp."jobs_Job" ("id");

ALTER TABLE temp. "jobs_JobNotificationRecipient" ADD FOREIGN KEY ("notification") REFERENCES temp."jobs_JobNotificationLog" ("id");


ALTER TABLE temp."job_common_ReportingArea_regions" ADD FOREIGN KEY ("ReportingArea_id") REFERENCES temp."job_common_ReportingArea" ("id");
ALTER TABLE temp."job_common_ReportingArea_regions" ADD FOREIGN KEY ("NZRegion_id") REFERENCES temp."globaluser_NZRegion" ("id");


ALTER TABLE temp. "jobs_JobExternalAssociation" ADD FOREIGN KEY ("job") REFERENCES temp."jobs_Job" ("id");

ALTER TABLE temp. "jobs_JobExternalAssociation" ADD FOREIGN KEY ("association_type") REFERENCES temp."job_common_JobExternalAssociationType" ("id");

ALTER TABLE temp. "pricing_PriceBook" ADD FOREIGN KEY ("entity") REFERENCES temp."crm_gf_Entity" ("id");


ALTER TABLE temp."pricing_PriceBook_pricebook_attributes" ADD FOREIGN KEY ("PriceBook_id") REFERENCES temp."pricing_PriceBook" ("id");
ALTER TABLE temp."pricing_PriceBook_pricebook_attributes" ADD FOREIGN KEY ("PricingAttribute_id") REFERENCES temp."pricing_PricingAttribute" ("id");


ALTER TABLE temp. "pricing_PriceBook" ADD FOREIGN KEY ("csq_association") REFERENCES temp."jobs_CSQ" ("id");


ALTER TABLE temp."jobs_JobNoteFollowUp_also_notify" ADD FOREIGN KEY ("JobNoteFollowUp_id") REFERENCES temp."jobs_JobNoteFollowUp" ("note_id");
ALTER TABLE temp."jobs_JobNoteFollowUp_also_notify" ADD FOREIGN KEY ("GlobalUser_id") REFERENCES temp."globaluser_GlobalUser" ("id");



ALTER TABLE temp."jobs_Variation_associated_files" ADD FOREIGN KEY ("Variation_id") REFERENCES temp."jobs_Variation" ("id");
ALTER TABLE temp."jobs_Variation_associated_files" ADD FOREIGN KEY ("StoredFile_id") REFERENCES temp."jobs_StoredFile" ("id");

ALTER TABLE temp."crm_gf_EntityNote" ADD FOREIGN KEY ("entity") REFERENCES temp."crm_gf_Entity"("id");

ALTER TABLE temp."crm_gf_EntityNote" ADD FOREIGN KEY ("creator") REFERENCES temp."globaluser_GlobalUser" ("id");

ALTER TABLE temp."crm_gf_EntityNote" ADD FOREIGN KEY ("last_modified_by") REFERENCES temp."globaluser_GlobalUser" ("id");

ALTER TABLE temp."crm_gf_ResourceNote" ADD FOREIGN KEY ("old_resource") REFERENCES temp."crm_gf_Resource" ("old_id");

ALTER TABLE temp."crm_gf_Contact" ADD FOREIGN KEY ("old_resource") REFERENCES temp."crm_gf_Resource" ("old_id");

ALTER TABLE temp."crm_gf_ResourceNameType" ADD FOREIGN KEY ("old_resource") REFERENCES temp."crm_gf_Resource" ("old_id");

ALTER TABLE temp."jobs_JobRequest" ADD FOREIGN KEY ("old_resource") REFERENCES temp."crm_gf_Resource" ("old_id");

ALTER TABLE temp."jobs_JobRequest" ADD FOREIGN KEY ("old_client_qs") REFERENCES temp."crm_gf_Contact" ("old_id");

ALTER TABLE temp."jobs_Job" ADD FOREIGN KEY ("old_resource") REFERENCES temp."crm_gf_Resource" ("old_id");

ALTER TABLE temp."jobs_Job" ADD FOREIGN KEY ("old_client_qs") REFERENCES temp."crm_gf_Contact" ("old_id");
