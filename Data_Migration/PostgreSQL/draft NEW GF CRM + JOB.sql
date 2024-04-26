CREATE TABLE "OfferedService_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "name" CharField NOT NULL,
  "service_order" PositiveSmallIntegerField NOT NULL,
  "current_service" BooleanField NOT NULL,
  "show_text" BooleanField NOT NULL,
  "show_pay_supplier" BooleanField NOT NULL,
  "show_pay_rates" BooleanField NOT NULL,
  "contract_mjs" BooleanField NOT NULL
);

CREATE TABLE "Resource_GF" (
  "id" integer PRIMARY KEY,
  "legal_name" CharField NOT NULL,
  "known_name" CharField NOT NULL,
  "is_company" BooleanField NOT NULL,
  "main_address" ForeignKey NOT NULL,
  "nzbn" CharField NOT NULL,
  "nzbn_status" ForeignKey NOT NULL,
  "last_credit_check" DateField NOT NULL,
  "resource_type" ManyToManyField NOT NULL,
  "resource_notes" TextField NOT NULL,
  "linked_entity" ForeignKey
);

CREATE TABLE "Contact_GF" (
  "id" integer PRIMARY KEY,
  "resource" ForeignKey NOT NULL,
  "first_name" CharField NOT NULL,
  "last_name" CharField NOT NULL,
  "job_title" CharField NOT NULL,
  "email_address" EmailField NOT NULL,
  "phone_number" CharField NOT NULL,
  "contact_roles" ManyToManyField NOT NULL,
  "notes" TextField NOT NULL,
  "is_active" BooleanField NOT NULL,
  "known_as" CharField,
  "linked_entity" ForeignKey
);

CREATE TABLE "ResourceType_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "description" CharField NOT NULL,
  "is_active" BooleanField NOT NULL
);

CREATE TABLE "ContactRole_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "name" CharField NOT NULL,
  "is_active" BooleanField NOT NULL
);

CREATE TABLE "NZBNStatus_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "description" CharField NOT NULL,
  "good_status" BooleanField NOT NULL
);

CREATE TABLE "NZRegion" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "region_short_code" CharField NOT NULL,
  "region_name" CharField NOT NULL,
  "official_short_code" CharField NOT NULL
);

CREATE TABLE "ResourceNote_GF" (
  "id" integer PRIMARY KEY,
  "resource" ForeignKey NOT NULL,
  "added_date" DateField NOT NULL,
  "assignee" ManyToManyField NOT NULL,
  "note" TextField,
  "creator" ForeignKey NOT NULL,
  "last_modified" DateTimeField,
  "last_modified_by" ForeignKey NOT NULL,
  "pinned" BooleanField
);

CREATE TABLE "Entity_GF" (
  "id" integer PRIMARY KEY,
  "name" CharField NOT NULL,
  "parent" ForeignKey,
  "short_name" CharField NOT NULL,
  "nzbn" CharField,
  "entity_type" ForeignKey NOT NULL,
  "locations" ManyToManyField NOT NULL,
  "tax_specs" ManyToManyField NOT NULL,
  "roles" ManyToManyField NOT NULL,
  "qualifications" ManyToManyField NOT NULL,
  "skills" ManyToManyField NOT NULL,
  "assignments" ManyToManyField NOT NULL,
  "relationships" ManyToManyField NOT NULL,
  "system_associations" ManyToManyField NOT NULL,
  "responsibilities" ManyToManyField NOT NULL,
  "group_associations" ManyToManyField NOT NULL,
  "pending" BooleanField NOT NULL DEFAULT 'False'
);

CREATE TABLE "EntityEmailAddress_GF" (
  "id" integer PRIMARY KEY,
  "entity" ForeignKey,
  "email_address" EmailField,
  "contact_types" ManyToManyField,
  "current" BooleanField
);

CREATE TABLE "EntityPhoneNumber_GF" (
  "id" integer PRIMARY KEY,
  "entity" ForeignKey NOT NULL,
  "phone_number" CharField NOT NULL,
  "contact_types" ManyToManyField NOT NULL,
  "current" BooleanField NOT NULL
);

CREATE TABLE "EntityLocationLink_GF" (
  "id" integer PRIMARY KEY,
  "entity" ForeignKey,
  "address" ForeignKey,
  "location_types" ManyToManyField,
  "current" BooleanField
);

CREATE TABLE "EntityTaxSpecificationLink_GF" (
  "id" integer PRIMARY KEY,
  "entity" ForeignKey NOT NULL,
  "tax_specification" ForeignKey NOT NULL,
  "tax_id_number" CharField NOT NULL,
  "effective_date" DateField NOT NULL,
  "end_date" DateField
);

CREATE TABLE "EntityRoleLink_GF" (
  "id" integer PRIMARY KEY,
  "entity" ForeignKey NOT NULL,
  "role" ForeignKey NOT NULL,
  "role_detail" CharField NOT NULL
);

CREATE TABLE "EntityQualificationLink_GF" (
  "id" integer PRIMARY KEY,
  "entity" ForeignKey NOT NULL,
  "qualification" ForeignKey NOT NULL,
  "expiration_date" DateField,
  "qualification_reference" CharField NOT NULL
);

CREATE TABLE "EntitySkillLink_GF" (
  "id" integer PRIMARY KEY,
  "entity" ForeignKey NOT NULL,
  "skill" ForeignKey NOT NULL,
  "rating" PositiveSmallIntegerField,
  "last_reviewed" DateField NOT NULL
);

CREATE TABLE "EntityAssignmentLink_GF" (
  "id" integer PRIMARY KEY,
  "entity" ForeignKey NOT NULL,
  "assignment" ForeignKey NOT NULL,
  "regions" ManyToManyField NOT NULL
);

CREATE TABLE "EntityRelationshipLink_GF" (
  "id" integer PRIMARY KEY,
  "entity" ForeignKey NOT NULL,
  "relationship" ForeignKey NOT NULL,
  "start_date" DateField NOT NULL,
  "end_date" DateField,
  "pending" BooleanField NOT NULL
);

CREATE TABLE "EntitySystemAssociationLink_GF" (
  "id" integer PRIMARY KEY,
  "entity" ForeignKey NOT NULL,
  "system" ForeignKey NOT NULL,
  "association_reference" CharField NOT NULL,
  "association_category" ForeignKey
);

CREATE TABLE "NameType_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "type" CharField NOT NULL
);

CREATE TABLE "OtherName_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "name" CharField NOT NULL
);

CREATE TABLE "ResourceNameType_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "resource" ForeignKey NOT NULL,
  "name" ForeignKey NOT NULL,
  "type" ForeignKey NOT NULL
);

CREATE TABLE "AssociationGroup" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "name" CharField NOT NULL,
  "type_of_group" ManyToManyField NOT NULL,
  "current" BooleanField NOT NULL
);

CREATE TABLE "AssociationGroupType_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "name" CharField NOT NULL,
  "current" BooleanField NOT NULL
);

CREATE TABLE "EntityType_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "name" CharField NOT NULL,
  "current" BooleanField NOT NULL
);

CREATE TABLE "TaxType_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "name" CharField NOT NULL,
  "current" BooleanField NOT NULL
);

CREATE TABLE "TaxSpecification_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "tax_type" ForeignKey NOT NULL,
  "tax_rate" DecimalField NOT NULL,
  "current" BooleanField NOT NULL
);

CREATE TABLE "SystemType_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "name" CharField NOT NULL,
  "library" CharField NOT NULL,
  "current" BooleanField NOT NULL
);

CREATE TABLE "AssociationCategory_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "name" CharField NOT NULL,
  "current" BooleanField NOT NULL
);

CREATE TABLE "SystemAssociation_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "system_type" ForeignKey NOT NULL,
  "system_instance" CharField NOT NULL,
  "current" BooleanField NOT NULL
);

CREATE TABLE "Skill_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "name" CharField NOT NULL,
  "linked_service" ForeignKey,
  "current" BooleanField NOT NULL
);

CREATE TABLE "ContactType_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "name" CharField NOT NULL,
  "current" BooleanField NOT NULL
);

CREATE TABLE "LocationType_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "name" CharField NOT NULL,
  "current" BooleanField NOT NULL
);

