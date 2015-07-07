--
-- The Archetype is configured with "hibernate.hbm2ddl.auto" value="create-drop" in "persistence.xml".
--
-- This will cause hibernate to populate the database when the application is started by processing the files that
-- were configured in the hibernate.hbm2ddl.import_files property.
--
-- This file is responsible for loading the the catalog data used in the Archetype.   Implementers can change this file
-- to load their initial catalog.
--

-- BLC Admin Required Categories
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (1,'Root','Root',NULL,NULL,CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (2, 'Primary Nav','Primary Nav',NULL,1,CURRENT_TIMESTAMP);

-- Custom store navigation (default template uses these for the header navigation)
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE, DISPLAY_TEMPLATE) VALUES (2001,'Home','Home','/',2,CURRENT_TIMESTAMP, 'layout/home');
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (2002,'Choose Design','Blouse_Designs','/bls-design',2,CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (2007,'Choose Design','Blouse_Front_Neck_Design','/bls-design/bls-fn-design',2,CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (2008,'Choose Design','Blouse_Back_Neck_Design','/bls-design/bls-bn-design',2,CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (2009,'Choose Design','Blouse_Sleeve_Design','/bls-design/bls-sl-design',2,CURRENT_TIMESTAMP);


INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (3002,'Choose Chudidhar Design','Chud_Designs','/bls-design',2,CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (3007,'Choose Chudidhar Design','Chud_Front_Neck_Design','/chud-design/chud-fn-design',2,CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (3008,'Choose Chudidhar Design','Chud_Back_Neck_Design','/chud-design/chud-bn-design',2,CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (3009,'Choose Chudidhar Design','Chud_Sleeve_Design','/chud-design/chud-sl-design',2,CURRENT_TIMESTAMP);


INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (2010,'Choose Tailor','Tailor','/bls-tailor',2,CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (2003,'Choose Material','Blouse_Materials','/bls-material',2,CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (3003,'Choose Material','Chudihar_Materials','/chud-material',2,CURRENT_TIMESTAMP);

INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (2004,'Embroidery','Embroidery','/embroidery',2,CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (2005,'Dress Makers','Dress_Makers','/new-to-hot-sauce',2,CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (2006,'FAQs','FAQs','/faq',2,CURRENT_TIMESTAMP);

-- Builds the category hierarchy (simple in this case) - Root --> Nav --> All other categories
INSERT INTO BLC_CATEGORY_XREF (SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (2002,2,3);
INSERT INTO BLC_CATEGORY_XREF (SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (2003,2,2);
INSERT INTO BLC_CATEGORY_XREF (SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (2004,2,4);
INSERT INTO BLC_CATEGORY_XREF (SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (2005,2,5);
INSERT INTO BLC_CATEGORY_XREF (SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (2006,2,6);
INSERT INTO BLC_CATEGORY_XREF (SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (2007,2002,7);
INSERT INTO BLC_CATEGORY_XREF (SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (2008,2002,8);
INSERT INTO BLC_CATEGORY_XREF (SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (2009,2002,9);
INSERT INTO BLC_CATEGORY_XREF (SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (2010,2,10);

INSERT INTO BLC_CATEGORY_XREF (SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (3002,2,3);
INSERT INTO BLC_CATEGORY_XREF (SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (3003,2,2);
--INSERT INTO BLC_CATEGORY_XREF (SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (3004,2,4);
--INSERT INTO BLC_CATEGORY_XREF (SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (3005,2,5);
--INSERT INTO BLC_CATEGORY_XREF (SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (3006,2,6);
INSERT INTO BLC_CATEGORY_XREF (SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (3007,3002,7);
INSERT INTO BLC_CATEGORY_XREF (SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (3008,3002,8);
INSERT INTO BLC_CATEGORY_XREF (SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (3009,3002,9);


-- Add in any applicable search facets for the given category
INSERT INTO BLC_FIELD (FIELD_ID, ENTITY_TYPE, PROPERTY_NAME, ABBREVIATION, SEARCHABLE, FACET_FIELD_TYPE) VALUES (1, 'PRODUCT', 'manufacturer', 'mfg', TRUE, 's');
INSERT INTO BLC_FIELD (FIELD_ID, ENTITY_TYPE, PROPERTY_NAME, ABBREVIATION, SEARCHABLE, FACET_FIELD_TYPE) VALUES (2, 'PRODUCT', 'productAttributes.heatRange', 'blousedesign', FALSE, 'i');
INSERT INTO BLC_FIELD (FIELD_ID, ENTITY_TYPE, PROPERTY_NAME, ABBREVIATION, SEARCHABLE, FACET_FIELD_TYPE) VALUES (3, 'PRODUCT', 'defaultSku.retailPrice', 'price', FALSE, 'p');
INSERT INTO BLC_FIELD (FIELD_ID, ENTITY_TYPE, PROPERTY_NAME, ABBREVIATION, SEARCHABLE, TRANSLATABLE, FACET_FIELD_TYPE) VALUES (4, 'PRODUCT', 'defaultSku.name', 'name', TRUE, TRUE, 's');
INSERT INTO BLC_FIELD (FIELD_ID, ENTITY_TYPE, PROPERTY_NAME, ABBREVIATION, SEARCHABLE, FACET_FIELD_TYPE) VALUES (5, 'PRODUCT', 'model', 'model', TRUE, 's');
INSERT INTO BLC_FIELD (FIELD_ID, ENTITY_TYPE, PROPERTY_NAME, ABBREVIATION, SEARCHABLE, TRANSLATABLE) VALUES (6, 'PRODUCT', 'defaultSku.description', 'desc', TRUE, TRUE);
INSERT INTO BLC_FIELD (FIELD_ID, ENTITY_TYPE, PROPERTY_NAME, ABBREVIATION, SEARCHABLE, TRANSLATABLE) VALUES (7, 'PRODUCT', 'defaultSku.longDescription', 'ldesc', TRUE, TRUE);

INSERT INTO BLC_FIELD_SEARCH_TYPES (FIELD_ID, SEARCHABLE_FIELD_TYPE) VALUES (1, 't');
-- Note that we are don't search on heat range
-- Note that we are don't search on price
INSERT INTO BLC_FIELD_SEARCH_TYPES (FIELD_ID, SEARCHABLE_FIELD_TYPE) VALUES (4, 't');
INSERT INTO BLC_FIELD_SEARCH_TYPES (FIELD_ID, SEARCHABLE_FIELD_TYPE) VALUES (5, 't');
INSERT INTO BLC_FIELD_SEARCH_TYPES (FIELD_ID, SEARCHABLE_FIELD_TYPE) VALUES (6, 't');
INSERT INTO BLC_FIELD_SEARCH_TYPES (FIELD_ID, SEARCHABLE_FIELD_TYPE) VALUES (7, 't');

INSERT INTO BLC_SEARCH_FACET (SEARCH_FACET_ID, FIELD_ID, LABEL, SHOW_ON_SEARCH, MULTISELECT, SEARCH_DISPLAY_PRIORITY) VALUES (1, 1, 'Manufacturer', FALSE, TRUE, 0);
INSERT INTO BLC_CAT_SEARCH_FACET_XREF (CATEGORY_SEARCH_FACET_ID, CATEGORY_ID, SEARCH_FACET_ID, SEQUENCE) VALUES (1, 2002, 1, 1);

INSERT INTO BLC_SEARCH_FACET (SEARCH_FACET_ID, FIELD_ID, LABEL, SHOW_ON_SEARCH, MULTISELECT, SEARCH_DISPLAY_PRIORITY) VALUES (2, 2, 'Embroidery', FALSE, TRUE, 0);
INSERT INTO BLC_CAT_SEARCH_FACET_XREF (CATEGORY_SEARCH_FACET_ID, CATEGORY_ID, SEARCH_FACET_ID, SEQUENCE) VALUES (2, 2002, 2, 2);

INSERT INTO BLC_SEARCH_FACET (SEARCH_FACET_ID, FIELD_ID, LABEL, SHOW_ON_SEARCH, MULTISELECT, SEARCH_DISPLAY_PRIORITY) VALUES (3, 3, 'Price', TRUE, TRUE, 1);
INSERT INTO BLC_CAT_SEARCH_FACET_XREF (CATEGORY_SEARCH_FACET_ID, CATEGORY_ID, SEARCH_FACET_ID, SEQUENCE) VALUES (3, 1, 3, 3);
INSERT INTO BLC_SEARCH_FACET_RANGE (SEARCH_FACET_RANGE_ID, SEARCH_FACET_ID, MIN_VALUE, MAX_VALUE) VALUES (1, 3, 0, 5);
INSERT INTO BLC_SEARCH_FACET_RANGE (SEARCH_FACET_RANGE_ID, SEARCH_FACET_ID, MIN_VALUE, MAX_VALUE) VALUES (2, 3, 5, 10);
INSERT INTO BLC_SEARCH_FACET_RANGE (SEARCH_FACET_RANGE_ID, SEARCH_FACET_ID, MIN_VALUE, MAX_VALUE) VALUES (3, 3, 10, 15);
INSERT INTO BLC_SEARCH_FACET_RANGE (SEARCH_FACET_RANGE_ID, SEARCH_FACET_ID, MIN_VALUE, MAX_VALUE) VALUES (4, 3, 15, null);

------------------------------------------------------------------------------------------------------------------
-- Inserting products manually involves five steps which are outlined below.   Typically, products are loaded 
-- up front in the project and then managed via the Broadleaf Commerce admin.   
--
-- Loading through this script is a convenient way to get started when prototyping and can be useful in development
-- as a way to share data-setup without requiring a shared DB connection. 
------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------
-- Load Catalog - Step 1:  Create the products
-- =============================================
-- In this step, we are also populating the manufacturer for the product
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (1,2007,'/bls-design/bls-fn-design/bridal_blouse_design1','Uma',TRUE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (2,2007,'/bls-design/bls-fn-design/bridal_blouse_design2','Uma',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (3,2007,'/bls-design/bls-fn-design/bridal_blouse_design3','Uma',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (4,2008,'/bls-design/bls-bn-design/bridal_blouse_design4','Uma',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (5,2008,'/bls-design/bls-bn-design/bridal_blouse_design5','Uma',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (6,2008,'/bls-design/bls-bn-design/bridal_blouse_design6','Rama',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (7,2009,'/bls-design/bls-sl-design/bridal_blouse_design7','Rama',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (8,2009,'/bls-design/bls-sl-design/bridal_blouse_design8','XYZ',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (9,2010,'/bls-tailor/tailor1','XYZ',TRUE);

INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (10,2003,'/bls-material/bridal_blouse_design10','XYZ',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (11,2003,'/bls-material/bridal_blouse_design11','XYZ',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (12,2003,'/bls-material/bridal_blouse_design12','Garden Row',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (13,2003,'/bls-material/bridal_blouse_design13','Uma',TRUE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (14,2003,'/bls-material/bridal_blouse_design14','Uma',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (15,2003,'/bls-material/bridal_blouse_design15','Surya',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (16,2003,'/bls-material/bridal_blouse_design16','Surya',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (17,2003,'/bls-material/bridal_blouse_design17','Surya',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (18,2003,'/bls-material/bridal_blouse_design18','Surya',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (19,2003,'/bls-material/bridal_blouse_design19','Surya',FALSE);



--Chudihar products
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (20,3003,'/chud-material/chud_design1','Uma',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (21,3003,'/chud-material/chud_design2','XYZ',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (22,3003,'/chud-material/chud_design3','Garden Row',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (23,3003,'/chud-material/chud_design4','Uma',TRUE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (24,3003,'/chud-material/chud_design5','Uma',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (25,3003,'/chud-material/chud_design6','Surya',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (26,3003,'/chud-material/chud_design7','Surya',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (27,3003,'/chud-material/chud_design8','Surya',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (28,3003,'/chud-material/chud_design9','Surya',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (29,3003,'/chud-material/chud_design10','Surya',FALSE);

--Chudihar front neck design
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (30,3007,'/chud-design/chud-fn-design/chud_design1','Uma',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (31,3007,'/chud-design/chud-fn-design/chud_design2','XYZ',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (32,3007,'/chud-design/chud-fn-design/chud_design3','Garden Row',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (33,3007,'/chud-design/chud-fn-design/chud_design4','Uma',TRUE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (34,3007,'/chud-design/chud-fn-design/chud_design5','Uma',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (35,3007,'/chud-design/chud-fn-design/chud_design6','Surya',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (36,3007,'/chud-design/chud-fn-design/chud_design7','Surya',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (37,3007,'/chud-design/chud-fn-design/chud_design8','Surya',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (38,3007,'/chud-design/chud-fn-design/chud_design9','Surya',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (39,3007,'/chud-design/chud-fn-design/chud_design10','Surya',FALSE);
-- Chudihar back nect desig
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (40,3008,'/chud-design/chud-bn-design/chud_design1','Uma',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (41,3008,'/chud-design/chud-bn-design/chud_design2','XYZ',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (42,3008,'/chud-design/chud-bn-design/chud_design3','Garden Row',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (43,3008,'/chud-design/chud-bn-design/chud_design4','Uma',TRUE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (44,3008,'/chud-design/chud-bn-design/chud_design5','Uma',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (45,3008,'/chud-design/chud-bn-design/chud_design6','Surya',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (46,3008,'/chud-design/chud-bn-design/chud_design7','Surya',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (47,3008,'/chud-design/chud-bn-design/chud_design8','Surya',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (48,3008,'/chud-design/chud-bn-design/chud_design9','Surya',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (49,3008,'/chud-design/chud-bn-design/chud_design10','Surya',FALSE);

--Chudihar sleeve desig
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (50,3009,'/chud-design/chud-sl-design/chud_design1','Uma',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (51,3009,'/chud-design/chud-sl-design/chud_design2','XYZ',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (52,3009,'/chud-design/chud-sl-design/chud_design3','Garden Row',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (53,3009,'/chud-design/chud-sl-design/chud_design4','Uma',TRUE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (54,3009,'/chud-design/chud-sl-design/chud_design5','Uma',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (55,3009,'/chud-design/chud-sl-design/chud_design6','Surya',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (56,3009,'/chud-design/chud-sl-design/chud_design7','Surya',TRUE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (57,3009,'/chud-design/chud-sl-design/chud_design8','Surya',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (58,3009,'/chud-design/chud-sl-design/chud_design9','Surya',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (59,3009,'/chud-design/chud-sl-design/chud_design10','Surya',FALSE);


INSERT INTO ENC_MATERIAL (PRODUCT_ID, TYPE, IS_DUMMY) VALUES (10, 'blouse', 1);
INSERT INTO ENC_MATERIAL (PRODUCT_ID, TYPE, IS_DUMMY) VALUES (11, 'blouse', 0);
INSERT INTO ENC_MATERIAL (PRODUCT_ID, TYPE, IS_DUMMY) VALUES (12, 'blouse', 0);
INSERT INTO ENC_MATERIAL (PRODUCT_ID, TYPE, IS_DUMMY) VALUES (13, 'blouse', 0);
INSERT INTO ENC_MATERIAL (PRODUCT_ID, TYPE, IS_DUMMY) VALUES (14, 'blouse', 0);
INSERT INTO ENC_MATERIAL (PRODUCT_ID, TYPE, IS_DUMMY) VALUES (15, 'blouse', 0);
INSERT INTO ENC_MATERIAL (PRODUCT_ID, TYPE, IS_DUMMY) VALUES (16, 'blouse', 0);
INSERT INTO ENC_MATERIAL (PRODUCT_ID, TYPE, IS_DUMMY) VALUES (17, 'blouse', 0);
INSERT INTO ENC_MATERIAL (PRODUCT_ID, TYPE, IS_DUMMY) VALUES (18, 'blouse', 0);
INSERT INTO ENC_MATERIAL (PRODUCT_ID, TYPE, IS_DUMMY) VALUES (19, 'blouse', 0);

INSERT INTO ENC_MATERIAL (PRODUCT_ID, TYPE, IS_DUMMY) VALUES (20, 'chud', 1);
INSERT INTO ENC_MATERIAL (PRODUCT_ID, TYPE, IS_DUMMY) VALUES (21, 'chud', 0);
INSERT INTO ENC_MATERIAL (PRODUCT_ID, TYPE, IS_DUMMY) VALUES (22, 'chud', 0);
INSERT INTO ENC_MATERIAL (PRODUCT_ID, TYPE, IS_DUMMY) VALUES (23, 'chud', 0);
INSERT INTO ENC_MATERIAL (PRODUCT_ID, TYPE, IS_DUMMY) VALUES (24, 'chud', 0);
INSERT INTO ENC_MATERIAL (PRODUCT_ID, TYPE, IS_DUMMY) VALUES (25, 'chud', 0);
INSERT INTO ENC_MATERIAL (PRODUCT_ID, TYPE, IS_DUMMY) VALUES (26, 'chud', 0);
INSERT INTO ENC_MATERIAL (PRODUCT_ID, TYPE, IS_DUMMY) VALUES (27, 'chud', 0);
INSERT INTO ENC_MATERIAL (PRODUCT_ID, TYPE, IS_DUMMY) VALUES (28, 'chud', 0);
INSERT INTO ENC_MATERIAL (PRODUCT_ID, TYPE, IS_DUMMY) VALUES (29, 'chud', 0);

-- Merchandise (products with options)
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (100,2004,'/embroidery/bls_design_embroidery','UMA Collections',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (200,2004,'/embroidery/bls_design_embroidery','UMA Collections',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (300,2004,'/embroidery/bls_design_embroidery','UMA Collections',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (400,2004,'/embroidery/chud_design_embroidery','Casual Moves',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (500,2004,'/embroidery/chud_design_embroidery','Casual Moves',FALSE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (600,2004,'/embroidery/chud_design_embroidery','Casual Moves',FALSE);

-- Bundles
INSERT INTO BLC_PRODUCT (PRODUCT_ID,ARCHIVED,CAN_SELL_WITHOUT_OPTIONS,DISPLAY_TEMPLATE,IS_FEATURED_PRODUCT,MANUFACTURE,MODEL,URL,URL_KEY,DEFAULT_CATEGORY_ID) VALUES (992,'N',false,null,false,null,null,'/bundle1',null,null);
INSERT INTO BLC_PRODUCT_BUNDLE (AUTO_BUNDLE,BUNDLE_PROMOTABLE,ITEMS_PROMOTABLE,PRICING_MODEL,BUNDLE_PRIORITY,PRODUCT_ID) VALUES (false,false,false,'ITEM_SUM',99,992);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,ARCHIVED,CAN_SELL_WITHOUT_OPTIONS,DISPLAY_TEMPLATE,IS_FEATURED_PRODUCT,MANUFACTURE,MODEL,URL,URL_KEY,DEFAULT_CATEGORY_ID) VALUES (993,'N',false,null,false,null,null,'/bundle2',null,null);
INSERT INTO BLC_PRODUCT_BUNDLE (AUTO_BUNDLE,BUNDLE_PROMOTABLE,ITEMS_PROMOTABLE,PRICING_MODEL,BUNDLE_PRIORITY,PRODUCT_ID) VALUES (false,false,false,'BUNDLE',99,993);



------------------------------------------------------------------------------------------------------------------
-- Load Catalog - Step 2:  Create "default" SKUs
-- =============================================
-- The Broadleaf Commerce product model is setup such that every product has a default SKU.   For many products,
-- a product only has one SKU.    SKUs hold the pricing information for the product and are the actual entity
-- that is added to the cart.    Inventory, Pricing, and Fulfillment concerns are done at the SKU level
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE, INVENTORY_TYPE) VALUES (1,1,'Blouse Design','Wedding is an occasion where every one display thier charm by dressing up well and hence the wedding blouse designs ',10.99,'Y','Y',CURRENT_TIMESTAMP, 'BASIC');
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE, INVENTORY_TYPE) VALUES (2,2,'Kashmiri Stitch design','Weaves of North India Just like Chikankari and Phulkari, Kashmiri embroidery work and weaving style is very famous amongst the North Indians',10.99,'Y','Y',CURRENT_TIMESTAMP, 'BASIC');
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (3,3,'Aari Embroidery','Wedding is an occasion where every one display thier charm by dressing up well and hence the wedding blouse Embroidery. ',4.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (4,4,'Chudihar Embroider','Formal Chudihars are never associated with an occasion rather creates festivity among the office mates and hence the chudihar Embroider.',6.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (5,5,'Fashion Embroidery','If you want hot, this is the chile to choose. Native to the Carribean, Yucatan and Northern Coast of South America, the Habanero presents itself in a variety of colors ranging from light green to a bright red. The Habanero''s bold heat, unique flavor and aroma has made it the favorite of chile lovers.',6.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (6,6,'Silk Ribbon design','Our ribbons are ideal for those interested in all creative crafts, such as embroidery, greeting cards, quilting, dolls, miniature work, scrapbooking, jewellery and sugarcraft, as well as fans, celebration bonbonnieres, hats and restoration work.  We have ribbon assortments in stunning colours, which are ideal, not only for weddings, but for all invitations',6.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (7,7,'Stone Embroidery','The stone embroidery is designed for suiting the distinct taste of fashion conscious customers, the creations are available in both vibrant and bold colors. Not only this, Utsav also presents customization of art work for making the demands of international customers. ',11.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (8,8,'Mirror Embroidery',' Shisha the Hindi word for (little glass) embroidery is also known as mirror-work or abla embroidery. Originally, pieces of mica were used as the mirrors, but later, thin blown-glass pieces were broken and used. Today, small mirrors are commercially available for shisha embroidery. If you use these, make sure to file the edges first so the mirrors arenÃ¢â‚¬â„¢t sharp.',4.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (9,9,'Cotton embroidery design','The stone embroidery is designed for suiting the distinct taste of fashion conscious customers, the creations are available in both vibrant and bold colors. Not only this, Utsav also presents customization of art work for making the demands of international customers.',12.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (10,10,'Pick Up Material','I have my Own Material',0.00,'N','N',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (11,11,'Run stitch embroidery design','The running stitch or straight stitch is the basic stitch in hand-sewing and embroidery, on which all other forms of sewing are based. The stitch is worked by passing the needle in and out of the fabric.',3.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (12,12,'Balochi embroidery','Balochi embroidery is one of the oldest in the history. Balochi female dresses are very famous because of their unique embroidery patterns adopted from the very native land',4.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (13,13,'Beads Embroidery','f you want to know the secrets of making great bead embroidery, here are my top five to get you started. But be warned: once you start making gorgeous pieces of bead embroidery jewelry, you won''t want to stop!',3.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (14,14,'Rubber Embroidery design','This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.',5.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (15,15,'Gajji Lace embroidery designs','Gajji silk fabric with black cotton thread repeating embroidery pattern. All embroidery work done by hand by women artisans in Gujarat, India. ',5.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (16,16,'Cross stitch design','Italian cross-stitch and Montenegrin stitch are reversible, meaning the work looks the same on ',5.99,'Y','Y',CURRENT_TIMESTAMP);

-- Chudidhar Sku configuration

INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE, INVENTORY_TYPE) VALUES (20,20,'Chudihar material','outing is an occasion where every one display thier charm by dressing up well and hence the Chudidhar designs ',10.99,'Y','Y',CURRENT_TIMESTAMP, 'BASIC');
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE, INVENTORY_TYPE) VALUES (21,21,'Chudihar material product21','Weaves of North India Just like Chikankari and Phulkari, Kashmiri embroidery work and weaving style is very famous amongst the North Indians',10.99,'Y','Y',CURRENT_TIMESTAMP, 'BASIC');
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE, INVENTORY_TYPE) VALUES (22,22,'Chudihar material product22','Weaves of North India Material 22 Just like Chikankari and Phulkari, Kashmiri embroidery work and weaving style is very famous amongst the North Indians',10.99,'Y','Y',CURRENT_TIMESTAMP, 'BASIC');
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (23,23,'Chudihar material product23','Wedding is an occasion where every one display thier charm by dressing up well and hence the wedding blouse Embroidery. ',4.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (24,24,'Chudihar material product24','Formal Chudihars are never associated with an occasion rather creates festivity among the office mates and hence the chudihar Embroider.',6.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (25,25,'Chudihar material product25','If you want hot, this is the chile to choose. Native to the Carribean, Yucatan and Northern Coast of South America, the Habanero presents itself in a variety of colors ranging from light green to a bright red. The Habanero''s bold heat, unique flavor and aroma has made it the favorite of chile lovers.',6.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (26,26,'Chudihar material product26','Our ribbons are ideal for those interested in all creative crafts, such as embroidery, greeting cards, quilting, dolls, miniature work, scrapbooking, jewellery and sugarcraft, as well as fans, celebration bonbonnieres, hats and restoration work.  We have ribbon assortments in stunning colours, which are ideal, not only for weddings, but for all invitations',6.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (27,27,'Chudihar material product27','The stone embroidery is designed for suiting the distinct taste of fashion conscious customers, the creations are available in both vibrant and bold colors. Not only this, Utsav also presents customization of art work for making the demands of international customers. ',11.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (28,28,'Chudihar material product28',' Shisha the Hindi word for (little glass) embroidery is also known as mirror-work or abla embroidery. Originally, pieces of mica were used as the mirrors, but later, thin blown-glass pieces were broken and used. Today, small mirrors are commercially available for shisha embroidery. If you use these, make sure to file the edges first so the mirrors arenÃ¢â‚¬â„¢t sharp.',4.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (29,29,'Chudihar material product29','The stone embroidery is designed for suiting the distinct taste of fashion conscious customers, the creations are available in both vibrant and bold colors. Not only this, Utsav also presents customization of art work for making the demands of international customers.',12.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (30,30,'Chudihar Design product30','I have my Own Material',0.00,'N','N',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (31,31,'Chudihar Design product31','The running stitch or straight stitch is the basic stitch in hand-sewing and embroidery, on which all other forms of sewing are based. The stitch is worked by passing the needle in and out of the fabric.',3.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (32,32,'Chudihar Design product32','Balochi embroidery is one of the oldest in the history. Balochi female dresses are very famous because of their unique embroidery patterns adopted from the very native land',4.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (33,33,'Chudihar Design product33','f you want to know the secrets of making great bead embroidery, here are my top five to get you started. But be warned: once you start making gorgeous pieces of bead embroidery jewelry, you won''t want to stop!',3.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (34,34,'Chudihar Design product34','This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.',5.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (35,35,'Chudihar Design product35','Gajji silk fabric with black cotton thread repeating embroidery pattern. All embroidery work done by hand by women artisans in Gujarat, India. ',5.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (36,36,'Chudihar Design product36','Italian cross-stitch and Montenegrin stitch are reversible, meaning the work looks the same on ',5.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (37,37,'Chudihar Design product37','Gajji silk fabric with black cotton thread repeating embroidery pattern. All embroidery work done by hand by women artisans in Gujarat, India. ',5.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (38,38,'Chudihar Design product38','Italian cross-stitch and Montenegrin stitch are reversible, meaning the work looks the same on ',5.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (39,39,'Chudihar Design product39','Gajji silk fabric with black cotton thread repeating embroidery pattern. All embroidery work done by hand by women artisans in Gujarat, India. ',5.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (40,40,'Chudihar Design product40','Italian cross-stitch and Montenegrin stitch are reversible, meaning the work looks the same on ',5.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (41,41,'Chudihar Design product41','The running stitch or straight stitch is the basic stitch in hand-sewing and embroidery, on which all other forms of sewing are based. The stitch is worked by passing the needle in and out of the fabric.',3.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (42,42,'Chudihar Design product41','Balochi embroidery is one of the oldest in the history. Balochi female dresses are very famous because of their unique embroidery patterns adopted from the very native land',4.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (43,43,'Chudihar Design product42','f you want to know the secrets of making great bead embroidery, here are my top five to get you started. But be warned: once you start making gorgeous pieces of bead embroidery jewelry, you won''t want to stop!',3.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (44,44,'Chudihar Design product43','This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.',5.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (45,45,'Chudihar Design product44','Gajji silk fabric with black cotton thread repeating embroidery pattern. All embroidery work done by hand by women artisans in Gujarat, India. ',5.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (46,46,'Chudihar Design product45','Italian cross-stitch and Montenegrin stitch are reversible, meaning the work looks the same on ',5.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (47,47,'Chudihar Design product46','Gajji silk fabric with black cotton thread repeating embroidery pattern. All embroidery work done by hand by women artisans in Gujarat, India. ',5.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (48,48,'Chudihar Design product47','Italian cross-stitch and Montenegrin stitch are reversible, meaning the work looks the same on ',5.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (49,49,'Chudihar Design product48','Gajji silk fabric with black cotton thread repeating embroidery pattern. All embroidery work done by hand by women artisans in Gujarat, India. ',5.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (50,50,'Chudihar Design product49','Italian cross-stitch and Montenegrin stitch are reversible, meaning the work looks the same on ',5.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (51,51,'Chudihar Design product50','The running stitch or straight stitch is the basic stitch in hand-sewing and embroidery, on which all other forms of sewing are based. The stitch is worked by passing the needle in and out of the fabric.',3.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (52,52,'Chudihar Design product51','Balochi embroidery is one of the oldest in the history. Balochi female dresses are very famous because of their unique embroidery patterns adopted from the very native land',4.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (53,53,'Chudihar Design product51','f you want to know the secrets of making great bead embroidery, here are my top five to get you started. But be warned: once you start making gorgeous pieces of bead embroidery jewelry, you won''t want to stop!',3.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (54,54,'Chudihar Design product52','This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.',5.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (55,55,'Chudihar Design product53','Gajji silk fabric with black cotton thread repeating embroidery pattern. All embroidery work done by hand by women artisans in Gujarat, India. ',5.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (56,56,'Chudihar Design product54','Italian cross-stitch and Montenegrin stitch are reversible, meaning the work looks the same on ',5.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (57,57,'Chudihar Design product56','Gajji silk fabric with black cotton thread repeating embroidery pattern. All embroidery work done by hand by women artisans in Gujarat, India. ',5.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (58,58,'Chudihar Design product57','Italian cross-stitch and Montenegrin stitch are reversible, meaning the work looks the same on ',5.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (59,59,'Chudihar Design product59','Gajji silk fabric with black cotton thread repeating embroidery pattern. All embroidery work done by hand by women artisans in Gujarat, India. ',5.99,'Y','Y',CURRENT_TIMESTAMP);


--bundle1 Skus
INSERT INTO BLC_SKU (SKU_ID,ACTIVE_END_DATE,ACTIVE_START_DATE,AVAILABLE_FLAG,DESCRIPTION,CONTAINER_SHAPE,DEPTH,DIMENSION_UNIT_OF_MEASURE,GIRTH,HEIGHT,CONTAINER_SIZE,WIDTH,DISCOUNTABLE_FLAG,FULFILLMENT_TYPE,INVENTORY_TYPE,IS_MACHINE_SORTABLE,LONG_DESCRIPTION,NAME,RETAIL_PRICE,SALE_PRICE,TAXABLE_FLAG,WEIGHT,WEIGHT_UNIT_OF_MEASURE,DEFAULT_PRODUCT_ID) VALUES (9992,{ts '2099-04-05 00:00:00'},{ts '2001-02-24 00:00:00'},null,null,null,null,null,null,null,null,null,null,null,null,true,null,'bundle1',13,3,null,null,null,992);
INSERT INTO BLC_SKU_BUNDLE_ITEM (SKU_BUNDLE_ITEM_ID,ITEM_SALE_PRICE,QUANTITY,PRODUCT_BUNDLE_ID,SKU_ID) VALUES (92,null,1,992,1);
INSERT INTO BLC_SKU_BUNDLE_ITEM (SKU_BUNDLE_ITEM_ID,ITEM_SALE_PRICE,QUANTITY,PRODUCT_BUNDLE_ID,SKU_ID) VALUES (93,null,1,992,2);

---bundle2 Skus
INSERT INTO BLC_SKU (SKU_ID,ACTIVE_END_DATE,ACTIVE_START_DATE,AVAILABLE_FLAG,DESCRIPTION,CONTAINER_SHAPE,DEPTH,DIMENSION_UNIT_OF_MEASURE,GIRTH,HEIGHT,CONTAINER_SIZE,WIDTH,DISCOUNTABLE_FLAG,FULFILLMENT_TYPE,INVENTORY_TYPE,IS_MACHINE_SORTABLE,LONG_DESCRIPTION,NAME,RETAIL_PRICE,SALE_PRICE,TAXABLE_FLAG,WEIGHT,WEIGHT_UNIT_OF_MEASURE,DEFAULT_PRODUCT_ID) VALUES (9993,{ts '2099-01-06 00:00:00'},{ts '2001-02-24 00:00:00'},null,null,null,null,null,null,null,null,null,null,null,null,true,null,'bundle2',12.00,2.00,null,null,null,993);
INSERT INTO BLC_SKU_BUNDLE_ITEM (SKU_BUNDLE_ITEM_ID,ITEM_SALE_PRICE,QUANTITY,PRODUCT_BUNDLE_ID,SKU_ID) VALUES (94,null,1,993,1);
INSERT INTO BLC_SKU_BUNDLE_ITEM (SKU_BUNDLE_ITEM_ID,ITEM_SALE_PRICE,QUANTITY,PRODUCT_BUNDLE_ID,SKU_ID) VALUES (95,null,1,993,2);

------------------------------------------------------------------------------------------------------------------
-- Give some of the SKUs a sale price
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,SALE_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (17,17,'Revive Designs ','This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.',5.99,4.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,SALE_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (18,18,'Eye candy','  This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.',5.99,4.49,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,SALE_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (19,19,'Charisma','This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.',5.99,4.09,'Y','Y',CURRENT_TIMESTAMP);

------------------------------------------------------------------------------------------------------------------
-- Some SKUs (such as merchandise) may be product options based on one product. For example, there may be a 
-- "Men's Hand drawn Heat Clinic Shirt" product that has up to 12 SKUs showing the options of 
-- Red/Black/Silver, and Small/Medium/Large/X-Large
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_PRODUCT_OPTION (PRODUCT_OPTION_ID, OPTION_TYPE, ATTRIBUTE_NAME, LABEL, REQUIRED) VALUES (1, 'COLOR', 'COLOR', 'Shirt Color', TRUE);
INSERT INTO BLC_PRODUCT_OPTION (PRODUCT_OPTION_ID, OPTION_TYPE, ATTRIBUTE_NAME, LABEL, REQUIRED) VALUES (2, 'SIZE', 'SIZE', 'Shirt Size', TRUE);
INSERT INTO BLC_PRODUCT_OPTION (PRODUCT_OPTION_ID, OPTION_TYPE, ATTRIBUTE_NAME, LABEL, REQUIRED,USE_IN_SKU_GENERATION,VALIDATION_TYPE,VALIDATION_STRING,ERROR_MESSAGE,ERROR_CODE) VALUES (3, 'TEXT', 'NAME', 'Personalized Name', FALSE,FALSE,'REGEX','[a-zA-Z ]{3,30}','Name must be less than 30 characters, with only letters and spaces','INVALID_NAME');

INSERT INTO BLC_PRODUCT_OPTION_VALUE (PRODUCT_OPTION_VALUE_ID, ATTRIBUTE_VALUE, DISPLAY_ORDER, PRODUCT_OPTION_ID) VALUES (1, 'Black', 1, 1);
INSERT INTO BLC_PRODUCT_OPTION_VALUE (PRODUCT_OPTION_VALUE_ID, ATTRIBUTE_VALUE, DISPLAY_ORDER, PRODUCT_OPTION_ID) VALUES (2, 'Red', 2, 1);
INSERT INTO BLC_PRODUCT_OPTION_VALUE (PRODUCT_OPTION_VALUE_ID, ATTRIBUTE_VALUE, DISPLAY_ORDER, PRODUCT_OPTION_ID) VALUES (3, 'Silver', 3, 1);
INSERT INTO BLC_PRODUCT_OPTION_VALUE (PRODUCT_OPTION_VALUE_ID, ATTRIBUTE_VALUE, DISPLAY_ORDER, PRODUCT_OPTION_ID) VALUES (11, 'S', 1, 2);
INSERT INTO BLC_PRODUCT_OPTION_VALUE (PRODUCT_OPTION_VALUE_ID, ATTRIBUTE_VALUE, DISPLAY_ORDER, PRODUCT_OPTION_ID) VALUES (12, 'M', 2, 2);
INSERT INTO BLC_PRODUCT_OPTION_VALUE (PRODUCT_OPTION_VALUE_ID, ATTRIBUTE_VALUE, DISPLAY_ORDER, PRODUCT_OPTION_ID) VALUES (13, 'L', 3, 2);
INSERT INTO BLC_PRODUCT_OPTION_VALUE (PRODUCT_OPTION_VALUE_ID, ATTRIBUTE_VALUE, DISPLAY_ORDER, PRODUCT_OPTION_ID) VALUES (14, 'XL', 4, 2);

INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (100,100,'Japanese geisha','Men s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.',14.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (200,200,'Cool Neck for ladies dress','Women''s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.',14.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (300,300,'Traditional Ladies dress','This hand-drawn logo shirt for men features a regular fit in three different colors',15.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (400,400,'IndianÃ‚Â ethnic Wear',' Collection(Women s)This hand-drawn logo shirt for women features a regular fit in three different colors',15.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (500,500,'Fancy Tunic','Don''t you just love our mascot? Get your very own shirt today!',15.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (600,600,'Khatli panching design (Women''s)','Don''t you just love our mascot? Get your very own shirt today!',15.99,'Y','Y',CURRENT_TIMESTAMP);

------------------------------------------------------------------------------------------------------------------
-- Create non-default SKUs for some merchandise. In this case, we're stating that all XL shirts are $1.00 more
-- All other combinations have no special properties, but we must create them so we can track inventory on a 
-- per-SKU level. Generally, either you have only a default SKU or SKUs for all permutations of product options
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_SKU (SKU_ID,RETAIL_PRICE,DISCOUNTABLE_FLAG) VALUES (114,16.99,'Y');
INSERT INTO BLC_SKU (SKU_ID,RETAIL_PRICE,DISCOUNTABLE_FLAG) VALUES (124,16.99,'Y');
INSERT INTO BLC_SKU (SKU_ID,RETAIL_PRICE,DISCOUNTABLE_FLAG) VALUES (134,16.99,'Y');
INSERT INTO BLC_SKU (SKU_ID,RETAIL_PRICE,DISCOUNTABLE_FLAG) VALUES (214,16.99,'Y');
INSERT INTO BLC_SKU (SKU_ID,RETAIL_PRICE,DISCOUNTABLE_FLAG) VALUES (224,16.99,'Y');
INSERT INTO BLC_SKU (SKU_ID,RETAIL_PRICE,DISCOUNTABLE_FLAG) VALUES (234,16.99,'Y');
INSERT INTO BLC_SKU (SKU_ID,RETAIL_PRICE,DISCOUNTABLE_FLAG) VALUES (314,16.99,'Y');
INSERT INTO BLC_SKU (SKU_ID,RETAIL_PRICE,DISCOUNTABLE_FLAG) VALUES (324,16.99,'Y');
INSERT INTO BLC_SKU (SKU_ID,RETAIL_PRICE,DISCOUNTABLE_FLAG) VALUES (334,16.99,'Y');
INSERT INTO BLC_SKU (SKU_ID,RETAIL_PRICE,DISCOUNTABLE_FLAG) VALUES (414,16.99,'Y');
INSERT INTO BLC_SKU (SKU_ID,RETAIL_PRICE,DISCOUNTABLE_FLAG) VALUES (424,16.99,'Y');
INSERT INTO BLC_SKU (SKU_ID,RETAIL_PRICE,DISCOUNTABLE_FLAG) VALUES (434,16.99,'Y');
INSERT INTO BLC_SKU (SKU_ID,RETAIL_PRICE,DISCOUNTABLE_FLAG) VALUES (514,16.99,'Y');
INSERT INTO BLC_SKU (SKU_ID,RETAIL_PRICE,DISCOUNTABLE_FLAG) VALUES (524,16.99,'Y');
INSERT INTO BLC_SKU (SKU_ID,RETAIL_PRICE,DISCOUNTABLE_FLAG) VALUES (534,16.99,'Y');
INSERT INTO BLC_SKU (SKU_ID,RETAIL_PRICE,DISCOUNTABLE_FLAG) VALUES (614,16.99,'Y');
INSERT INTO BLC_SKU (SKU_ID,RETAIL_PRICE,DISCOUNTABLE_FLAG) VALUES (624,16.99,'Y');
INSERT INTO BLC_SKU (SKU_ID,RETAIL_PRICE,DISCOUNTABLE_FLAG) VALUES (634,16.99,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (111,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (112,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (113,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (121,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (122,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (123,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (131,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (132,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (133,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (211,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (212,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (213,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (221,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (222,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (223,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (231,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (232,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (233,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (311,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (312,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (313,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (321,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (322,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (323,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (331,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (332,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (333,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (411,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (412,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (413,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (421,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (422,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (423,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (431,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (432,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (433,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (511,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (512,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (513,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (521,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (522,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (523,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (531,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (532,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (533,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (611,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (612,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (613,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (621,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (622,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (623,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (631,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (632,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (633,'Y');

------------------------------------------------------------------------------------------------------------------
-- Associate the appropriate option values for the skus
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (111, 1), (111, 11);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (112, 1), (112, 12);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (113, 1), (113, 13);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (114, 1), (114, 14);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (121, 2), (121, 11);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (122, 2), (122, 12);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (123, 2), (123, 13);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (124, 2), (124, 14);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (131, 3), (131, 11);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (132, 3), (132, 12);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (133, 3), (133, 13);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (134, 3), (134, 14);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (211, 1), (211, 11);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (212, 1), (212, 12);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (213, 1), (213, 13);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (214, 1), (214, 14);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (221, 2), (221, 11);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (222, 2), (222, 12);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (223, 2), (223, 13);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (224, 2), (224, 14);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (231, 3), (231, 11);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (232, 3), (232, 12);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (233, 3), (233, 13);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (234, 3), (234, 14);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (311, 1), (311, 11);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (312, 1), (312, 12);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (313, 1), (313, 13);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (314, 1), (314, 14);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (321, 2), (321, 11);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (322, 2), (322, 12);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (323, 2), (323, 13);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (324, 2), (324, 14);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (331, 3), (331, 11);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (332, 3), (332, 12);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (333, 3), (333, 13);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (334, 3), (334, 14);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (411, 1), (411, 11);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (412, 1), (412, 12);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (413, 1), (413, 13);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (414, 1), (414, 14);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (421, 2), (421, 11);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (422, 2), (422, 12);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (423, 2), (423, 13);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (424, 2), (424, 14);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (431, 3), (431, 11);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (432, 3), (432, 12);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (433, 3), (433, 13);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (434, 3), (434, 14);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (511, 1), (511, 11);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (512, 1), (512, 12);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (513, 1), (513, 13);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (514, 1), (514, 14);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (521, 2), (521, 11);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (522, 2), (522, 12);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (523, 2), (523, 13);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (524, 2), (524, 14);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (531, 3), (531, 11);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (532, 3), (532, 12);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (533, 3), (533, 13);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (534, 3), (534, 14);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (611, 1), (611, 11);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (612, 1), (612, 12);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (613, 1), (613, 13);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (614, 1), (614, 14);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (621, 2), (621, 11);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (622, 2), (622, 12);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (623, 2), (623, 13);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (624, 2), (624, 14);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (631, 3), (631, 11);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (632, 3), (632, 12);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (633, 3), (633, 13);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (634, 3), (634, 14);


------------------------------------------------------------------------------------------------------------------
-- Add some heat levels to all the products
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_PRODUCT_ATTRIBUTE (PRODUCT_ATTRIBUTE_ID, PRODUCT_ID, NAME, VALUE) VALUES (1, 1, 'blouseDesign', 4);
INSERT INTO BLC_PRODUCT_ATTRIBUTE (PRODUCT_ATTRIBUTE_ID, PRODUCT_ID, NAME, VALUE) VALUES (2, 2, 'blouseDesign', 1);
INSERT INTO BLC_PRODUCT_ATTRIBUTE (PRODUCT_ATTRIBUTE_ID, PRODUCT_ID, NAME, VALUE) VALUES (3, 3, 'blouseDesign', 2);
INSERT INTO BLC_PRODUCT_ATTRIBUTE (PRODUCT_ATTRIBUTE_ID, PRODUCT_ID, NAME, VALUE) VALUES (4, 4, 'blouseDesign', 2);
INSERT INTO BLC_PRODUCT_ATTRIBUTE (PRODUCT_ATTRIBUTE_ID, PRODUCT_ID, NAME, VALUE) VALUES (5, 5, 'blouseDesign', 4);
INSERT INTO BLC_PRODUCT_ATTRIBUTE (PRODUCT_ATTRIBUTE_ID, PRODUCT_ID, NAME, VALUE) VALUES (6, 6, 'blouseDesign', 4);
INSERT INTO BLC_PRODUCT_ATTRIBUTE (PRODUCT_ATTRIBUTE_ID, PRODUCT_ID, NAME, VALUE) VALUES (7, 7, 'blouseDesign', 3);
INSERT INTO BLC_PRODUCT_ATTRIBUTE (PRODUCT_ATTRIBUTE_ID, PRODUCT_ID, NAME, VALUE) VALUES (8, 8, 'blouseDesign', 4);
INSERT INTO BLC_PRODUCT_ATTRIBUTE (PRODUCT_ATTRIBUTE_ID, PRODUCT_ID, NAME, VALUE) VALUES (9, 9, 'blouseDesign', 5);
INSERT INTO BLC_PRODUCT_ATTRIBUTE (PRODUCT_ATTRIBUTE_ID, PRODUCT_ID, NAME, VALUE) VALUES (10, 10, 'blouseDesign', 5);
INSERT INTO BLC_PRODUCT_ATTRIBUTE (PRODUCT_ATTRIBUTE_ID, PRODUCT_ID, NAME, VALUE) VALUES (11, 11, 'blouseDesign', 2);
INSERT INTO BLC_PRODUCT_ATTRIBUTE (PRODUCT_ATTRIBUTE_ID, PRODUCT_ID, NAME, VALUE) VALUES (12, 12, 'blouseDesign', 1);
INSERT INTO BLC_PRODUCT_ATTRIBUTE (PRODUCT_ATTRIBUTE_ID, PRODUCT_ID, NAME, VALUE) VALUES (13, 13, 'blouseDesign', 2);
INSERT INTO BLC_PRODUCT_ATTRIBUTE (PRODUCT_ATTRIBUTE_ID, PRODUCT_ID, NAME, VALUE) VALUES (14, 14, 'blouseDesign', 2);
INSERT INTO BLC_PRODUCT_ATTRIBUTE (PRODUCT_ATTRIBUTE_ID, PRODUCT_ID, NAME, VALUE) VALUES (15, 15, 'blouseDesign', 1);
INSERT INTO BLC_PRODUCT_ATTRIBUTE (PRODUCT_ATTRIBUTE_ID, PRODUCT_ID, NAME, VALUE) VALUES (16, 16, 'blouseDesign', 3);
INSERT INTO BLC_PRODUCT_ATTRIBUTE (PRODUCT_ATTRIBUTE_ID, PRODUCT_ID, NAME, VALUE) VALUES (17, 17, 'blouseDesign', 5);
INSERT INTO BLC_PRODUCT_ATTRIBUTE (PRODUCT_ATTRIBUTE_ID, PRODUCT_ID, NAME, VALUE) VALUES (18, 18, 'blouseDesign', 3);
INSERT INTO BLC_PRODUCT_ATTRIBUTE (PRODUCT_ATTRIBUTE_ID, PRODUCT_ID, NAME, VALUE) VALUES (19, 19, 'blouseDesign', 1);

------------------------------------------------------------------------------------------------------------------
-- Link the non-default SKUs for merchandise
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_PRODUCT_SKU_XREF (SKU_ID, PRODUCT_ID) VALUES (111, 100), (112, 100), (113, 100), (114, 100), (121, 100), (122, 100), (123, 100), (124, 100), (131, 100), (132, 100), (133, 100), (134, 100);
INSERT INTO BLC_PRODUCT_SKU_XREF (SKU_ID, PRODUCT_ID) VALUES (211, 200), (212, 200), (213, 200), (214, 200), (221, 200), (222, 200), (223, 200), (224, 200), (231, 200), (232, 200), (233, 200), (234, 200);
INSERT INTO BLC_PRODUCT_SKU_XREF (SKU_ID, PRODUCT_ID) VALUES (311, 300), (312, 300), (313, 300), (314, 300), (321, 300), (322, 300), (323, 300), (324, 300), (331, 300), (332, 300), (333, 300), (334, 300);
INSERT INTO BLC_PRODUCT_SKU_XREF (SKU_ID, PRODUCT_ID) VALUES (411, 400), (412, 400), (413, 400), (414, 400), (421, 400), (422, 400), (423, 400), (424, 400), (431, 400), (432, 400), (433, 400), (434, 400);
INSERT INTO BLC_PRODUCT_SKU_XREF (SKU_ID, PRODUCT_ID) VALUES (511, 500), (512, 500), (513, 500), (514, 500), (521, 500), (522, 500), (523, 500), (524, 500), (531, 500), (532, 500), (533, 500), (534, 500);
INSERT INTO BLC_PRODUCT_SKU_XREF (SKU_ID, PRODUCT_ID) VALUES (611, 600), (612, 600), (613, 600), (614, 600), (621, 600), (622, 600), (623, 600), (624, 600), (631, 600), (632, 600), (633, 600), (634, 600);

------------------------------------------------------------------------------------------------------------------
-- Associate the merchandise products with their appropriate available product options
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_PRODUCT_OPTION_XREF (PRODUCT_OPTION_ID, PRODUCT_ID) VALUES (1, 100);
INSERT INTO BLC_PRODUCT_OPTION_XREF (PRODUCT_OPTION_ID, PRODUCT_ID) VALUES (1, 200);
INSERT INTO BLC_PRODUCT_OPTION_XREF (PRODUCT_OPTION_ID, PRODUCT_ID) VALUES (1, 300);
INSERT INTO BLC_PRODUCT_OPTION_XREF (PRODUCT_OPTION_ID, PRODUCT_ID) VALUES (1, 400);
INSERT INTO BLC_PRODUCT_OPTION_XREF (PRODUCT_OPTION_ID, PRODUCT_ID) VALUES (1, 500);
INSERT INTO BLC_PRODUCT_OPTION_XREF (PRODUCT_OPTION_ID, PRODUCT_ID) VALUES (1, 600);
INSERT INTO BLC_PRODUCT_OPTION_XREF (PRODUCT_OPTION_ID, PRODUCT_ID) VALUES (2, 100);
INSERT INTO BLC_PRODUCT_OPTION_XREF (PRODUCT_OPTION_ID, PRODUCT_ID) VALUES (2, 200);
INSERT INTO BLC_PRODUCT_OPTION_XREF (PRODUCT_OPTION_ID, PRODUCT_ID) VALUES (2, 300);
INSERT INTO BLC_PRODUCT_OPTION_XREF (PRODUCT_OPTION_ID, PRODUCT_ID) VALUES (2, 400);
INSERT INTO BLC_PRODUCT_OPTION_XREF (PRODUCT_OPTION_ID, PRODUCT_ID) VALUES (2, 500);
INSERT INTO BLC_PRODUCT_OPTION_XREF (PRODUCT_OPTION_ID, PRODUCT_ID) VALUES (2, 600);
INSERT INTO BLC_PRODUCT_OPTION_XREF (PRODUCT_OPTION_ID, PRODUCT_ID) VALUES (3, 100);

------------------------------------------------------------------------------------------------------------------
-- Load Catalog - Step 3:  Create Category/Product Mapping
-- ========================================================
-- Add all hot-sauce items to the hot-sauce category
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (1,2007,1);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (2,2007,2);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (3,2007,3);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (4,2008,4);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (5,2008,5);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (6,2008,6);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (7,2009,7);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (8,2009,8);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (9,2010,9);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (10,2003,10);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (11,2003,11);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (12,2003,12);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (13,2003,13);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (14,2003,14);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (15,2003,15);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (16,2003,16);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (17,2003,17);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (18,2003,18);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (19,2003,19);

-- home page items
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (3,2001,1);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (6,2001,2);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (9,2001,3);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (12,2001,4);

-- clearance items
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (7,2004,1);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (8,2004,2);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (10,2004,3);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (11,2004,4);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (18,2004,5);

-- merchandise items
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (100,2004,1);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (200,2004,2);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (300,2004,3);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (400,2004,4);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (500,2004,5);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (600,2004,6);

--Chudihar entires to be added
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (20,3003,1);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (21,3003,2);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (22,3003,3);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (23,3003,4);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (24,3003,5);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (25,3003,6);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (26,3003,7);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (27,3003,8);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (28,3003,9);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (29,3003,10);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (30,3007,19);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (31,3007,11);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (32,3007,12);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (33,3007,13);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (34,3007,14);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (35,3007,15);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (36,3007,16);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (37,3007,17);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (38,3007,18);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (39,3007,19);

INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (49,3008,10);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (40,3008,19);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (41,3008,11);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (42,3008,12);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (43,3008,13);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (44,3008,14);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (45,3008,15);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (46,3008,16);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (47,3008,17);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (48,3008,18);

INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (59,3009,10);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (50,3009,19);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (51,3009,11);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (52,3009,12);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (53,3009,13);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (54,3009,14);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (55,3009,15);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (56,3009,16);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (57,3009,17);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (58,3009,18);


------------------------------------------------------------------------------------------------------------------
-- Load Catalog - Step 4:  Media Items used by products
-- ========================================================
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (101,'/cmsstatic/img/merch/bls_des(1).jpg','Sudden Death Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (102,'/cmsstatic/img/merch/bls_des(2).jpg','Sudden Death Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (201,'/cmsstatic/img/merch/bls_des(3).jpg','Sweet Death Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (202,'/cmsstatic/img/merch/bls_des(4).jpg','Sweet Death Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (203,'/cmsstatic/img/merch/bls_des(5).jpg','Sweet Death Sauce Close-up','alt2');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (204,'/cmsstatic/img/merch/bls_des(6).jpg','Sweet Death Sauce Close-up','alt3');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (205,'/cmsstatic/img/merch/bls_des(7).jpg','Sweet Death Sauce Close-up','alt4');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (206,'/cmsstatic/img/merch/bls_des(8).jpg','Sweet Death Sauce Close-up','alt5');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (301,'/cmsstatic/img/merch/bls_des(9).jpg','Hoppin Hot Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (302,'/cmsstatic/img/merch/bls_emb_des(1).jpg','Hoppin Hot Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (401,'/cmsstatic/img/merch/bls_emb_des(2).jpg','Day of the Dead Chipotle Hot Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (402,'/cmsstatic/img/merch/bls_emb_des(3).jpg','Day of the Dead Chipotle Hot Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (501,'/cmsstatic/img/merch/bls_emb_des(4).jpg','Day of the Dead Habanero Hot Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (502,'/cmsstatic/img/merch/bls_emb_des(5).jpg','Day of the Dead Habanero Hot Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (601,'/cmsstatic/img/merch/bls_emb_des(6).jpg','Day of the Dead Scotch Bonnet Hot Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (602,'/cmsstatic/img/merch/bls_emb_des(7).jpg','Day of the Dead Scotch Bonnet Hot Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (701,'/cmsstatic/img/merch/bls_emb_des(1).jpg','Green Ghost Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (702,'/cmsstatic/img/merch/bls_emb_des(2).jpg','Green Ghost Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (801,'/cmsstatic/img/merch/bls_emb_des(3).jpg','Blazin Saddle XXX Hot Habanero Pepper Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (802,'/cmsstatic/img/merch/bls_emb_des(4).jpg','Blazin Saddle XXX Hot Habanero Pepper Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (901,'/cmsstatic/img/merch/bls_emb_des(5).jpg','Armageddon The Hot Sauce To End All Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (902,'/cmsstatic/img/merch/chud_des(1).jpg','Armageddon The Hot Sauce To End All Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (1001,'/cmsstatic/img/merch/chud_des(2).jpg','Dr. Chilemeisters Insane Hot Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (1002,'/cmsstatic/img/merch/chud_des(3).jpg','Dr. Chilemeisters Insane Hot Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (1101,'/cmsstatic/img/merch/chud_des(4).jpg','Bull Snort Cowboy Cayenne Pepper Hot Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (1102,'/cmsstatic/img/merch/chud_des(5).jpg','Bull Snort Cowboy Cayenne Pepper Hot Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (1201,'/cmsstatic/img/merch/chud_des(6).jpg','Cafe Louisiane Sweet Cajun Blackening Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (1202,'/cmsstatic/img/merch/chud_des(1).jpg','Cafe Louisiane Sweet Cajun Blackening Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (1301,'/cmsstatic/img/merch/chud_des(2).jpg','Bull Snort Smokin Toncils Hot Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (1302,'/cmsstatic/img/merch/chud_des(3).jpg','Bull Snort Smokin Toncils Hot Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (1401,'/cmsstatic/img/merch/chud_emb_des(1).jpg','Cool Cayenne Pepper Hot Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (1402,'/cmsstatic/img/merch/chud_emb_des(2).jpg','Cool Cayenne Pepper Hot Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (1501,'/cmsstatic/img/merch/chud_emb_des(3).jpg','Roasted Garlic Hot Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (1502,'/cmsstatic/img/merch/chud_emb_des(4).jpg','Roasted Garlic Hot Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (1601,'/cmsstatic/img/merch/chud_emb_des(5).jpg','Scotch Bonnet Hot Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (1602,'/cmsstatic/img/merch/chud_emb_des(6).jpg','Scotch Bonnet Hot Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (1701,'/cmsstatic/img/merch/chud_emb_des(7).jpg','Insanity Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (1702,'/cmsstatic/img/merch/chud_emb_des(8).jpg','Insanity Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (1801,'/cmsstatic/img/merch/chud_emb_des(9).jpg','Hurtin Jalepeno Hot Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (1802,'/cmsstatic/img/merch/chud_emb_des(10).jpg','Hurtin Jalepeno Hot Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (1901,'/cmsstatic/img/merch/chud_des(10).jpg','Roasted Red Pepper and Chipotle Hot Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (1902,'/cmsstatic/img/merch/chud_des(20).jpg','Roasted Red Pepper and Chipotle Hot Sauce Close-up','alt1');

INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT, TAGS) VALUES (10001,'/cmsstatic/img/merch/bls_des(11).jpg','Hawt Like a Habanero Men''s Black','primary','Black');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT, TAGS) VALUES (10002,'/cmsstatic/img/merch/bls_des(12).jpg','Hawt Like a Habanero Men''s Red','primary','Red');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT, TAGS) VALUES (10003,'/cmsstatic/img/merch/bls_des(13).jpg','Hawt Like a Habanero Men''s Silver','primary','Silver');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT, TAGS) VALUES (20001,'/cmsstatic/img/merch/bls_des(14).jpg','Hawt Like a Habanero Women''s Black','primary','Black');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT, TAGS) VALUES (20002,'/cmsstatic/img/merch/bls_des(15).jpg','Hawt Like a Habanero Women''s Red','primary','Red');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT, TAGS) VALUES (20003,'/cmsstatic/img/merch/bls_des(16).jpg','Hawt Like a Habanero Women''s Silver','primary','Silver');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (30001,'/cmsstatic/img/merch/chud_des(7).jpg','Heat Clinic Hand-Drawn Men''s Black','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (30002,'/cmsstatic/img/merch/chud_des(8).jpg','Heat Clinic Hand-Drawn Men''s Red','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (30003,'/cmsstatic/img/merch/chud_des(9).jpg','Heat Clinic Hand-Drawn Men''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (40001,'/cmsstatic/img/merch/chud_des(10).jpg','Heat Clinic Hand-Drawn Women''s Black','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (40002,'/cmsstatic/img/merch/chud_des(11).jpg','Heat Clinic Hand-Drawn Women''s Red','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (40003,'/cmsstatic/img/merch/chud_des(12).jpg','Heat Clinic Hand-Drawn Women''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (50001,'/cmsstatic/img/merch/chud_des(13).jpg','Heat Clinic Mascot Men''s Black','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (50002,'/cmsstatic/img/merch/chud_des(14).jpg','Heat Clinic Mascot Men''s Red','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (50003,'/cmsstatic/img/merch/chud_des(15).jpg','Heat Clinic Mascot Men''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (60001,'/cmsstatic/img/merch/chud_des(16).jpg','Heat Clinic Mascot Women''s Black','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (60002,'/cmsstatic/img/merch/chud_des(17).jpg','Heat Clinic Mascot Women''s Red','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (60003,'/cmsstatic/img/merch/chud_des(18).jpg','Heat Clinic Mascot Women''s Silver','primary');

-- Chud Material
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (50011,'/cmsstatic/img/merch/Material/chud_des(1).jpg','Chudidhar Material 1''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (50012,'/cmsstatic/img/merch/Material/chud_des(2).jpg','Chudidhar Material 2''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (50013,'/cmsstatic/img/merch/Material/chud_des(3).jpg','Chudidhar Material 3''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (50014,'/cmsstatic/img/merch/Material/chud_des(4).jpg','Chudidhar Material 4''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (50015,'/cmsstatic/img/merch/Material/chud_des(5).jpg','Chudidhar Material 5''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (50016,'/cmsstatic/img/merch/Material/chud_des(6).jpg','Chudidhar Material 6''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (50017,'/cmsstatic/img/merch/Material/chud_des(7).jpg','Chudidhar Material 7''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (50018,'/cmsstatic/img/merch/Material/chud_des(8).jpg','Chudidhar Material 8''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (50019,'/cmsstatic/img/merch/Material/chud_des(9).jpg','Chudidhar Material 9''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (50020,'/cmsstatic/img/merch/Material/chud_des(10).jpg','Chudidhar Material 10''s Silver','primary');


--Chudidhar front neck
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (60013,'/cmsstatic/img/merch/FrontNeck/chud_des(1).jpg','FrontNeck Chudidhar design 1''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (60023,'/cmsstatic/img/merch/FrontNeck/chud_des(2).jpg','FrontNeck Chudidhar design 2''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (60033,'/cmsstatic/img/merch/FrontNeck/chud_des(3).jpg','FrontNeck Chudidhar design 3''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (60043,'/cmsstatic/img/merch/FrontNeck/chud_des(4).jpg','FrontNeck Chudidhar design 4''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (60053,'/cmsstatic/img/merch/FrontNeck/chud_des(5).jpg','FrontNeck Chudidhar design 5''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (60063,'/cmsstatic/img/merch/FrontNeck/chud_des(6).jpg','FrontNeck Chudidhar design 6''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (60073,'/cmsstatic/img/merch/FrontNeck/chud_des(6).jpg','FrontNeck Chudidhar design 7''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (60083,'/cmsstatic/img/merch/FrontNeck/chud_des(6).jpg','FrontNeck Chudidhar design 8''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (60093,'/cmsstatic/img/merch/FrontNeck/chud_des(7).jpg','FrontNeck Chudidhar design 9''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (60103,'/cmsstatic/img/merch/FrontNeck/chud_des(8).jpg','FrontNeck Chudidhar design 10''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (60113,'/cmsstatic/img/merch/FrontNeck/chud_des(9).jpg','FrontNeck Chudidhar design 11''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (60123,'/cmsstatic/img/merch/FrontNeck/chud_des(10).jpg','FrontNeck Chudidhar design 12''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (60133,'/cmsstatic/img/merch/FrontNeck/chud_des(21).jpg','FrontNeck Chudidhar design 13''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (60143,'/cmsstatic/img/merch/FrontNeck/chud_des(22).jpg','FrontNeck Chudidhar design 14''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (60153,'/cmsstatic/img/merch/FrontNeck/chud_des(23).jpg','FrontNeck Chudidhar design 15''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (60163,'/cmsstatic/img/merch/FrontNeck/chud_des(24).jpg','FrontNeck Chudidhar design 16''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (60173,'/cmsstatic/img/merch/FrontNeck/chud_des(25).jpg','FrontNeck Chudidhar design 17''s Silver','primary');

--Chudidhar back neck
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (70013,'/cmsstatic/img/merch/BackNeck/chud_des(12).jpg','BackNeck Chudidhar design 1''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (70023,'/cmsstatic/img/merch/BackNeck/chud_des(1).jpg','BackNeck Chudidhar design 2''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (70033,'/cmsstatic/img/merch/BackNeck/chud_des(2).jpg','BackNeck Chudidhar design 3''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (70043,'/cmsstatic/img/merch/BackNeck/chud_des(3).jpg','BackNeck Chudidhar design 4''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (70053,'/cmsstatic/img/merch/BackNeck/chud_des(4).jpg','BackNeck Chudidhar design 5''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (70063,'/cmsstatic/img/merch/BackNeck/chud_des(5).jpg','BackNeck Chudidhar design 6''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (70073,'/cmsstatic/img/merch/BackNeck/chud_des(6).jpg','BackNeck Chudidhar design 7''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (70083,'/cmsstatic/img/merch/BackNeck/chud_des(7).jpg','BackNeck Chudidhar design 8''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (70093,'/cmsstatic/img/merch/BackNeck/chud_des(8).jpg','BackNeck Chudidhar design 9''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (70010,'/cmsstatic/img/merch/BackNeck/chud_des(9).jpg','BackNeck Chudidhar design 10''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (70011,'/cmsstatic/img/merch/BackNeck/chud_des(10).jpg','BackNeck Chudidhar design 11''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (70012,'/cmsstatic/img/merch/BackNeck/chud_des(12).jpg','BackNeck Chudidhar design 12''s Silver','primary');

--Chudidhar Sleeve Design
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (80013,'/cmsstatic/img/merch/Sleeve/chud_des(1).jpg','Sleeve Chudidhar design 1''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (80023,'/cmsstatic/img/merch/Sleeve/chud_des(2).jpg','Sleeve Chudidhar design 2''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (80033,'/cmsstatic/img/merch/Sleeve/chud_des(3).jpg','Sleeve Chudidhar design 3''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (80043,'/cmsstatic/img/merch/Sleeve/chud_des(4).jpg','Sleeve Chudidhar design 4''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (80053,'/cmsstatic/img/merch/Sleeve/chud_des(5).jpg','Sleeve Chudidhar design 5''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (80063,'/cmsstatic/img/merch/Sleeve/chud_des(6).jpg','Sleeve Chudidhar design 6''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (80073,'/cmsstatic/img/merch/Sleeve/chud_des(7).jpg','Sleeve Chudidhar design 7''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (80083,'/cmsstatic/img/merch/Sleeve/chud_des(8).jpg','Sleeve Chudidhar design 8''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (80093,'/cmsstatic/img/merch/Sleeve/chud_des(9).jpg','Sleeve Chudidhar design 9''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (80010,'/cmsstatic/img/merch/Sleeve/chud_des(10).jpg','Sleeve Chudidhar design 10''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (80011,'/cmsstatic/img/merch/Sleeve/chud_des(11).jpg','Sleeve Chudidhar design 11''s Silver','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (80012,'/cmsstatic/img/merch/Sleeve/chud_des(10).jpg','Sleeve Chudidhar design 12''s Silver','primary');

------------------------------------------------------------------------------------------------------------------
-- Load Catalog - Step 5:  Mapping for product to media
-- ========================================================
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (1,101,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (2,201,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (3,301,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (4,401,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (5,501,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (6,601,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (7,701,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (8,801,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (9,901,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (10,1001,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (11,1101,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (12,1201,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (13,1301,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (14,1401,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (15,1501,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (16,1601,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (17,1701,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (18,1801,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (19,1901,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (1,102,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (2,202,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (3,302,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (4,402,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (5,502,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (6,602,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (7,702,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (8,802,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (9,902,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (10,1002,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (11,1102,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (12,1202,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (13,1302,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (14,1402,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (15,1502,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (16,1602,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (17,1702,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (18,1802,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (19,1902,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (2,203,'alt2');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (2,204,'alt3');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (2,205,'alt4');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (2,206,'alt5');

INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (100,10001,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (200,20002,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (300,30003,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (400,40002,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (500,50003,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (600,60001,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (100,10002,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (200,20001,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (300,30001,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (400,40001,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (500,50001,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (600,60002,'alt1');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (100,10003,'alt2');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (200,20003,'alt2');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (300,30002,'alt2');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (400,40003,'alt2');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (500,50002,'alt2');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (600,60003,'alt2');

--Chudidhar entries

INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (20,50011,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (21,50012,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (22,50013,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (23,50014,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (24,50015,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (25,50016,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (26,50017,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (27,50018,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (28,50019,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (29,50020,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (30,60083,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (31,60093,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (32,60103,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (33,60113,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (34,60123,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (35,60133,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (36,60143,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (37,60153,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (38,60163,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (39,60173,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (40,70012,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (41,70013,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (42,70023,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (43,70033,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (44,70043,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (45,70053,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (46,70063,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (47,70073,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (48,70083,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (49,70093,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (50,80010,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (51,80013,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (52,80023,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (53,80033,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (54,80043,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (56,80053,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (57,80063,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (58,80073,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (59,80083,'primary');
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (55,80093,'primary');


------------------------------------------------------------------------------------------------------------------
-- Load Catalog - Step 5: Asset Items (media)
-- ========================================================
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (101,'image/jpg','FILESYSTEM','/img/merch/bls_des(1).jpg','Sudden Death Sauce Bottle');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (102,'image/jpg','FILESYSTEM','/img/merch/bls_des(2).jpg','Sudden Death Sauce Close-up');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (201,'image/jpg','FILESYSTEM','/img/merch/bls_des(3).jpg','Sweet Death Sauce Bottle');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (202,'image/jpg','FILESYSTEM','/img/merch/bls_des(4).jpg','Sweet Death Sauce Close-up');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (203,'image/jpg','FILESYSTEM','/img/merch/bls_des(5).jpg','Sweet Death Sauce Close-up');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (204,'image/jpg','FILESYSTEM','/img/merch/bls_des(6).jpg','Sweet Death Sauce Close-up');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (205,'image/jpg','FILESYSTEM','/img/merch/bls_des(7).jpg','Sweet Death Sauce Close-up');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (206,'image/jpg','FILESYSTEM','/img/merch/bls_des(8).jpg','Sweet Death Sauce Close-up');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (301,'image/jpg','FILESYSTEM','/img/merch/bls_des(9).jpg','Hoppin Hot Sauce Bottle');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (302,'image/jpg','FILESYSTEM','/img/merch/bls_emb_des(1).jpg','Hoppin Hot Sauce Close-up');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (401,'image/jpg','FILESYSTEM','/img/merch/bls_emb_des(2).jpg','Day of the Dead Chipotle Hot Sauce Bottle');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (402,'image/jpg','FILESYSTEM','/img/merch/bls_emb_des(3).jpg','Day of the Dead Chipotle Hot Sauce Close-up');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (501,'image/jpg','FILESYSTEM','/img/merch/bls_emb_des(4).jpg','Day of the Dead Habanero Hot Sauce Bottle');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (502,'image/jpg','FILESYSTEM','/img/merch/bls_emb_des(5).jpg','Day of the Dead Habanero Hot Sauce Close-up');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (601,'image/jpg','FILESYSTEM','/img/merch/bls_emb_des(6).jpg','Day of the Dead Scotch Bonnet Hot Sauce Bottle');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (602,'image/jpg','FILESYSTEM','/img/merch/bls_emb_des(7).jpg','Day of the Dead Scotch Bonnet Hot Sauce Close-up');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (701,'image/jpg','FILESYSTEM','/img/merch/bls_emb_des(1).jpg','Green Ghost Bottle');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (702,'image/jpg','FILESYSTEM','/img/merch/bls_emb_des(2).jpg','Green Ghost Close-up');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (801,'image/jpg','FILESYSTEM','/img/merch/bls_emb_des(3).jpg','Blazin Saddle XXX Hot Habanero Pepper Sauce Bottle');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (802,'image/jpg','FILESYSTEM','/img/merch/bls_emb_des(4).jpg','Blazin Saddle XXX Hot Habanero Pepper Sauce Close-up');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (901,'image/jpg','FILESYSTEM','/img/merch/bls_emb_des(5).jpg','Armageddon The Hot Sauce To End All Bottle');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (902,'image/jpg','FILESYSTEM','/img/merch/chud_des(1).jpg','Armageddon The Hot Sauce To End All Close-up');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (1001,'image/jpg','FILESYSTEM','/img/merch/chud_des(2).jpg','Dr. Chilemeisters Insane Hot Sauce Bottle');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (1002,'image/jpg','FILESYSTEM','/img/merch/chud_des(3).jpg','Dr. Chilemeisters Insane Hot Sauce Close-up');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (1101,'image/jpg','FILESYSTEM','/img/merch/chud_des(4).jpg','Bull Snort Cowboy Cayenne Pepper Hot Sauce Bottle');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (1102,'image/jpg','FILESYSTEM','/img/merch/chud_des(5).jpg','Bull Snort Cowboy Cayenne Pepper Hot Sauce Close-up');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (1201,'image/jpg','FILESYSTEM','/img/merch/chud_des(6).jpg','Cafe Louisiane Sweet Cajun Blackening Sauce Bottle');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (1202,'image/jpg','FILESYSTEM','/img/merch/chud_des(1).jpg','Cafe Louisiane Sweet Cajun Blackening Sauce Close-up');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (1301,'image/jpg','FILESYSTEM','/img/merch/chud_des(2).jpg','Bull Snort Smokin Toncils Hot Sauce Bottle');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (1302,'image/jpg','FILESYSTEM','/img/merch/chud_des(3).jpg','Bull Snort Smokin Toncils Hot Sauce Close-up');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (1401,'image/jpg','FILESYSTEM','/img/merch/chud_emb_des(1).jpg','Cool Cayenne Pepper Hot Sauce Bottle');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (1402,'image/jpg','FILESYSTEM','/img/merch/chud_emb_des(2).jpg','Cool Cayenne Pepper Hot Sauce Close-up');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (1501,'image/jpg','FILESYSTEM','/img/merch/chud_emb_des(3).jpg','Roasted Garlic Hot Sauce Bottle');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (1502,'image/jpg','FILESYSTEM','/img/merch/chud_emb_des(4).jpg','Roasted Garlic Hot Sauce Close-up');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (1601,'image/jpg','FILESYSTEM','/img/merch/chud_emb_des(5).jpg','Scotch Bonnet Hot Sauce Bottle');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (1602,'image/jpg','FILESYSTEM','/img/merch/chud_emb_des(6).jpg','Scotch Bonnet Hot Sauce Close-up');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (1701,'image/jpg','FILESYSTEM','/img/merch/chud_emb_des(7).jpg','Insanity Sauce Bottle');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (1702,'image/jpg','FILESYSTEM','/img/merch/chud_emb_des(8).jpg','Insanity Sauce Close-up');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (1801,'image/jpg','FILESYSTEM','/img/merch/chud_emb_des(9).jpg','Hurtin Jalepeno Hot Sauce Bottle');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (1802,'image/jpg','FILESYSTEM','/img/merch/chud_emb_des(10).jpg','Hurtin Jalepeno Hot Sauce Close-up');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (1901,'image/jpg','FILESYSTEM','/img/merch/chud_des(10).jpg','Roasted Red Pepper and Chipotle Hot Sauce Bottle');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (1902,'image/jpg','FILESYSTEM','/img/merch/chud_des(20).jpg','Roasted Red Pepper and Chipotle Hot Sauce Close-up');

--Chudichar entires
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (50011,'image/jpg','FILESYSTEM','/img/merch/Material/chud_des(1).jpg','Front Neck design asset 1''s Black');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (50012,'image/jpg','FILESYSTEM','/img/merch/Material/chud_des(2).jpg','Front Neck design asset 2''s Red');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (50013,'image/jpg','FILESYSTEM','/img/merch/Material/chud_des(3).jpg','Front Neck design asset 3''s Silver');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (50014,'image/jpg','FILESYSTEM','/img/merch/Material/chud_des(4).jpg','Front Neck design asset 4''s Black');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (50015,'image/jpg','FILESYSTEM','/img/merch/Material/chud_des(5).jpg','Front Neck design asset 5''s Red');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (50016,'image/jpg','FILESYSTEM','/img/merch/Material/chud_des(6).jpg','Front Neck design asset 6''s Silver');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (50017,'image/jpg','FILESYSTEM','/img/merch/Material/chud_des(7).jpg','Front Neck design asset 7''s Black');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (50018,'image/jpg','FILESYSTEM','/img/merch/Material/chud_des(8).jpg','Front Neck design asset 8''s Red');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (50019,'image/jpg','FILESYSTEM','/img/merch/Material/chud_des(9).jpg','Front Neck design asset 9''s Silver');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (50020,'image/jpg','FILESYSTEM','/img/merch/Material/chud_des(10).jpg','Front Neck design asset 10''s Silver');

INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (60013,'image/jpg','FILESYSTEM','/img/merch/FrontNeck/chud_des(1).jpg','Front Neck design asset 1''s Black');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (60023,'image/jpg','FILESYSTEM','/img/merch/FrontNeck/chud_des(2).jpg','Front Neck design asset 2''s Red');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (60033,'image/jpg','FILESYSTEM','/img/merch/FrontNeck/chud_des(3).jpg','Front Neck design asset 3''s Silver');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (60043,'image/jpg','FILESYSTEM','/img/merch/FrontNeck/chud_des(4).jpg','Front Neck design asset 4''s Black');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (60053,'image/jpg','FILESYSTEM','/img/merch/FrontNeck/chud_des(5).jpg','Front Neck design asset 5''s Red');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (60063,'image/jpg','FILESYSTEM','/img/merch/FrontNeck/chud_des(6).jpg','Front Neck design asset 6''s Silver');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (60073,'image/jpg','FILESYSTEM','/img/merch/FrontNeck/chud_des(7).jpg','Front Neck design asset 7''s Black');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (60083,'image/jpg','FILESYSTEM','/img/merch/FrontNeck/chud_des(8).jpg','Front Neck design asset 8''s Red');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (60093,'image/jpg','FILESYSTEM','/img/merch/FrontNeck/chud_des(9).jpg','Front Neck design asset 9''s Silver');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (70013,'image/jpg','FILESYSTEM','/img/merch/BackNeck/chud_des(1).jpg','Back Neck design asset 1''s Black');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (70023,'image/jpg','FILESYSTEM','/img/merch/BackNeck/chud_des(10).jpg','Back Neck design asset 2''s Red');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (70033,'image/jpg','FILESYSTEM','/img/merch/BackNeck/chud_des(2).jpg','Back Neck design asset 3''s Silver');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (70043,'image/jpg','FILESYSTEM','/img/merch/BackNeck/chud_des(3).jpg','Back Neck design asset 4''s Black');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (70053,'image/jpg','FILESYSTEM','/img/merch/BackNeck/chud_des(4).jpg','Back Neck design asset 5''s Red');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (70063,'image/jpg','FILESYSTEM','/img/merch/BackNeck/chud_des(5).jpg','Back Neck design asset 6''s Silver');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (70073,'image/jpg','FILESYSTEM','/img/merch/BackNeck/chud_des(6).jpg','Back Neck design asset 7''s Black');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (70083,'image/jpg','FILESYSTEM','/img/merch/BackNeck/chud_des(7).jpg','Back Neck design asset 8''s Red');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (70093,'image/jpg','FILESYSTEM','/img/merch/BackNeck/chud_des(8).jpg','Back Neck design asset 9''s Silver');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (60103,'image/jpg','FILESYSTEM','/img/merch/FrontNeck/chud_des(8).jpg','Front Neck design asset 10''s Black');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (60113,'image/jpg','FILESYSTEM','/img/merch/FrontNeck/chud_des(9).jpg','Front Neck design asset 11''s Red');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (60123,'image/jpg','FILESYSTEM','/img/merch/FrontNeck/chud_des(10).jpg','Front Neck design asset 12''s Silver');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (60133,'image/jpg','FILESYSTEM','/img/merch/FrontNeck/chud_des(21).jpg','Front Neck design asset 13''s Black');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (60143,'image/jpg','FILESYSTEM','/img/merch/FrontNeck/chud_des(22).jpg','Front Neck design asset 14''s Red');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (60153,'image/jpg','FILESYSTEM','/img/merch/FrontNeck/chud_des(23).jpg','Front Neck design asset 15''s Silver');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (60163,'image/jpg','FILESYSTEM','/img/merch/FrontNeck/chud_des(24).jpg','Front Neck design asset 16''s Black');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (60173,'image/jpg','FILESYSTEM','/img/merch/FrontNeck/chud_des(25).jpg','Front Neck design asset 17''s Red');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (60183,'image/jpg','FILESYSTEM','/img/merch/FrontNeck/chud_des(18).jpg','Front Neck design asset 18''s Silver');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (60193,'image/jpg','FILESYSTEM','/img/merch/FrontNeck/bls_des(19).jpg','Sleeve design asset 1''s Silver');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (80001,'image/jpg','FILESYSTEM','/img/merch/Sleeve/chud_des(7).jpg','Sleeve design asset 1''s Black');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (80002,'image/jpg','FILESYSTEM','/img/merch/Sleeve/chud_des(8).jpg','Sleeve design asset 2''s Red');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (80003,'image/jpg','FILESYSTEM','/img/merch/Sleeve/chud_des(9).jpg','Sleeve design asset 3''s Silver');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (80011,'image/jpg','FILESYSTEM','/img/merch/Sleeve/chud_des(1).jpg','Sleeve design asset 4''s Black');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (80012,'image/jpg','FILESYSTEM','/img/merch/Sleeve/chud_des(10).jpg','Sleeve design asset 5''s Red');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (80013,'image/jpg','FILESYSTEM','/img/merch/Sleeve/chud_des(2).jpg','Sleeve design asset 6''s Silver');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (80014,'image/jpg','FILESYSTEM','/img/merch/Sleeve/chud_des(3).jpg','Sleeve design asset 7''s Black');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (80015,'image/jpg','FILESYSTEM','/img/merch/Sleeve/chud_des(4).jpg','Sleeve design asset 8''s Red');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (80016,'image/jpg','FILESYSTEM','/img/merch/Sleeve/chud_des(5).jpg','Sleeve design asset 9''s Silver');
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (80017,'image/jpg','FILESYSTEM','/img/merch/Sleeve/chud_des(6).jpg','Sleeve design asset 10''s Black');





------------------------------------------------------------------------------------------------------------------
-- End of Catalog load
-- ========================================================
------------------------------------------------------------------------------------------------------------------

INSERT INTO BLC_URL_HANDLER(URL_HANDLER_ID, INCOMING_URL, NEW_URL, URL_REDIRECT_TYPE) VALUES (1, '/googlePerm', 'http://www.google.com', 'REDIRECT_PERM');
INSERT INTO BLC_URL_HANDLER(URL_HANDLER_ID, INCOMING_URL, NEW_URL, URL_REDIRECT_TYPE) VALUES (2, '/googleTemp', 'http://www.google.com', 'REDIRECT_TEMP');
INSERT INTO BLC_URL_HANDLER(URL_HANDLER_ID, INCOMING_URL, NEW_URL, URL_REDIRECT_TYPE) VALUES (3, '/insanity', '/hot-sauces/insanity_sauce', 'FORWARD');
INSERT INTO BLC_URL_HANDLER(URL_HANDLER_ID, INCOMING_URL, NEW_URL, URL_REDIRECT_TYPE) VALUES (4, '/jalepeno', '/hot-sauces/hurtin_jalepeno_hot_sauce', 'REDIRECT_TEMP');

INSERT INTO BLC_SEARCH_INTERCEPT(SEARCH_REDIRECT_ID, PRIORITY,SEARCH_TERM, URL) VALUES (1,1, 'insanity', '/hot-sauces/insanity_sauce');
INSERT INTO BLC_SEARCH_INTERCEPT(SEARCH_REDIRECT_ID,PRIORITY, SEARCH_TERM, URL,ACTIVE_START_DATE,ACTIVE_END_DATE) VALUES (2,-10, 'new york', '/search?q=pace picante','1992-10-15 14:28:36','1999-10-15 21:28:36');

-----------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-- RELATED PRODUCT - DATA (featured products for right-hand side display)
-----------------------------------------------------------------------------------------------------------------------------------
-- Adding to root category
INSERT INTO BLC_PRODUCT_FEATURED(FEATURED_PRODUCT_ID, SEQUENCE, CATEGORY_ID, PRODUCT_ID)  VALUES (1, 1, 1, 18);
INSERT INTO BLC_PRODUCT_FEATURED(FEATURED_PRODUCT_ID, SEQUENCE, CATEGORY_ID, PRODUCT_ID)  VALUES (2, 2, 1, 15);
INSERT INTO BLC_PRODUCT_FEATURED(FEATURED_PRODUCT_ID, SEQUENCE, CATEGORY_ID, PRODUCT_ID)  VALUES (3, 3, 1, 200);
INSERT INTO BLC_PRODUCT_FEATURED(FEATURED_PRODUCT_ID, SEQUENCE, CATEGORY_ID, PRODUCT_ID)  VALUES (4, 4, 1, 100);

-- Adding to merchandise category
INSERT INTO BLC_PRODUCT_FEATURED(FEATURED_PRODUCT_ID, SEQUENCE, CATEGORY_ID, PRODUCT_ID)  VALUES (5, 1, 2003, 4);

-- Adding to hot-sauces category
INSERT INTO BLC_PRODUCT_FEATURED(FEATURED_PRODUCT_ID, SEQUENCE, CATEGORY_ID, PRODUCT_ID)  VALUES (8, 4, 2002, 500);
INSERT INTO BLC_PRODUCT_FEATURED(FEATURED_PRODUCT_ID, SEQUENCE, CATEGORY_ID, PRODUCT_ID)  VALUES (9, 4, 2002, 200);
INSERT INTO BLC_PRODUCT_FEATURED(FEATURED_PRODUCT_ID, SEQUENCE, CATEGORY_ID, PRODUCT_ID)  VALUES (10, 4, 2002, 300);

-- Adding a 20% off sale to Merchandise category to fit the Shirts Special Homepage Banner
INSERT INTO BLC_OFFER (OFFER_ID, APPLIES_TO_RULES, OFFER_NAME, START_DATE, END_DATE, OFFER_TYPE, OFFER_DISCOUNT_TYPE, OFFER_VALUE, OFFER_DELIVERY_TYPE, STACKABLE, COMBINABLE_WITH_OTHER_OFFERS, OFFER_PRIORITY, APPLY_OFFER_TO_MARKED_ITEMS, APPLY_TO_SALE_PRICE, USES, MAX_USES) VALUES (1,NULL, 'Shirts Special',CURRENT_DATE,'2020-01-01 00:00:00','ORDER_ITEM','PERCENT_OFF',20,'AUTOMATIC',TRUE,TRUE,10,FALSE,FALSE,0,0);

INSERT INTO BLC_OFFER_ITEM_CRITERIA (OFFER_ITEM_CRITERIA_ID, ORDER_ITEM_MATCH_RULE, QUANTITY) VALUES (1, 'MVEL.eval("toUpperCase()",discreteOrderItem.category.name)==MVEL.eval("toUpperCase()","embroidery")', 1);

INSERT INTO BLC_TAR_CRIT_OFFER_XREF (OFFER_ITEM_CRITERIA_ID, OFFER_ID) VALUES (1, 1);

-- Sample fulfillment option
INSERT INTO BLC_FULFILLMENT_OPTION (FULFILLMENT_OPTION_ID, NAME, LONG_DESCRIPTION, USE_FLAT_RATES, FULFILLMENT_TYPE) VALUES (1, 'Standard', '5 - 7 Days', FALSE, 'PHYSICAL');
INSERT INTO BLC_FULFILLMENT_OPTION (FULFILLMENT_OPTION_ID, NAME, LONG_DESCRIPTION, USE_FLAT_RATES, FULFILLMENT_TYPE) VALUES (2, 'Priority', '3 - 5 Days', FALSE, 'PHYSICAL');
INSERT INTO BLC_FULFILLMENT_OPTION (FULFILLMENT_OPTION_ID, NAME, LONG_DESCRIPTION, USE_FLAT_RATES, FULFILLMENT_TYPE) VALUES (3, 'Express', '1 - 2 Days', FALSE, 'PHYSICAL');

INSERT INTO BLC_FULFILLMENT_OPTION_FIXED (FULFILLMENT_OPTION_ID, PRICE) VALUES (1, 5.00);
INSERT INTO BLC_FULFILLMENT_OPTION_FIXED (FULFILLMENT_OPTION_ID, PRICE) VALUES (2, 10.00);
INSERT INTO BLC_FULFILLMENT_OPTION_FIXED (FULFILLMENT_OPTION_ID, PRICE) VALUES (3, 20.00);

--- New Order Item States
INSERT INTO ENC_ORDER_ITEM_STATES (ORDER_ITEM_STATE_ID, ORDER_ITEM_STATE_NAME, ORDER_ITEM_STATE_SHORT_DESC,ORDER_ITEM_STATE_LONG_DESC, END_DATE) values (100, 'SUBMITTED' ,'SUBMITTED', 'SUBMITTED', {ts '2099-04-05 00:00:00'} );
INSERT INTO ENC_ORDER_ITEM_STATES (ORDER_ITEM_STATE_ID, ORDER_ITEM_STATE_NAME, ORDER_ITEM_STATE_SHORT_DESC,ORDER_ITEM_STATE_LONG_DESC, END_DATE) values (101, 'MATERIAL_SHIPPED' ,'MATERIAL_SHIPPED', 'MATERIAL_SHIPPED', {ts '2099-04-05 00:00:00'} );
INSERT INTO ENC_ORDER_ITEM_STATES (ORDER_ITEM_STATE_ID, ORDER_ITEM_STATE_NAME, ORDER_ITEM_STATE_SHORT_DESC,ORDER_ITEM_STATE_LONG_DESC, END_DATE) values (102, 'STITCHING_IN_PROGRESS' ,'STITCHING_IN_PROGRESS', 'STITCHING_IN_PROGRESS', {ts '2099-04-05 00:00:00'} );
INSERT INTO ENC_ORDER_ITEM_STATES (ORDER_ITEM_STATE_ID, ORDER_ITEM_STATE_NAME, ORDER_ITEM_STATE_SHORT_DESC,ORDER_ITEM_STATE_LONG_DESC, END_DATE) values (103, 'SHIPPED' ,'SHIPPED', 'SHIPPED', {ts '2099-04-05 00:00:00'} );
INSERT INTO ENC_ORDER_ITEM_STATES (ORDER_ITEM_STATE_ID, ORDER_ITEM_STATE_NAME, ORDER_ITEM_STATE_SHORT_DESC,ORDER_ITEM_STATE_LONG_DESC, END_DATE) values (104, 'COMPLETED' ,'COMPLETED', 'COMPLETED', {ts '2099-04-05 00:00:00'} );


--- Changes for a new Search Facet

INSERT INTO `broadleaf`.`enc_user_category` (`USER_CATEGORY_ID`, `USER_CATEGORY_DESCRIPTION`, `END_DATE`, `USER_CATEGORY_NAME`) VALUES ('1', 'testuser', '2099-04-05 00:00:00', 'test');
--INSERT INTO `broadleaf`.`enc_service_provider` (`SP_ID`, `CREATED_BY`, `SP_EMAIL_ADDRESS`, `END_DATE`, `SP_FIRM_NAME`, `SP_FIRST_NAME`, `SP_LAST_NAME`, `SP_LONG_DESCRIPTION`, `USER_NAME`, `ADDRESS_ID`) VALUES ('2', '1', 'test@abc.com', '2099-04-05 00:00:00', 'TEST', 'TESTNAME', 'TESTLAST', 'DESC1', 'abc123', '51');

INSERT INTO `broadleaf`.`blc_field` (`FIELD_ID`, `ABBREVIATION`, `ENTITY_TYPE`, `FACET_FIELD_TYPE`, `PROPERTY_NAME`, `SEARCHABLE`) VALUES ('8', 'sp', 'PRODUCT', 's', 'serviceProvider.firstName', '1');
INSERT INTO `broadleaf`.`blc_search_facet` (`SEARCH_FACET_ID`, `MULTISELECT`, `LABEL`, `SEARCH_DISPLAY_PRIORITY`, `SHOW_ON_SEARCH`, `FIELD_ID`) VALUES ('4', '1', 'SP', '1', '1', '8');
INSERT INTO `broadleaf`.`blc_cat_search_facet_xref` (`CATEGORY_SEARCH_FACET_ID`, `SEQUENCE`, `CATEGORY_ID`, `SEARCH_FACET_ID`) VALUES ('4', '4', '2003', '4');


--- A new dummy measurement
INSERT INTO `broadleaf`.`blc_customer` (`CUSTOMER_ID`, `CHALLENGE_ANSWER`, `EMAIL_ADDRESS`, `FIRST_NAME`, `LAST_NAME`, `CHALLENGE_QUESTION_ID`) VALUES ('100', 'test', '123@abc.com', 'test', 'test', '1');
INSERT INTO `broadleaf`.`enc_customer` (`CUSTOMER_ID`) VALUES ('100');
INSERT INTO `broadleaf`.`enc_measurements` (`MEASUREMENT_ID`, `ARM_HOLE`, `CREATED_BY`, `DATE_CREATED`, `B_NECK`, `B_SLEEVE`, `BUST`, `CHEST`, `DARTLINE`, `MEASUREMENT_DESCRIPTION`, `F_NECK`, `HEIGHT`, `HIP`, `N_WAIST`, `MEASUREMENT_NAME`, `PANT_HEIGHT`, `S_LENGTH`, `SEAT`, `SHOULDER`, `T_SLEEVE`, `WAIST`, `CUSTOMER_ID`) VALUES ('1', '0', '-1', '2013-12-06 00:06:48', '12', '12', '12', '12', '12', 'Dummy Measurement', '12', '12', '12', '12', 'DUMMY', '12', '12', '12', '12', '12', '12', '100');

INSERT INTO `blc_phone` (`PHONE_ID`, `IS_ACTIVE`, `IS_DEFAULT`, `PHONE_NUMBER`) VALUES (1,1,0,'123456789');

INSERT INTO `blc_address` (`ADDRESS_ID`, `ADDRESS_LINE1`, `ADDRESS_LINE2`, `ADDRESS_LINE3`, `CITY`, `COMPANY_NAME`, `COUNTY`, `EMAIL_ADDRESS`, `FAX`, `FIRST_NAME`, `IS_ACTIVE`, `IS_BUSINESS`, `IS_DEFAULT`, `LAST_NAME`, `POSTAL_CODE`, `PRIMARY_PHONE`, `SECONDARY_PHONE`, `STANDARDIZED`, `TOKENIZED_ADDRESS`, `VERIFICATION_LEVEL`, `ZIP_FOUR`, `COUNTRY`, `PHONE_FAX_ID`, `PHONE_PRIMARY_ID`, `PHONE_SECONDARY_ID`, `STATE_PROV_REGION`) VALUES (1,'ZDVSD','c zx x',NULL,'CA',NULL,NULL,NULL,NULL,'sun',1,0,0,'moon','1234567',NULL,NULL,0,NULL,NULL,NULL,'US',NULL,1,NULL,'CO'),(2,'ZDVSD','c zx x',NULL,'CA',NULL,NULL,NULL,NULL,'sun',1,0,0,'moon','1234567',NULL,NULL,0,NULL,NULL,NULL,'US',NULL,NULL,NULL,'CO');

INSERT INTO `broadleaf`.`enc_service_provider` (`SP_ID`, `CREATED_BY`, `UPDATED_BY`, `CURRENT_CAPACITY`, `SP_EMAIL_ADDRESS`, `ENCLOTHE_URL`, `END_DATE`, `SP_FIRM_NAME`, `SP_FIRST_NAME`, `SP_LAST_NAME`, `SP_LONG_DESCRIPTION`, `PASSWORD`, `RECEIVE_EMAIL`, `IS_REGISTERED`, `SP_SHORT_DESCRIPTION`, `USER_NAME`, `ADDRESS_ID`, `CHALLENGE_QUESTION_ID`) VALUES ('1', '1', '1', '10', 'test@abc.com', '/test', '2099-04-05 00:00:00', 'First', 'uma', 'surya', 'first firm', 'password', '1', '1', 'good', 'uma', '1', '1');

INSERT INTO `broadleaf`.`enc_service_provider` (`SP_ID`, `CREATED_BY`, `UPDATED_BY`, `CURRENT_CAPACITY`, `SP_EMAIL_ADDRESS`, `ENCLOTHE_URL`, `END_DATE`, `SP_FIRM_NAME`, `SP_FIRST_NAME`, `SP_LAST_NAME`, `SP_LONG_DESCRIPTION`, `PASSWORD`, `RECEIVE_EMAIL`, `IS_REGISTERED`, `SP_SHORT_DESCRIPTION`, `USER_NAME`, `ADDRESS_ID`, `CHALLENGE_QUESTION_ID`) VALUES ('2', '1', '1', '20', 'test1@abc.com', '/test1', '2099-04-05 00:00:00', 'Secpmd', 'surya', 'uma', 'second firm', 'password', '1', '1', 'good', 'uma', '2', '2');


INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (1, 'blouse', 'Blouse_Front_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (2, 'blouse', 'Blouse_Front_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (3, 'blouse', 'Blouse_Front_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (4, 'blouse', 'Blouse_Back_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (5, 'blouse', 'Blouse_Back_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (6, 'blouse', 'Blouse_Back_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (7, 'blouse','Blouse_Sleeve_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (8, 'blouse','Blouse_Sleeve_Design');

--Chudihar entries

INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (30, 'Chudidhar','Chudidhar_Front_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (31, 'Chudidhar', 'Chudidhar_Front_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (32, 'Chudidhar', 'Chudidhar_Front_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (33, 'Chudidhar', 'Chudidhar_Front_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (34, 'Chudidhar', 'Chudidhar_Front_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (35, 'Chudidhar', 'Chudidhar_Front_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (36, 'Chudidhar', 'Chudidhar_Front_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (37, 'Chudidhar','Chudidhar_Front_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (38, 'Chudidhar','Chudidhar_Front_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (39, 'Chudidhar', 'Chudidhar_Front_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (40, 'Chudidhar', 'Chudidhar_Back_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (41, 'Chudidhar', 'Chudidhar_Back_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (42, 'Chudidhar', 'Chudidhar_Back_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (43, 'Chudidhar', 'Chudidhar_Back_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (44, 'Chudidhar', 'Chudidhar_Back_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (45, 'Chudidhar','Chudidhar_Back_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (46, 'Chudidhar','Chudidhar_Back_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (47, 'Chudidhar', 'Chudidhar_Back_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (48, 'Chudidhar','Chudidhar_Back_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (49, 'Chudidhar','Chudidhar_Back_Neck_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (50, 'Chudidhar', 'Chudidhar_Sleeve_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (51, 'Chudidhar', 'Chudidhar_Sleeve_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (52, 'Chudidhar', 'Chudidhar_Sleeve_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (53, 'Chudidhar', 'Chudidhar_Sleeve_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (54, 'Chudidhar', 'Chudidhar_Sleeve_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (55, 'Chudidhar','Chudidhar_Sleeve_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (56, 'Chudidhar','Chudidhar_Sleeve_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (57, 'Chudidhar', 'Chudidhar_Sleeve_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (58, 'Chudidhar','Chudidhar_Sleeve_Design');
INSERT INTO ENC_DESIGN (PRODUCT_ID, TYPE,CATEGORY) VALUES (59, 'Chudidhar','Chudidhar_Sleeve_Design');


UPDATE `broadleaf`.`enc_material` SET `SP_ID`='1' WHERE `PRODUCT_ID`='10';
UPDATE `broadleaf`.`enc_material` SET `SP_ID`='1' WHERE `PRODUCT_ID`='11';
UPDATE `broadleaf`.`enc_material` SET `SP_ID`='1' WHERE `PRODUCT_ID`='12';
UPDATE `broadleaf`.`enc_material` SET `SP_ID`='1' WHERE `PRODUCT_ID`='13';
UPDATE `broadleaf`.`enc_material` SET `SP_ID`='1' WHERE `PRODUCT_ID`='14';
UPDATE `broadleaf`.`enc_material` SET `SP_ID`='1' WHERE `PRODUCT_ID`='15';
UPDATE `broadleaf`.`enc_material` SET `SP_ID`='1' WHERE `PRODUCT_ID`='16';
UPDATE `broadleaf`.`enc_material` SET `SP_ID`='1' WHERE `PRODUCT_ID`='17';
UPDATE `broadleaf`.`enc_material` SET `SP_ID`='1' WHERE `PRODUCT_ID`='18';
UPDATE `broadleaf`.`enc_material` SET `SP_ID`='1' WHERE `PRODUCT_ID`='19';

INSERT INTO ENC_TAILOR (PRODUCT_ID, SP_ID) VALUES (9, 1);