CREATE TABLE "ComplianceItem_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "name" CharField NOT NULL,
  "current" BooleanField NOT NULL
);

CREATE TABLE "Qualification_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "name" CharField NOT NULL,
  "provided_compliance_items" ManyToManyField NOT NULL,
  "validity" PositiveSmallIntegerField NOT NULL,
  "current" BooleanField NOT NULL
);

CREATE TABLE "Responsibility_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "name" CharField NOT NULL,
  "current" BooleanField NOT NULL
);

CREATE TABLE "Assignment_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "name" CharField NOT NULL,
  "current" BooleanField NOT NULL
);

CREATE TABLE "Relationship_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "name" CharField NOT NULL,
  "current" BooleanField NOT NULL
);

CREATE TABLE "GlobalRole_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "name" CharField NOT NULL,
  "is_active" BooleanField NOT NULL
);

CREATE TABLE "GlobalBrand_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "name" CharField NOT NULL,
  "is_active" BooleanField NOT NULL
);

CREATE TABLE "OperatingRegion_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "name" CharField NOT NULL,
  "abbreviation" CharField NOT NULL,
  "is_active" BooleanField NOT NULL,
  "show_region" BooleanField NOT NULL
);

CREATE TABLE "GlobalCompany_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "brand" ForeignKey NOT NULL,
  "region" ForeignKey NOT NULL,
  "company_prefix" CharField NOT NULL,
  "is_active" BooleanField NOT NULL
);

CREATE TABLE "AppName_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "name" CharField NOT NULL,
  "current_app" BooleanField NOT NULL
);

CREATE TABLE "AppPermissionLevel_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "name" CharField NOT NULL,
  "current_level" BooleanField NOT NULL
);

CREATE TABLE "AppPermission_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "app" ForeignKey NOT NULL,
  "permission_level" ForeignKey NOT NULL,
  "active_permission" BooleanField NOT NULL
);

CREATE TABLE "GlobalUser_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY NOT NULL,
  "mobile_number" mobile_number NOT NULL,
  "role_held" role_held NOT NULL,
  "authorised_company" authorised_company NOT NULL,
  "user_app_permission" user_app_permission NOT NULL,
  "global_vehicle" ManyToManyField NOT NULL,
  "face_filename" face_filename NOT NULL,
  "home_region" home_region NOT NULL,
  "manager" manager
);

CREATE TABLE "stock_v2_Vehicle_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "name" CharField NOT NULL,
  "stock_location" OneToOneField NOT NULL
);

CREATE TABLE "StaffPayRate_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "staff_member" OneToOneField NOT NULL,
  "pay_rate" DecimalField NOT NULL,
  "last_updated" DateField NOT NULL
);

CREATE TABLE "UploadedFileCategory" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "name" CharField NOT NULL,
  "active" BooleanField NOT NULL,
  "operational" BooleanField NOT NULL,
  "administrative" BooleanField NOT NULL,
  "type_is_sensitive" BooleanField NOT NULL
);

CREATE TABLE "PriceType" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "name" CharField NOT NULL,
  "current_type" BooleanField NOT NULL
);

CREATE TABLE "MeasureUnit" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "name" CharField NOT NULL,
  "unit" CharField NOT NULL,
  "unit_symbol_unicode" CharField NOT NULL,
  "unit_symbol_unicode_slash" CharField NOT NULL
);

CREATE TABLE "Category" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "name" CharField NOT NULL,
  "current_category" BooleanField NOT NULL
);

CREATE TABLE "Product" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "name" CharField NOT NULL,
  "unit" ForeignKey NOT NULL
);

CREATE TABLE "QSCheckItem" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "name" CharField NOT NULL,
  "active" BooleanField NOT NULL
);

CREATE TABLE "ReportingArea" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "area_name" CharField NOT NULL,
  "regions" ManyToManyField NOT NULL,
  "current_area" BooleanField NOT NULL,
  "ordering" PositiveSmallIntegerField NOT NULL
);

CREATE TABLE "JobExternalAssociationType" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "name" CharField NOT NULL,
  "current" BooleanField NOT NULL
);

CREATE TABLE "LongLeadTimeProducts" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "name" CharField NOT NULL,
  "min_lead_time" PositiveSmallIntegerField,
  "max_lead_time" PositiveSmallIntegerField,
  "current" BooleanField NOT NULL
);

CREATE TABLE "DayWorkRates" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "rate" DecimalField NOT NULL,
  "current" BooleanField NOT NULL
);

CREATE TABLE "BuildingConsentBase" (
  "building_consent_number" CharField NOT NULL,
  "legal_description" TextField NOT NULL,
  "consented_area" CharField NOT NULL
);

CREATE TABLE "Address_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "number" CharField NOT NULL,
  "road_name" CharField NOT NULL,
  "suburb" CharField NOT NULL,
  "town_city" CharField NOT NULL,
  "post_code" CharField NOT NULL,
  "country" CharField NOT NULL,
  "latitude" DecimalField,
  "longitude" DecimalField,
  "address_note" TextField NOT NULL,
  "place_id" CharField NOT NULL
);

CREATE TABLE "JobRequest_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "quote_identifier" CharField NOT NULL,
  "resource" ForeignKey,
  "client_qs" ForeignKey,
  "fire_engineer" PositiveIntegerField,
  "internal_qs" ForeignKey,
  "internal_supervisor" ForeignKey,
  "business_category" ForeignKey NOT NULL,
  "job_name" CharField NOT NULL,
  "main_address" ForeignKey NOT NULL,
  "region" ForeignKey NOT NULL,
  "price_type" ForeignKey NOT NULL,
  "linings_on_job" BooleanField NOT NULL,
  "job_services" ManyToManyField NOT NULL,
  "qs_checklist" ManyToManyField NOT NULL,
  "job_notes" TextField NOT NULL,
  "sub_address_identifier" CharField NOT NULL,
  "claim_date" SmallIntegerField,
  "dl_period" PositiveSmallIntegerField NOT NULL,
  "retention_threshold_one" DecimalField NOT NULL,
  "retention_threshold_two" DecimalField NOT NULL,
  "retention_threshold_three" DecimalField NOT NULL,
  "retention_percentage_one" DecimalField NOT NULL,
  "retention_percentage_two" DecimalField NOT NULL,
  "retention_percentage_three" DecimalField NOT NULL,
  "admin_verify_details" BooleanField NOT NULL,
  "job_request_date" DateField NOT NULL,
  "final_bill_date" DateField,
  "rejected" BooleanField NOT NULL,
  "client" ForeignKey NOT NULL,
  "client_qs_entity" ForeignKey,
  "out_of_zone_distance" PositiveSmallIntegerField NOT NULL,
  "vaccine_required" BooleanField NOT NULL,
  "csq_reference" CharField NOT NULL,
  "job_csq" ManyToManyField NOT NULL,
  "long_lead_products" ManyToManyField NOT NULL,
  "consent" ManyToManyField NOT NULL,
  "legal_description" TextField NOT NULL,
  "day_work_rate" ForeignKey NOT NULL
);

CREATE TABLE "Job_GF" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "quote_identifier" CharField NOT NULL,
  "resource" ForeignKey NOT NULL,
  "client_qs" PositiveIntegerField,
  "fire_engineer" PositiveIntegerField,
  "internal_qs" ForeignKey,
  "internal_supervisor" ForeignKey,
  "business_category" ForeignKey NOT NULL,
  "prestart_attendees" ManyToManyField NOT NULL,
  "prestart_date" DateField,
  "job_name" CharField NOT NULL,
  "main_address" ForeignKey NOT NULL,
  "region" ForeignKey NOT NULL,
  "wiw_site_id" PositiveIntegerField,
  "pp_project_id" PositiveIntegerField,
  "job_request_id" OneToOneField,
  "price_type" ForeignKey NOT NULL,
  "linings_on_job" BooleanField NOT NULL,
  "job_services" ManyToManyField NOT NULL,
  "qs_checklist" ManyToManyField NOT NULL,
  "job_notes" TextField NOT NULL,
  "sub_address_identifier" CharField NOT NULL,
  "claim_date" SmallIntegerField,
  "dl_period" PositiveSmallIntegerField NOT NULL,
  "retention_threshold_one" DecimalField NOT NULL,
  "retention_threshold_two" DecimalField NOT NULL,
  "retention_threshold_three" DecimalField NOT NULL,
  "retention_percentage_one" DecimalField NOT NULL,
  "retention_percentage_two" DecimalField NOT NULL,
  "retention_percentage_three" DecimalField NOT NULL,
  "admin_verify_details" BooleanField NOT NULL,
  "job_creation_date" DateField NOT NULL,
  "final_bill_date" DateField,
  "client" ForeignKey NOT NULL,
  "client_qs_entity" ForeignKey,
  "out_of_zone_distance" PositiveSmallIntegerField NOT NULL,
  "vaccine_required" BooleanField NOT NULL,
  "job_csq" ManyToManyField NOT NULL,
  "long_lead_products" ManyToManyField NOT NULL,
  "consent" ManyToManyField NOT NULL,
  "legal_description" TextField NOT NULL,
  "day_work_rate" ForeignKey NOT NULL,
  "job_operational_approval_datetime" DateTimeField,
  "job_operational_approval_user" ForeignKey,
  "user_hidden_job" BooleanField NOT NULL,
  "legacy_job_id" CharField NOT NULL,
  "under_review" BooleanField NOT NULL,
  "latitude" DecimalField,
  "longitude" DecimalField
);

CREATE TABLE "JobRequestServiceLink" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "job_request" ForeignKey NOT NULL,
  "service" ForeignKey NOT NULL,
  "variation" BooleanField NOT NULL,
  "variation_reference" CharField NOT NULL,
  "notes" TextField NOT NULL,
  "cost" DecimalField NOT NULL,
  "supplier" CharField NOT NULL,
  "supplier_entity" ForeignKey,
  "pay_supplier" DecimalField,
  "pricebook" ForeignKey
);

CREATE TABLE "JobRequestLongLeadProductLink" (
  "job_request" ForeignKey NOT NULL,
  "long_lead_product" ForeignKey NOT NULL
);

CREATE TABLE "JobRequestQSChecklistLink" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "job_request" ForeignKey NOT NULL,
  "check_item" ForeignKey NOT NULL,
  "completed" BooleanField NOT NULL
);

CREATE TABLE "JobServiceLink" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "job" ForeignKey NOT NULL,
  "service" ForeignKey NOT NULL,
  "variation" BooleanField NOT NULL,
  "variation_reference" CharField NOT NULL,
  "notes" TextField NOT NULL,
  "cost" DecimalField NOT NULL,
  "supplier" CharField NOT NULL,
  "supplier_entity" ForeignKey,
  "pay_supplier" DecimalField,
  "pricebook" ForeignKey
);

CREATE TABLE "JobLongLeadProductLink" (
  "job" ForeignKey NOT NULL,
  "long_lead_product" ForeignKey NOT NULL
);

CREATE TABLE "JobQSChecklistLink" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "job" ForeignKey NOT NULL,
  "check_item" ForeignKey NOT NULL,
  "completed" BooleanField NOT NULL
);

CREATE TABLE "JobExternalAssociation" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "job" ForeignKey,
  "association_type" ForeignKey NOT NULL,
  "association_key" CharField NOT NULL
);

CREATE TABLE "StoredFile" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "request_job" ForeignKey,
  "approved_job" ForeignKey,
  "original_file_name" CharField NOT NULL,
  "object_path" CharField NOT NULL,
  "file_size" BigIntegerField NOT NULL,
  "file_category" ForeignKey NOT NULL,
  "content_type" CharField NOT NULL,
  "stored_datetime" DateTimeField NOT NULL,
  "stored_by" ForeignKey,
  "original" OneToOneField
);

CREATE TABLE "BuildingConsent" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "building_consent_number" CharField NOT NULL,
  "legal_description" TextField NOT NULL,
  "consented_area" CharField NOT NULL
);

CREATE TABLE "Variation" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "job" ForeignKey NOT NULL,
  "variation_number" PositiveSmallIntegerField NOT NULL,
  "date_created" DateField NOT NULL,
  "variation_summary" TextField NOT NULL,
  "associated_files" ManyToManyField NOT NULL
);

CREATE TABLE "CSQ" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "reference" CharField NOT NULL,
  "manufacturer" ForeignKey,
  "merchant" ForeignKey,
  "valid_from" DateField,
  "valid_to" DateField
);

CREATE TABLE "JobNote" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "job" ForeignKey NOT NULL,
  "original" ForeignKey,
  "created_by" ForeignKey,
  "created_at" DateTimeField NOT NULL,
  "last_modified_by" ForeignKey,
  "last_modified_at" DateTimeField NOT NULL,
  "pinned" BooleanField NOT NULL,
  "note" TextField NOT NULL,
  "associated_files" ManyToManyField NOT NULL
);

CREATE TABLE "JobNoteFollowUp" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "note" OneToOneField NOT NULL,
  "assigned_to" ForeignKey,
  "also_notify" ManyToManyField NOT NULL,
  "due_date" DateField NOT NULL,
  "completed_at" DateTimeField,
  "completed_by" ForeignKey
);

CREATE TABLE "JobNotificationLog" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "job" ForeignKey NOT NULL,
  "notification_sent" DateTimeField NOT NULL
);

CREATE TABLE "JobNotificationRecipient" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "notification" ForeignKey NOT NULL,
  "email_address" EmailField NOT NULL
);

CREATE TABLE "PriceBook" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "entity" ForeignKey NOT NULL,
  "pricebook_reference" CharField NOT NULL,
  "pricebook_attributes" ManyToManyField NOT NULL,
  "csq_association" ForeignKey,
  "added_at" DateTimeField NOT NULL,
  "effective_from" DateField NOT NULL,
  "expiration_date" DateField
);

CREATE TABLE "PricingAttribute" (
  "id" PositiveSmallIntegerField PRIMARY KEY,
  "name" CharField NOT NULL,
  "current" BooleanField NOT NULL
);

COMMENT ON COLUMN "OfferedService_GF"."show_pay_supplier" IS 'Does not exist in GF';

COMMENT ON COLUMN "OfferedService_GF"."show_pay_rates" IS 'Does not exist in GF';

COMMENT ON COLUMN "OfferedService_GF"."contract_mjs" IS 'Does not exist in GF';

COMMENT ON COLUMN "Resource_GF"."known_name" IS 'Different: other_names ManyToManyField ResourceNameType';

COMMENT ON COLUMN "Resource_GF"."linked_entity" IS 'Does not exist in GF';

COMMENT ON COLUMN "Contact_GF"."known_as" IS 'Does not exist in GF';

COMMENT ON COLUMN "Contact_GF"."linked_entity" IS 'Does not exist in GF';

COMMENT ON COLUMN "ResourceType_GF"."is_active" IS 'Different in GL: field name current_type';

COMMENT ON COLUMN "ResourceNote_GF"."note" IS 'mandatory in GF';

COMMENT ON COLUMN "ResourceNote_GF"."creator" IS 'Does not exist in GF';

COMMENT ON COLUMN "ResourceNote_GF"."last_modified" IS 'Does not exist in GF';

COMMENT ON COLUMN "ResourceNote_GF"."last_modified_by" IS 'Does not exist in GF';

COMMENT ON COLUMN "ResourceNote_GF"."pinned" IS 'Does not exist in GF';

COMMENT ON TABLE "Entity_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "EntityEmailAddress_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "EntityPhoneNumber_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "EntityLocationLink_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "EntityTaxSpecificationLink_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "EntityRoleLink_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "EntityQualificationLink_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "EntitySkillLink_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "EntityAssignmentLink_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "EntityRelationshipLink_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "EntitySystemAssociationLink_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "NameType_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "OtherName_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "ResourceNameType_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "AssociationGroup" IS 'Does not exist in GF';

COMMENT ON TABLE "AssociationGroupType_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "EntityType_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "TaxType_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "TaxSpecification_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "SystemType_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "AssociationCategory_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "SystemAssociation_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "Skill_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "ContactType_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "LocationType_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "ComplianceItem_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "Qualification_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "Responsibility_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "Assignment_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "Relationship_GF" IS 'Does not exist in GF';

COMMENT ON COLUMN "OperatingRegion_GF"."show_region" IS 'Does not exist in GF';

COMMENT ON COLUMN "GlobalUser_GF"."face_filename" IS 'Does not exist in GF';

COMMENT ON COLUMN "GlobalUser_GF"."home_region" IS 'Does not exist in GF';

COMMENT ON COLUMN "GlobalUser_GF"."manager" IS 'Does not exist in GF';

COMMENT ON TABLE "StaffPayRate_GF" IS 'Does not exist in GF';

COMMENT ON TABLE "MeasureUnit" IS 'Does not exist in GF';

COMMENT ON TABLE "Product" IS 'Does not exist in GF';

COMMENT ON COLUMN "ReportingArea"."ordering" IS 'Does not exist in GF';

COMMENT ON TABLE "JobExternalAssociationType" IS 'Does not exist in GF';

COMMENT ON TABLE "LongLeadTimeProducts" IS 'Does not exist in GF';

COMMENT ON TABLE "DayWorkRates" IS 'Does not exist in GF';

COMMENT ON TABLE "BuildingConsentBase" IS 'Does not exist in GF';

COMMENT ON COLUMN "Address_GF"."latitude" IS 'Does not exist in GF';

COMMENT ON COLUMN "Address_GF"."longitude" IS 'Does not exist in GF';

COMMENT ON COLUMN "Address_GF"."place_id" IS 'Does not exist in GF';

COMMENT ON COLUMN "JobRequest_GF"."client" IS 'Does not exist in GF';

COMMENT ON COLUMN "JobRequest_GF"."client_qs_entity" IS 'Does not exist in GF';

COMMENT ON COLUMN "JobRequest_GF"."out_of_zone_distance" IS 'Does not exist in GF';

COMMENT ON COLUMN "JobRequest_GF"."vaccine_required" IS 'Does not exist in GF';

COMMENT ON COLUMN "JobRequest_GF"."csq_reference" IS 'Does not exist in GF';

COMMENT ON COLUMN "JobRequest_GF"."job_csq" IS 'Does not exist in GF';

COMMENT ON COLUMN "JobRequest_GF"."long_lead_products" IS 'Does not exist in GF';

COMMENT ON COLUMN "JobRequest_GF"."consent" IS 'Does not exist in GF';

COMMENT ON COLUMN "JobRequest_GF"."legal_description" IS 'Does not exist in GF';

COMMENT ON COLUMN "JobRequest_GF"."day_work_rate" IS 'Does not exist in GF';

COMMENT ON COLUMN "Job_GF"."client" IS 'Does not exist in GF';

COMMENT ON COLUMN "Job_GF"."client_qs_entity" IS 'Does not exist in GF';

COMMENT ON COLUMN "Job_GF"."out_of_zone_distance" IS 'Does not exist in GF';

COMMENT ON COLUMN "Job_GF"."vaccine_required" IS 'Does not exist in GF';

COMMENT ON COLUMN "Job_GF"."job_csq" IS 'Does not exist in GF';

COMMENT ON COLUMN "Job_GF"."long_lead_products" IS 'Does not exist in GF';

COMMENT ON COLUMN "Job_GF"."consent" IS 'Does not exist in GF';

COMMENT ON COLUMN "Job_GF"."legal_description" IS 'Does not exist in GF';

COMMENT ON COLUMN "Job_GF"."day_work_rate" IS 'Does not exist in GF';

COMMENT ON COLUMN "Job_GF"."job_operational_approval_datetime" IS 'Does not exist in GF';

COMMENT ON COLUMN "Job_GF"."job_operational_approval_user" IS 'Does not exist in GF';

COMMENT ON COLUMN "Job_GF"."user_hidden_job" IS 'Does not exist in GF';

COMMENT ON COLUMN "Job_GF"."legacy_job_id" IS 'Does not exist in GF';

COMMENT ON COLUMN "Job_GF"."under_review" IS 'Does not exist in GF';

COMMENT ON COLUMN "Job_GF"."latitude" IS 'Does not exist in GF';

COMMENT ON COLUMN "Job_GF"."longitude" IS 'Does not exist in GF';

COMMENT ON COLUMN "JobRequestServiceLink"."cost" IS 'Does not exist in GF';

COMMENT ON COLUMN "JobRequestServiceLink"."supplier" IS 'Does not exist in GF';

COMMENT ON COLUMN "JobRequestServiceLink"."supplier_entity" IS 'Does not exist in GF';

COMMENT ON COLUMN "JobRequestServiceLink"."pay_supplier" IS 'Does not exist in GF';

COMMENT ON COLUMN "JobRequestServiceLink"."pricebook" IS 'Does not exist in GF';

COMMENT ON COLUMN "JobServiceLink"."cost" IS 'Does not exist in GF';

COMMENT ON COLUMN "JobServiceLink"."supplier" IS 'Does not exist in GF';

COMMENT ON COLUMN "JobServiceLink"."supplier_entity" IS 'Does not exist in GF';

COMMENT ON COLUMN "JobServiceLink"."pay_supplier" IS 'Does not exist in GF';

COMMENT ON COLUMN "JobServiceLink"."pricebook" IS 'Does not exist in GF';

COMMENT ON TABLE "JobExternalAssociation" IS 'Does not exist in GF';

COMMENT ON TABLE "BuildingConsent" IS 'Does not exist in GF';

COMMENT ON TABLE "Variation" IS 'Does not exist in GF - check with Dan';

COMMENT ON TABLE "CSQ" IS 'Does not exist in GF';

COMMENT ON TABLE "JobNote" IS 'Does not exist in GF - check with Dan';

COMMENT ON TABLE "JobNoteFollowUp" IS 'Does not exist in GF - check with Dan';

COMMENT ON TABLE "JobNotificationLog" IS 'Does not exist in GF - check with Dan';

COMMENT ON TABLE "JobNotificationRecipient" IS 'Does not exist in GF - check with Dan';

COMMENT ON TABLE "PriceBook" IS 'Does not exist in GF';

ALTER TABLE "Resource_GF" ADD FOREIGN KEY ("id") REFERENCES "Contact_GF" ("resource");

ALTER TABLE "Entity_GF" ADD FOREIGN KEY ("id") REFERENCES "Contact_GF" ("linked_entity");

ALTER TABLE "Entity_GF" ADD FOREIGN KEY ("id") REFERENCES "Resource_GF" ("linked_entity");

ALTER TABLE "Resource_GF" ADD FOREIGN KEY ("id") REFERENCES "ResourceNote_GF" ("resource");

ALTER TABLE "Address_GF" ADD FOREIGN KEY ("id") REFERENCES "Resource_GF" ("main_address");

ALTER TABLE "NZBNStatus_GF" ADD FOREIGN KEY ("id") REFERENCES "Resource_GF" ("nzbn_status");

CREATE TABLE "Resource_GF_ResourceType_GF" (
  "Resource_GF_resource_type" ManyToManyField,
  "ResourceType_GF_id" PositiveSmallIntegerField,
  PRIMARY KEY ("Resource_GF_resource_type", "ResourceType_GF_id")
);

ALTER TABLE "Resource_GF_ResourceType_GF" ADD FOREIGN KEY ("Resource_GF_resource_type") REFERENCES "Resource_GF" ("resource_type");

ALTER TABLE "Resource_GF_ResourceType_GF" ADD FOREIGN KEY ("ResourceType_GF_id") REFERENCES "ResourceType_GF" ("id");


CREATE TABLE "GlobalUser_GF_stock_v2_Vehicle_GF" (
  "GlobalUser_GF_global_vehicle" ManyToManyField,
  "stock_v2_Vehicle_GF_id" PositiveSmallIntegerField,
  PRIMARY KEY ("GlobalUser_GF_global_vehicle", "stock_v2_Vehicle_GF_id")
);

ALTER TABLE "GlobalUser_GF_stock_v2_Vehicle_GF" ADD FOREIGN KEY ("GlobalUser_GF_global_vehicle") REFERENCES "GlobalUser_GF" ("global_vehicle");

ALTER TABLE "GlobalUser_GF_stock_v2_Vehicle_GF" ADD FOREIGN KEY ("stock_v2_Vehicle_GF_id") REFERENCES "stock_v2_Vehicle_GF" ("id");


CREATE TABLE "GlobalUser_GF_GlobalRole_GF" (
  "GlobalUser_GF_role_held" role_held,
  "GlobalRole_GF_id" PositiveSmallIntegerField,
  PRIMARY KEY ("GlobalUser_GF_role_held", "GlobalRole_GF_id")
);

ALTER TABLE "GlobalUser_GF_GlobalRole_GF" ADD FOREIGN KEY ("GlobalUser_GF_role_held") REFERENCES "GlobalUser_GF" ("role_held");

ALTER TABLE "GlobalUser_GF_GlobalRole_GF" ADD FOREIGN KEY ("GlobalRole_GF_id") REFERENCES "GlobalRole_GF" ("id");


CREATE TABLE "GlobalUser_GF_GlobalCompany_GF" (
  "GlobalUser_GF_authorised_company" authorised_company,
  "GlobalCompany_GF_id" PositiveSmallIntegerField,
  PRIMARY KEY ("GlobalUser_GF_authorised_company", "GlobalCompany_GF_id")
);

ALTER TABLE "GlobalUser_GF_GlobalCompany_GF" ADD FOREIGN KEY ("GlobalUser_GF_authorised_company") REFERENCES "GlobalUser_GF" ("authorised_company");

ALTER TABLE "GlobalUser_GF_GlobalCompany_GF" ADD FOREIGN KEY ("GlobalCompany_GF_id") REFERENCES "GlobalCompany_GF" ("id");


CREATE TABLE "GlobalUser_GF_AppPermission_GF" (
  "GlobalUser_GF_user_app_permission" user_app_permission,
  "AppPermission_GF_id" PositiveSmallIntegerField,
  PRIMARY KEY ("GlobalUser_GF_user_app_permission", "AppPermission_GF_id")
);

ALTER TABLE "GlobalUser_GF_AppPermission_GF" ADD FOREIGN KEY ("GlobalUser_GF_user_app_permission") REFERENCES "GlobalUser_GF" ("user_app_permission");

ALTER TABLE "GlobalUser_GF_AppPermission_GF" ADD FOREIGN KEY ("AppPermission_GF_id") REFERENCES "AppPermission_GF" ("id");


ALTER TABLE "GlobalBrand_GF" ADD FOREIGN KEY ("id") REFERENCES "GlobalCompany_GF" ("brand");

ALTER TABLE "OperatingRegion_GF" ADD FOREIGN KEY ("id") REFERENCES "GlobalCompany_GF" ("region");

ALTER TABLE "AppName_GF" ADD FOREIGN KEY ("id") REFERENCES "AppPermission_GF" ("app");

ALTER TABLE "AppPermissionLevel_GF" ADD FOREIGN KEY ("id") REFERENCES "AppPermission_GF" ("permission_level");

ALTER TABLE "GlobalUser_GF" ADD FOREIGN KEY ("id") REFERENCES "ResourceNote_GF" ("creator");

ALTER TABLE "GlobalUser_GF" ADD FOREIGN KEY ("id") REFERENCES "ResourceNote_GF" ("last_modified_by");

CREATE TABLE "ResourceNote_GF_GlobalUser_GF" (
  "ResourceNote_GF_assignee" ManyToManyField,
  "GlobalUser_GF_id" PositiveSmallIntegerField,
  PRIMARY KEY ("ResourceNote_GF_assignee", "GlobalUser_GF_id")
);

ALTER TABLE "ResourceNote_GF_GlobalUser_GF" ADD FOREIGN KEY ("ResourceNote_GF_assignee") REFERENCES "ResourceNote_GF" ("assignee");

ALTER TABLE "ResourceNote_GF_GlobalUser_GF" ADD FOREIGN KEY ("GlobalUser_GF_id") REFERENCES "GlobalUser_GF" ("id");


ALTER TABLE "Entity_GF" ADD FOREIGN KEY ("id") REFERENCES "EntityEmailAddress_GF" ("entity");

CREATE TABLE "EntityEmailAddress_GF_ContactType_GF" (
  "EntityEmailAddress_GF_contact_types" ManyToManyField,
  "ContactType_GF_id" PositiveSmallIntegerField,
  PRIMARY KEY ("EntityEmailAddress_GF_contact_types", "ContactType_GF_id")
);

ALTER TABLE "EntityEmailAddress_GF_ContactType_GF" ADD FOREIGN KEY ("EntityEmailAddress_GF_contact_types") REFERENCES "EntityEmailAddress_GF" ("contact_types");

ALTER TABLE "EntityEmailAddress_GF_ContactType_GF" ADD FOREIGN KEY ("ContactType_GF_id") REFERENCES "ContactType_GF" ("id");


CREATE TABLE "EntityPhoneNumber_GF_ContactType_GF" (
  "EntityPhoneNumber_GF_contact_types" ManyToManyField,
  "ContactType_GF_id" PositiveSmallIntegerField,
  PRIMARY KEY ("EntityPhoneNumber_GF_contact_types", "ContactType_GF_id")
);

ALTER TABLE "EntityPhoneNumber_GF_ContactType_GF" ADD FOREIGN KEY ("EntityPhoneNumber_GF_contact_types") REFERENCES "EntityPhoneNumber_GF" ("contact_types");

ALTER TABLE "EntityPhoneNumber_GF_ContactType_GF" ADD FOREIGN KEY ("ContactType_GF_id") REFERENCES "ContactType_GF" ("id");


CREATE TABLE "Entity_GF_EntityLocationLink_GF" (
  "Entity_GF_locations" ManyToManyField,
  "EntityLocationLink_GF_entity" ForeignKey,
  PRIMARY KEY ("Entity_GF_locations", "EntityLocationLink_GF_entity")
);

ALTER TABLE "Entity_GF_EntityLocationLink_GF" ADD FOREIGN KEY ("Entity_GF_locations") REFERENCES "Entity_GF" ("locations");

ALTER TABLE "Entity_GF_EntityLocationLink_GF" ADD FOREIGN KEY ("EntityLocationLink_GF_entity") REFERENCES "EntityLocationLink_GF" ("entity");


CREATE TABLE "Entity_GF_EntityTaxSpecificationLink_GF" (
  "Entity_GF_tax_specs" ManyToManyField,
  "EntityTaxSpecificationLink_GF_entity" ForeignKey,
  PRIMARY KEY ("Entity_GF_tax_specs", "EntityTaxSpecificationLink_GF_entity")
);

ALTER TABLE "Entity_GF_EntityTaxSpecificationLink_GF" ADD FOREIGN KEY ("Entity_GF_tax_specs") REFERENCES "Entity_GF" ("tax_specs");

ALTER TABLE "Entity_GF_EntityTaxSpecificationLink_GF" ADD FOREIGN KEY ("EntityTaxSpecificationLink_GF_entity") REFERENCES "EntityTaxSpecificationLink_GF" ("entity");


CREATE TABLE "Entity_GF_EntityRoleLink_GF" (
  "Entity_GF_roles" ManyToManyField,
  "EntityRoleLink_GF_entity" ForeignKey,
  PRIMARY KEY ("Entity_GF_roles", "EntityRoleLink_GF_entity")
);

ALTER TABLE "Entity_GF_EntityRoleLink_GF" ADD FOREIGN KEY ("Entity_GF_roles") REFERENCES "Entity_GF" ("roles");

ALTER TABLE "Entity_GF_EntityRoleLink_GF" ADD FOREIGN KEY ("EntityRoleLink_GF_entity") REFERENCES "EntityRoleLink_GF" ("entity");


ALTER TABLE "EntityQualificationLink_GF" ADD FOREIGN KEY ("qualification") REFERENCES "Qualification_GF" ("id");

ALTER TABLE "EntityQualificationLink_GF" ADD FOREIGN KEY ("entity") REFERENCES "Entity_GF" ("qualifications");

CREATE TABLE "Entity_GF_EntitySkillLink_GF" (
  "Entity_GF_skills" ManyToManyField,
  "EntitySkillLink_GF_entity" ForeignKey,
  PRIMARY KEY ("Entity_GF_skills", "EntitySkillLink_GF_entity")
);

ALTER TABLE "Entity_GF_EntitySkillLink_GF" ADD FOREIGN KEY ("Entity_GF_skills") REFERENCES "Entity_GF" ("skills");

ALTER TABLE "Entity_GF_EntitySkillLink_GF" ADD FOREIGN KEY ("EntitySkillLink_GF_entity") REFERENCES "EntitySkillLink_GF" ("entity");


CREATE TABLE "Entity_GF_EntityAssignmentLink_GF" (
  "Entity_GF_assignments" ManyToManyField,
  "EntityAssignmentLink_GF_entity" ForeignKey,
  PRIMARY KEY ("Entity_GF_assignments", "EntityAssignmentLink_GF_entity")
);

ALTER TABLE "Entity_GF_EntityAssignmentLink_GF" ADD FOREIGN KEY ("Entity_GF_assignments") REFERENCES "Entity_GF" ("assignments");

ALTER TABLE "Entity_GF_EntityAssignmentLink_GF" ADD FOREIGN KEY ("EntityAssignmentLink_GF_entity") REFERENCES "EntityAssignmentLink_GF" ("entity");


CREATE TABLE "Entity_GF_EntityRelationshipLink_GF" (
  "Entity_GF_relationships" ManyToManyField,
  "EntityRelationshipLink_GF_entity" ForeignKey,
  PRIMARY KEY ("Entity_GF_relationships", "EntityRelationshipLink_GF_entity")
);

ALTER TABLE "Entity_GF_EntityRelationshipLink_GF" ADD FOREIGN KEY ("Entity_GF_relationships") REFERENCES "Entity_GF" ("relationships");

ALTER TABLE "Entity_GF_EntityRelationshipLink_GF" ADD FOREIGN KEY ("EntityRelationshipLink_GF_entity") REFERENCES "EntityRelationshipLink_GF" ("entity");


CREATE TABLE "Entity_GF_EntitySystemAssociationLink_GF" (
  "Entity_GF_system_associations" ManyToManyField,
  "EntitySystemAssociationLink_GF_entity" ForeignKey,
  PRIMARY KEY ("Entity_GF_system_associations", "EntitySystemAssociationLink_GF_entity")
);

ALTER TABLE "Entity_GF_EntitySystemAssociationLink_GF" ADD FOREIGN KEY ("Entity_GF_system_associations") REFERENCES "Entity_GF" ("system_associations");

ALTER TABLE "Entity_GF_EntitySystemAssociationLink_GF" ADD FOREIGN KEY ("EntitySystemAssociationLink_GF_entity") REFERENCES "EntitySystemAssociationLink_GF" ("entity");


ALTER TABLE "Entity_GF" ADD FOREIGN KEY ("id") REFERENCES "EntityPhoneNumber_GF" ("entity");

ALTER TABLE "EntityType_GF" ADD FOREIGN KEY ("id") REFERENCES "Entity_GF" ("entity_type");

ALTER TABLE "TaxSpecification_GF" ADD FOREIGN KEY ("id") REFERENCES "EntityTaxSpecificationLink_GF" ("tax_specification");

ALTER TABLE "Skill_GF" ADD FOREIGN KEY ("id") REFERENCES "EntitySkillLink_GF" ("skill");

ALTER TABLE "Assignment_GF" ADD FOREIGN KEY ("id") REFERENCES "EntityAssignmentLink_GF" ("assignment");

ALTER TABLE "Relationship_GF" ADD FOREIGN KEY ("id") REFERENCES "EntityRelationshipLink_GF" ("relationship");

ALTER TABLE "SystemType_GF" ADD FOREIGN KEY ("id") REFERENCES "SystemAssociation_GF" ("system_type");

ALTER TABLE "SystemAssociation_GF" ADD FOREIGN KEY ("id") REFERENCES "EntitySystemAssociationLink_GF" ("system");

ALTER TABLE "AssociationCategory_GF" ADD FOREIGN KEY ("id") REFERENCES "EntitySystemAssociationLink_GF" ("association_category");

CREATE TABLE "EntityLocationLink_GF_LocationType_GF" (
  "EntityLocationLink_GF_location_types" ManyToManyField,
  "LocationType_GF_id" PositiveSmallIntegerField,
  PRIMARY KEY ("EntityLocationLink_GF_location_types", "LocationType_GF_id")
);

ALTER TABLE "EntityLocationLink_GF_LocationType_GF" ADD FOREIGN KEY ("EntityLocationLink_GF_location_types") REFERENCES "EntityLocationLink_GF" ("location_types");

ALTER TABLE "EntityLocationLink_GF_LocationType_GF" ADD FOREIGN KEY ("LocationType_GF_id") REFERENCES "LocationType_GF" ("id");


ALTER TABLE "ComplianceItem_GF" ADD FOREIGN KEY ("id") REFERENCES "Qualification_GF" ("provided_compliance_items");

CREATE TABLE "Entity_GF_Responsibility_GF" (
  "Entity_GF_responsibilities" ManyToManyField,
  "Responsibility_GF_id" PositiveSmallIntegerField,
  PRIMARY KEY ("Entity_GF_responsibilities", "Responsibility_GF_id")
);

ALTER TABLE "Entity_GF_Responsibility_GF" ADD FOREIGN KEY ("Entity_GF_responsibilities") REFERENCES "Entity_GF" ("responsibilities");

ALTER TABLE "Entity_GF_Responsibility_GF" ADD FOREIGN KEY ("Responsibility_GF_id") REFERENCES "Responsibility_GF" ("id");


CREATE TABLE "Entity_GF_AssociationGroup" (
  "Entity_GF_group_associations" ManyToManyField,
  "AssociationGroup_name" CharField,
  PRIMARY KEY ("Entity_GF_group_associations", "AssociationGroup_name")
);

ALTER TABLE "Entity_GF_AssociationGroup" ADD FOREIGN KEY ("Entity_GF_group_associations") REFERENCES "Entity_GF" ("group_associations");

ALTER TABLE "Entity_GF_AssociationGroup" ADD FOREIGN KEY ("AssociationGroup_name") REFERENCES "AssociationGroup" ("name");


CREATE TABLE "AssociationGroup_AssociationGroupType_GF" (
  "AssociationGroup_type_of_group" ManyToManyField,
  "AssociationGroupType_GF_id" PositiveSmallIntegerField,
  PRIMARY KEY ("AssociationGroup_type_of_group", "AssociationGroupType_GF_id")
);

ALTER TABLE "AssociationGroup_AssociationGroupType_GF" ADD FOREIGN KEY ("AssociationGroup_type_of_group") REFERENCES "AssociationGroup" ("type_of_group");

ALTER TABLE "AssociationGroup_AssociationGroupType_GF" ADD FOREIGN KEY ("AssociationGroupType_GF_id") REFERENCES "AssociationGroupType_GF" ("id");


ALTER TABLE "Address_GF" ADD FOREIGN KEY ("id") REFERENCES "EntityLocationLink_GF" ("address");

CREATE TABLE "ResourceNameType_GF_Resource_GF" (
  "ResourceNameType_GF_resource" ForeignKey,
  "Resource_GF_known_name" CharField,
  PRIMARY KEY ("ResourceNameType_GF_resource", "Resource_GF_known_name")
);

ALTER TABLE "ResourceNameType_GF_Resource_GF" ADD FOREIGN KEY ("ResourceNameType_GF_resource") REFERENCES "ResourceNameType_GF" ("resource");

ALTER TABLE "ResourceNameType_GF_Resource_GF" ADD FOREIGN KEY ("Resource_GF_known_name") REFERENCES "Resource_GF" ("known_name");


ALTER TABLE "OtherName_GF" ADD FOREIGN KEY ("id") REFERENCES "ResourceNameType_GF" ("name");

ALTER TABLE "NameType_GF" ADD FOREIGN KEY ("id") REFERENCES "ResourceNameType_GF" ("type");

ALTER TABLE "TaxType_GF" ADD FOREIGN KEY ("id") REFERENCES "TaxSpecification_GF" ("tax_type");

ALTER TABLE "OfferedService_GF" ADD FOREIGN KEY ("id") REFERENCES "EntityRoleLink_GF" ("role");

CREATE TABLE "Contact_GF_ContactRole_GF" (
  "Contact_GF_contact_roles" ManyToManyField,
  "ContactRole_GF_id" PositiveSmallIntegerField,
  PRIMARY KEY ("Contact_GF_contact_roles", "ContactRole_GF_id")
);

ALTER TABLE "Contact_GF_ContactRole_GF" ADD FOREIGN KEY ("Contact_GF_contact_roles") REFERENCES "Contact_GF" ("contact_roles");

ALTER TABLE "Contact_GF_ContactRole_GF" ADD FOREIGN KEY ("ContactRole_GF_id") REFERENCES "ContactRole_GF" ("id");


ALTER TABLE "Entity_GF" ADD FOREIGN KEY ("id") REFERENCES "StaffPayRate_GF" ("staff_member");

ALTER TABLE "Resource_GF" ADD FOREIGN KEY ("id") REFERENCES "JobRequest_GF" ("resource");

ALTER TABLE "GlobalUser_GF" ADD FOREIGN KEY ("id") REFERENCES "JobRequest_GF" ("internal_qs");

ALTER TABLE "GlobalUser_GF" ADD FOREIGN KEY ("id") REFERENCES "JobRequest_GF" ("internal_supervisor");

ALTER TABLE "Category" ADD FOREIGN KEY ("name") REFERENCES "JobRequest_GF" ("business_category");

ALTER TABLE "Address_GF" ADD FOREIGN KEY ("id") REFERENCES "JobRequest_GF" ("main_address");

CREATE TABLE "EntityAssignmentLink_GF_NZRegion" (
  "EntityAssignmentLink_GF_regions" ManyToManyField,
  "NZRegion_id" PositiveSmallIntegerField,
  PRIMARY KEY ("EntityAssignmentLink_GF_regions", "NZRegion_id")
);

ALTER TABLE "EntityAssignmentLink_GF_NZRegion" ADD FOREIGN KEY ("EntityAssignmentLink_GF_regions") REFERENCES "EntityAssignmentLink_GF" ("regions");

ALTER TABLE "EntityAssignmentLink_GF_NZRegion" ADD FOREIGN KEY ("NZRegion_id") REFERENCES "NZRegion" ("id");


ALTER TABLE "NZRegion" ADD FOREIGN KEY ("id") REFERENCES "JobRequest_GF" ("region");

ALTER TABLE "PriceType" ADD FOREIGN KEY ("id") REFERENCES "JobRequest_GF" ("price_type");

ALTER TABLE "Entity_GF" ADD FOREIGN KEY ("id") REFERENCES "JobRequest_GF" ("client");

ALTER TABLE "Entity_GF" ADD FOREIGN KEY ("id") REFERENCES "JobRequest_GF" ("client_qs_entity");

CREATE TABLE "JobRequest_GF_CSQ" (
  "JobRequest_GF_job_csq" ManyToManyField,
  "CSQ_id" PositiveSmallIntegerField,
  PRIMARY KEY ("JobRequest_GF_job_csq", "CSQ_id")
);

ALTER TABLE "JobRequest_GF_CSQ" ADD FOREIGN KEY ("JobRequest_GF_job_csq") REFERENCES "JobRequest_GF" ("job_csq");

ALTER TABLE "JobRequest_GF_CSQ" ADD FOREIGN KEY ("CSQ_id") REFERENCES "CSQ" ("id");


CREATE TABLE "JobRequest_GF_BuildingConsent" (
  "JobRequest_GF_consent" ManyToManyField,
  "BuildingConsent_id" PositiveSmallIntegerField,
  PRIMARY KEY ("JobRequest_GF_consent", "BuildingConsent_id")
);

ALTER TABLE "JobRequest_GF_BuildingConsent" ADD FOREIGN KEY ("JobRequest_GF_consent") REFERENCES "JobRequest_GF" ("consent");

ALTER TABLE "JobRequest_GF_BuildingConsent" ADD FOREIGN KEY ("BuildingConsent_id") REFERENCES "BuildingConsent" ("id");


ALTER TABLE "DayWorkRates" ADD FOREIGN KEY ("id") REFERENCES "JobRequest_GF" ("day_work_rate");

ALTER TABLE "GlobalUser_GF" ADD FOREIGN KEY ("id") REFERENCES "Job_GF" ("job_operational_approval_user");

ALTER TABLE "JobRequestServiceLink" ADD FOREIGN KEY ("job_request") REFERENCES "JobRequest_GF" ("job_services");

ALTER TABLE "OfferedService_GF" ADD FOREIGN KEY ("id") REFERENCES "JobRequestServiceLink" ("service");

ALTER TABLE "Entity_GF" ADD FOREIGN KEY ("id") REFERENCES "JobRequestServiceLink" ("supplier_entity");

ALTER TABLE "PriceBook" ADD FOREIGN KEY ("id") REFERENCES "JobRequestServiceLink" ("pricebook");

CREATE TABLE "JobRequestQSChecklistLink_JobRequest_GF" (
  "JobRequestQSChecklistLink_job_request" ForeignKey,
  "JobRequest_GF_qs_checklist" ManyToManyField,
  PRIMARY KEY ("JobRequestQSChecklistLink_job_request", "JobRequest_GF_qs_checklist")
);

ALTER TABLE "JobRequestQSChecklistLink_JobRequest_GF" ADD FOREIGN KEY ("JobRequestQSChecklistLink_job_request") REFERENCES "JobRequestQSChecklistLink" ("job_request");

ALTER TABLE "JobRequestQSChecklistLink_JobRequest_GF" ADD FOREIGN KEY ("JobRequest_GF_qs_checklist") REFERENCES "JobRequest_GF" ("qs_checklist");


ALTER TABLE "QSCheckItem" ADD FOREIGN KEY ("id") REFERENCES "JobRequestQSChecklistLink" ("check_item");

ALTER TABLE "Resource_GF" ADD FOREIGN KEY ("id") REFERENCES "Job_GF" ("resource");

ALTER TABLE "Contact_GF" ADD FOREIGN KEY ("id") REFERENCES "Job_GF" ("client_qs");

ALTER TABLE "GlobalUser_GF" ADD FOREIGN KEY ("id") REFERENCES "Job_GF" ("internal_qs");

ALTER TABLE "GlobalUser_GF" ADD FOREIGN KEY ("id") REFERENCES "Job_GF" ("internal_supervisor");

ALTER TABLE "Category" ADD FOREIGN KEY ("id") REFERENCES "Job_GF" ("business_category");

CREATE TABLE "Job_GF_GlobalUser_GF" (
  "Job_GF_prestart_attendees" ManyToManyField,
  "GlobalUser_GF_id" PositiveSmallIntegerField,
  PRIMARY KEY ("Job_GF_prestart_attendees", "GlobalUser_GF_id")
);

ALTER TABLE "Job_GF_GlobalUser_GF" ADD FOREIGN KEY ("Job_GF_prestart_attendees") REFERENCES "Job_GF" ("prestart_attendees");

ALTER TABLE "Job_GF_GlobalUser_GF" ADD FOREIGN KEY ("GlobalUser_GF_id") REFERENCES "GlobalUser_GF" ("id");


ALTER TABLE "Address_GF" ADD FOREIGN KEY ("id") REFERENCES "Job_GF" ("main_address");

ALTER TABLE "NZRegion" ADD FOREIGN KEY ("id") REFERENCES "Job_GF" ("region");

ALTER TABLE "JobRequest_GF" ADD FOREIGN KEY ("id") REFERENCES "Job_GF" ("job_request_id");

ALTER TABLE "Entity_GF" ADD FOREIGN KEY ("id") REFERENCES "Job_GF" ("client");

ALTER TABLE "Entity_GF" ADD FOREIGN KEY ("id") REFERENCES "Job_GF" ("client_qs_entity");

CREATE TABLE "Job_GF_CSQ" (
  "Job_GF_job_csq" ManyToManyField,
  "CSQ_id" PositiveSmallIntegerField,
  PRIMARY KEY ("Job_GF_job_csq", "CSQ_id")
);

ALTER TABLE "Job_GF_CSQ" ADD FOREIGN KEY ("Job_GF_job_csq") REFERENCES "Job_GF" ("job_csq");

ALTER TABLE "Job_GF_CSQ" ADD FOREIGN KEY ("CSQ_id") REFERENCES "CSQ" ("id");


ALTER TABLE "JobRequestLongLeadProductLink" ADD FOREIGN KEY ("job_request") REFERENCES "JobRequest_GF" ("long_lead_products");

ALTER TABLE "LongLeadTimeProducts" ADD FOREIGN KEY ("id") REFERENCES "JobRequestLongLeadProductLink" ("long_lead_product");

ALTER TABLE "JobServiceLink" ADD FOREIGN KEY ("job") REFERENCES "Job_GF" ("job_services");

ALTER TABLE "JobQSChecklistLink" ADD FOREIGN KEY ("job") REFERENCES "Job_GF" ("qs_checklist");

ALTER TABLE "QSCheckItem" ADD FOREIGN KEY ("id") REFERENCES "JobQSChecklistLink" ("check_item");

ALTER TABLE "JobLongLeadProductLink" ADD FOREIGN KEY ("job") REFERENCES "Job_GF" ("long_lead_products");

ALTER TABLE "LongLeadTimeProducts" ADD FOREIGN KEY ("id") REFERENCES "JobLongLeadProductLink" ("long_lead_product");

ALTER TABLE "MeasureUnit" ADD FOREIGN KEY ("id") REFERENCES "Product" ("unit");

ALTER TABLE "Contact_GF" ADD FOREIGN KEY ("id") REFERENCES "JobRequest_GF" ("client_qs");

ALTER TABLE "Entity_GF" ADD FOREIGN KEY ("id") REFERENCES "JobServiceLink" ("supplier_entity");

ALTER TABLE "PriceBook" ADD FOREIGN KEY ("id") REFERENCES "JobServiceLink" ("pricebook");

CREATE TABLE "Job_GF_BuildingConsent" (
  "Job_GF_consent" ManyToManyField,
  "BuildingConsent_id" PositiveSmallIntegerField,
  PRIMARY KEY ("Job_GF_consent", "BuildingConsent_id")
);

ALTER TABLE "Job_GF_BuildingConsent" ADD FOREIGN KEY ("Job_GF_consent") REFERENCES "Job_GF" ("consent");

ALTER TABLE "Job_GF_BuildingConsent" ADD FOREIGN KEY ("BuildingConsent_id") REFERENCES "BuildingConsent" ("id");


ALTER TABLE "DayWorkRates" ADD FOREIGN KEY ("id") REFERENCES "Job_GF" ("day_work_rate");

ALTER TABLE "JobRequest_GF" ADD FOREIGN KEY ("id") REFERENCES "StoredFile" ("request_job");

ALTER TABLE "Job_GF" ADD FOREIGN KEY ("id") REFERENCES "StoredFile" ("approved_job");

ALTER TABLE "UploadedFileCategory" ADD FOREIGN KEY ("id") REFERENCES "StoredFile" ("file_category");

ALTER TABLE "GlobalUser_GF" ADD FOREIGN KEY ("id") REFERENCES "StoredFile" ("stored_by");

ALTER TABLE "Job_GF" ADD FOREIGN KEY ("id") REFERENCES "Variation" ("id");

ALTER TABLE "Entity_GF" ADD FOREIGN KEY ("id") REFERENCES "CSQ" ("manufacturer");

ALTER TABLE "Entity_GF" ADD FOREIGN KEY ("id") REFERENCES "CSQ" ("merchant");

ALTER TABLE "Job_GF" ADD FOREIGN KEY ("id") REFERENCES "JobNote" ("job");

ALTER TABLE "GlobalUser_GF" ADD FOREIGN KEY ("id") REFERENCES "JobNote" ("created_by");

ALTER TABLE "GlobalUser_GF" ADD FOREIGN KEY ("id") REFERENCES "JobNote" ("last_modified_by");

CREATE TABLE "JobNote_StoredFile" (
  "JobNote_associated_files" ManyToManyField,
  "StoredFile_id" PositiveSmallIntegerField,
  PRIMARY KEY ("JobNote_associated_files", "StoredFile_id")
);

ALTER TABLE "JobNote_StoredFile" ADD FOREIGN KEY ("JobNote_associated_files") REFERENCES "JobNote" ("associated_files");

ALTER TABLE "JobNote_StoredFile" ADD FOREIGN KEY ("StoredFile_id") REFERENCES "StoredFile" ("id");


ALTER TABLE "GlobalUser_GF" ADD FOREIGN KEY ("id") REFERENCES "JobNoteFollowUp" ("assigned_to");

ALTER TABLE "GlobalUser_GF" ADD FOREIGN KEY ("id") REFERENCES "JobNoteFollowUp" ("completed_by");

ALTER TABLE "Job_GF" ADD FOREIGN KEY ("id") REFERENCES "JobNotificationLog" ("job");

ALTER TABLE "JobNotificationLog" ADD FOREIGN KEY ("id") REFERENCES "JobNotificationRecipient" ("notification");

CREATE TABLE "ReportingArea_NZRegion" (
  "ReportingArea_regions" ManyToManyField,
  "NZRegion_id" PositiveSmallIntegerField,
  PRIMARY KEY ("ReportingArea_regions", "NZRegion_id")
);

ALTER TABLE "ReportingArea_NZRegion" ADD FOREIGN KEY ("ReportingArea_regions") REFERENCES "ReportingArea" ("regions");

ALTER TABLE "ReportingArea_NZRegion" ADD FOREIGN KEY ("NZRegion_id") REFERENCES "NZRegion" ("id");


ALTER TABLE "BuildingConsent" ADD FOREIGN KEY ("building_consent_number") REFERENCES "BuildingConsentBase" ("building_consent_number");

ALTER TABLE "BuildingConsent" ADD FOREIGN KEY ("legal_description") REFERENCES "BuildingConsentBase" ("legal_description");

ALTER TABLE "BuildingConsent" ADD FOREIGN KEY ("consented_area") REFERENCES "BuildingConsentBase" ("consented_area");

ALTER TABLE "Job_GF" ADD FOREIGN KEY ("id") REFERENCES "JobExternalAssociation" ("job");

ALTER TABLE "JobExternalAssociationType" ADD FOREIGN KEY ("id") REFERENCES "JobExternalAssociation" ("association_type");

ALTER TABLE "OfferedService_GF" ADD FOREIGN KEY ("id") REFERENCES "JobServiceLink" ("service");

ALTER TABLE "Entity_GF" ADD FOREIGN KEY ("id") REFERENCES "PriceBook" ("entity");

CREATE TABLE "PriceBook_PricingAttribute" (
  "PriceBook_pricebook_attributes" ManyToManyField,
  "PricingAttribute_id" PositiveSmallIntegerField,
  PRIMARY KEY ("PriceBook_pricebook_attributes", "PricingAttribute_id")
);

ALTER TABLE "PriceBook_PricingAttribute" ADD FOREIGN KEY ("PriceBook_pricebook_attributes") REFERENCES "PriceBook" ("pricebook_attributes");

ALTER TABLE "PriceBook_PricingAttribute" ADD FOREIGN KEY ("PricingAttribute_id") REFERENCES "PricingAttribute" ("id");


ALTER TABLE "CSQ" ADD FOREIGN KEY ("id") REFERENCES "PriceBook" ("csq_association");

ALTER TABLE "Entity_GF" ADD FOREIGN KEY ("id") REFERENCES "Entity_GF" ("parent");

CREATE TABLE "JobNoteFollowUp_GlobalUser_GF" (
  "JobNoteFollowUp_also_notify" ManyToManyField,
  "GlobalUser_GF_id" PositiveSmallIntegerField,
  PRIMARY KEY ("JobNoteFollowUp_also_notify", "GlobalUser_GF_id")
);

ALTER TABLE "JobNoteFollowUp_GlobalUser_GF" ADD FOREIGN KEY ("JobNoteFollowUp_also_notify") REFERENCES "JobNoteFollowUp" ("also_notify");

ALTER TABLE "JobNoteFollowUp_GlobalUser_GF" ADD FOREIGN KEY ("GlobalUser_GF_id") REFERENCES "GlobalUser_GF" ("id");


CREATE TABLE "Variation_StoredFile" (
  "Variation_associated_files" ManyToManyField,
  "StoredFile_id" PositiveSmallIntegerField,
  PRIMARY KEY ("Variation_associated_files", "StoredFile_id")
);

ALTER TABLE "Variation_StoredFile" ADD FOREIGN KEY ("Variation_associated_files") REFERENCES "Variation" ("associated_files");

ALTER TABLE "Variation_StoredFile" ADD FOREIGN KEY ("StoredFile_id") REFERENCES "StoredFile" ("id");

