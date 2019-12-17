BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `registration_supervisedregistrationprofile` (
	`registrationprofile_ptr_id`	integer NOT NULL,
	PRIMARY KEY(`registrationprofile_ptr_id`),
	FOREIGN KEY(`registrationprofile_ptr_id`) REFERENCES `registration_registrationprofile`(`id`) DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS `registration_registrationprofile` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`activation_key`	varchar ( 40 ) NOT NULL,
	`user_id`	integer NOT NULL UNIQUE,
	`activated`	bool NOT NULL,
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`) DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO `registration_registrationprofile` (id,activation_key,user_id,activated) VALUES (3,'01c17236ae1596dd9285d5cf89f5f8826714ff30',4,1),
 (4,'43e24f12786007ad675841c05c72445afd9105fd',6,1),
 (6,'88ab5f7235f92e337daf38c2c1ced98823dc7506',17,1),
 (7,'853555ba832842e599a3d0feb8b6cdd845dece07',18,1),
 (8,'13ba987adff1da11a29fa286608f9074a314cc96',19,1),
 (9,'db5b4de590cf72abea16b3f46d7936909c3d9732',20,1),
 (10,'af90f41f42b2588f09c3944700701136c5e80836',21,0);
CREATE TABLE IF NOT EXISTS `hospitalapp_profile` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`branch_id`	integer,
	`user_id`	integer UNIQUE,
	`doc`	varchar ( 100 ),
	`img`	varchar ( 100 ),
	`notice_id`	integer,
	`phone`	varchar ( 15 ),
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(`notice_id`) REFERENCES `hospitalapp_notice`(`id`) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(`branch_id`) REFERENCES `hospitalapp_branch`(`id`) DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO `hospitalapp_profile` (id,branch_id,user_id,doc,img,notice_id,phone) VALUES (1,1,4,NULL,NULL,NULL,NULL),
 (2,NULL,5,'',NULL,NULL,NULL),
 (3,1,3,'file/03_Buses.ppt',NULL,NULL,NULL),
 (5,NULL,7,'',NULL,NULL,NULL),
 (6,NULL,2,'file/3._Bayesian_Decision.pdf',NULL,NULL,NULL),
 (7,NULL,8,'',NULL,NULL,NULL),
 (8,1,1,'file/06-DigitalDataComm.ppt','image/Cherries.png',NULL,NULL),
 (9,1,6,'file/1.docx','image/JOYA.jpg',NULL,NULL),
 (13,NULL,12,'','',NULL,NULL),
 (14,NULL,13,'','',NULL,NULL),
 (15,NULL,14,'','',NULL,NULL),
 (16,NULL,15,'','',NULL,NULL),
 (17,NULL,16,'','',NULL,NULL),
 (18,NULL,17,'','',NULL,NULL),
 (19,NULL,18,'','',NULL,NULL),
 (21,3,19,'file/Medical_Report.docx','image/tamim.jpg',3,'01684342881'),
 (22,4,20,'file/Medical_Report_feLjogz.docx','image/sakib.png',1,'01684342881'),
 (23,NULL,21,'','',NULL,NULL);
CREATE TABLE IF NOT EXISTS `hospitalapp_notice` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`subject`	varchar ( 100 ) NOT NULL,
	`msg`	text NOT NULL,
	`cr_date`	datetime NOT NULL,
	`branch_id`	integer,
	FOREIGN KEY(`branch_id`) REFERENCES `hospitalapp_branch`(`id`) DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO `hospitalapp_notice` (id,subject,msg,cr_date,branch_id) VALUES (1,'medicine','jkkll kmlm lmlm;, nmm,mljdfsjks;k sdhscdhksdfjkljkljjjjjjjjjjj h;a','2019-11-26 17:57:13.675275',NULL),
 (2,'news','good good good good good good 
 goodgoodgoodgoodgoodgoodgoodgoodgoodgoodgoodgoodgoodgoodgoodgoodgoodgoodgoodgoodgood','2019-11-26 17:59:02.326035',NULL),
 (3,'tamim','Please Collect Your Report From the Administrator.
 Emergency Call: 4444','2019-11-30 17:43:21.682281',2);
CREATE TABLE IF NOT EXISTS `hospitalapp_branch` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar ( 100 ) NOT NULL,
	`dep`	varchar ( 100 ) NOT NULL
);
INSERT INTO `hospitalapp_branch` (id,name,dep) VALUES (1,'cse','anik'),
 (2,'pronay','EEE'),
 (3,'Dr.atiqul','Dental'),
 (4,'Dr.Anik','gestrology'),
 (5,'Dr.Islam','Medicine');
CREATE TABLE IF NOT EXISTS `hospitalapp_appointment` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`email`	varchar ( 50 ) NOT NULL,
	`cr_date`	datetime NOT NULL,
	`msg`	text NOT NULL,
	`user_id`	integer,
	`depertment`	varchar ( 100 ),
	`doctor`	varchar ( 100 ),
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`) DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO `hospitalapp_appointment` (id,email,cr_date,msg,user_id,depertment,doctor) VALUES (1,'pronaydas1122@gmail.com','2019-11-30 05:31:36.594603','hhhhhhhhhhhhhhhh',NULL,'dental','dr.anik'),
 (2,'pronaydas1122@gmail.com','2019-11-30 05:31:57.556748','jjjjjjjjjjjjjj',NULL,'dental','dr.anik'),
 (3,'pronaydas1122@gmail.com','2019-11-30 06:14:27.257310','jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj',6,'dental','dr.anik'),
 (4,'pronaydas1122@gmail.com','2019-11-30 06:14:48.280410','kkkkkkkkkkkkkkkkkkkkkkk',6,'dental','dr.anik');
CREATE TABLE IF NOT EXISTS `django_site` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar ( 50 ) NOT NULL,
	`domain`	varchar ( 100 ) NOT NULL UNIQUE
);
INSERT INTO `django_site` (id,name,domain) VALUES (1,'example.com','example.com');
CREATE TABLE IF NOT EXISTS `django_session` (
	`session_key`	varchar ( 40 ) NOT NULL,
	`session_data`	text NOT NULL,
	`expire_date`	datetime NOT NULL,
	PRIMARY KEY(`session_key`)
);
INSERT INTO `django_session` (session_key,session_data,expire_date) VALUES ('4lva577iii89dhq2ypfqxv2bbvgczk1e','MDU5OTViNjVhNzAyODc2NzBiMWQxODljNzNiMWI3NGY0NzdlMWIyMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwOTU4NzhlNTRkZmNjMjgxMzk0M2U1MGMyOGM5NGQ1NTAzYTEwODZkIn0=','2019-12-15 10:20:02.276255');
CREATE TABLE IF NOT EXISTS `django_migrations` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`app`	varchar ( 255 ) NOT NULL,
	`name`	varchar ( 255 ) NOT NULL,
	`applied`	datetime NOT NULL
);
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (1,'contenttypes','0001_initial','2019-11-26 17:47:21.214114'),
 (2,'auth','0001_initial','2019-11-26 17:47:21.451582'),
 (3,'admin','0001_initial','2019-11-26 17:47:21.658903'),
 (4,'admin','0002_logentry_remove_auto_add','2019-11-26 17:47:21.819538'),
 (5,'admin','0003_logentry_add_action_flag_choices','2019-11-26 17:47:22.054831'),
 (6,'contenttypes','0002_remove_content_type_name','2019-11-26 17:47:22.354866'),
 (7,'auth','0002_alter_permission_name_max_length','2019-11-26 17:47:22.538934'),
 (8,'auth','0003_alter_user_email_max_length','2019-11-26 17:47:22.708630'),
 (9,'auth','0004_alter_user_username_opts','2019-11-26 17:47:22.952376'),
 (10,'auth','0005_alter_user_last_login_null','2019-11-26 17:47:23.198325'),
 (11,'auth','0006_require_contenttypes_0002','2019-11-26 17:47:23.307504'),
 (12,'auth','0007_alter_validators_add_error_messages','2019-11-26 17:47:23.528729'),
 (13,'auth','0008_alter_user_username_max_length','2019-11-26 17:47:23.669496'),
 (14,'auth','0009_alter_user_last_name_max_length','2019-11-26 17:47:23.914397'),
 (15,'auth','0010_alter_group_name_max_length','2019-11-26 17:47:24.119113'),
 (16,'auth','0011_update_proxy_permissions','2019-11-26 17:47:24.245080'),
 (17,'sessions','0001_initial','2019-11-26 17:47:24.336482'),
 (18,'hospitalapp','0001_initial','2019-11-26 17:53:32.890007'),
 (19,'registration','0001_initial','2019-11-26 20:08:31.366852'),
 (20,'registration','0002_registrationprofile_activated','2019-11-26 20:08:31.504545'),
 (21,'registration','0003_migrate_activatedstatus','2019-11-26 20:08:31.695378'),
 (22,'registration','0004_supervisedregistrationprofile','2019-11-26 20:08:31.861289'),
 (23,'sites','0001_initial','2019-11-27 03:51:39.055964'),
 (24,'sites','0002_alter_domain_unique','2019-11-27 03:51:39.316962'),
 (25,'hospitalapp','0002_auto_20191127_1327','2019-11-27 07:27:53.249779'),
 (26,'hospitalapp','0003_profile','2019-11-27 12:36:48.950889'),
 (27,'hospitalapp','0004_auto_20191127_2207','2019-11-27 16:07:27.797371'),
 (28,'hospitalapp','0005_auto_20191128_1205','2019-11-28 06:05:56.623042'),
 (29,'hospitalapp','0006_auto_20191128_1211','2019-11-28 06:11:26.266895'),
 (30,'hospitalapp','0007_profile_phone','2019-11-28 10:16:22.012564'),
 (31,'hospitalapp','0008_auto_20191129_0148','2019-11-28 19:48:06.602351'),
 (32,'hospitalapp','0009_auto_20191129_0219','2019-11-28 20:19:40.665155'),
 (33,'hospitalapp','0010_auto_20191130_0320','2019-11-29 21:20:15.536457'),
 (34,'hospitalapp','0011_auto_20191130_1019','2019-11-30 04:19:42.886895'),
 (35,'hospitalapp','0012_auto_20191130_1113','2019-11-30 05:14:13.523381'),
 (36,'hospitalapp','0013_auto_20191130_1123','2019-11-30 05:23:57.981761'),
 (37,'hospitalapp','0014_auto_20191130_1154','2019-11-30 05:54:13.799291'),
 (38,'hospitalapp','0015_auto_20191130_1209','2019-11-30 06:09:46.656999'),
 (39,'hospitalapp','0016_remove_appointment_pn','2019-11-30 06:13:29.330004'),
 (40,'hospitalapp','0017_auto_20191130_2350','2019-11-30 17:51:04.070126');
CREATE TABLE IF NOT EXISTS `django_content_type` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`app_label`	varchar ( 100 ) NOT NULL,
	`model`	varchar ( 100 ) NOT NULL
);
INSERT INTO `django_content_type` (id,app_label,model) VALUES (1,'admin','logentry'),
 (2,'auth','permission'),
 (3,'auth','group'),
 (4,'auth','user'),
 (5,'contenttypes','contenttype'),
 (6,'sessions','session'),
 (7,'hospitalapp','notice'),
 (8,'registration','registrationprofile'),
 (9,'registration','supervisedregistrationprofile'),
 (10,'sites','site'),
 (11,'hospitalapp','branch'),
 (12,'hospitalapp','profile'),
 (13,'hospitalapp','appointment');
CREATE TABLE IF NOT EXISTS `django_admin_log` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`action_time`	datetime NOT NULL,
	`object_id`	text,
	`object_repr`	varchar ( 200 ) NOT NULL,
	`change_message`	text NOT NULL,
	`content_type_id`	integer,
	`user_id`	integer NOT NULL,
	`action_flag`	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	FOREIGN KEY(`content_type_id`) REFERENCES `django_content_type`(`id`) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`) DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO `django_admin_log` (id,action_time,object_id,object_repr,change_message,content_type_id,user_id,action_flag) VALUES (1,'2019-11-26 17:57:13.687886','1','hp','[{"added": {}}]',7,1,1),
 (2,'2019-11-26 17:58:48.237965','1','hp','[]',7,1,2),
 (3,'2019-11-26 17:59:02.351274','2','hj','[{"added": {}}]',7,1,1),
 (4,'2019-11-26 18:00:55.976889','1','hp','[{"changed": {"fields": ["msg"]}}]',7,1,2),
 (5,'2019-11-26 18:00:58.791129','1','hp','[]',7,1,2),
 (6,'2019-11-27 07:29:43.287777','1','Branch object (1)','[{"added": {}}]',11,1,1),
 (7,'2019-11-27 14:04:50.629705','1','HP (cse (anik))','[{"added": {}}]',12,1,1),
 (8,'2019-11-27 14:33:29.385629','3','HP','[{"added": {}}]',7,1,1),
 (9,'2019-11-27 16:12:01.559902','3','HP','',7,1,3),
 (10,'2019-11-27 16:15:30.862634','5','ANIK','[{"added": {}}]',4,1,1),
 (11,'2019-11-27 16:17:02.465826','3','file/03_Buses.ppt','[{"added": {}}]',12,1,1),
 (12,'2019-11-27 18:47:24.943110','7','KAKA','[{"added": {}}]',4,1,1),
 (13,'2019-11-27 18:51:46.407758','3','file/03_Buses.ppt','[]',12,1,2),
 (14,'2019-11-27 18:53:30.156046','6','file/3._Bayesian_Decision.pdf','[{"added": {}}]',12,1,1),
 (15,'2019-11-27 19:02:10.250650','8','file/06-DigitalDataComm.ppt','[{"added": {}}]',12,1,1),
 (16,'2019-11-28 06:14:00.676241','8','file/06-DigitalDataComm.ppt','[{"changed": {"fields": ["img"]}}]',12,1,2),
 (17,'2019-11-28 07:01:53.716930','2','pronay (EEE)','[{"added": {}}]',11,1,1),
 (18,'2019-11-28 07:03:42.288875','4','','',12,1,3),
 (19,'2019-11-28 07:04:16.005748','9','file/4b.docx','[{"added": {}}]',12,1,1),
 (20,'2019-11-28 10:17:14.515898','9','gp','[{"changed": {"fields": ["phone"]}}]',12,1,2),
 (21,'2019-11-28 19:50:13.634993','9','gp','[{"changed": {"fields": ["phone"]}}]',12,1,2),
 (22,'2019-11-28 19:57:40.539765','9','gp','[{"changed": {"fields": ["img"]}}]',12,1,2),
 (23,'2019-11-28 20:12:47.351722','9','sakib','',4,1,3),
 (24,'2019-11-28 20:13:03.238025','11','Marshafe','',4,1,3),
 (25,'2019-11-28 20:13:18.959784','10','sakib_hasan','',4,1,3),
 (26,'2019-11-28 20:14:01.235929','5','Registration information for DJ@','',8,1,3),
 (27,'2019-11-28 20:14:13.779569','1','Registration information for phph','',8,1,3),
 (28,'2019-11-28 20:14:21.535177','2','Registration information for g','',8,1,3),
 (29,'2019-11-29 18:16:28.738677','9','gp','[{"changed": {"fields": ["img"]}}]',12,1,2),
 (30,'2019-11-29 18:18:21.562964','9','gp','[{"changed": {"fields": ["doc"]}}]',12,1,2),
 (31,'2019-11-30 06:51:18.752405','4','gp','[]',13,1,2),
 (32,'2019-11-30 17:26:21.139922','20','tamim','',12,1,3),
 (33,'2019-11-30 17:31:37.728449','21','tamim','[{"added": {}}]',12,1,1),
 (34,'2019-11-30 17:40:07.077303','21','tamim','[{"changed": {"fields": ["img", "doc"]}}]',12,1,2),
 (35,'2019-11-30 17:43:21.685248','3','tamim','[{"added": {}}]',7,1,1),
 (36,'2019-11-30 17:44:27.239790','3','Dr.atiqul (Dental)','[{"added": {}}]',11,1,1),
 (37,'2019-11-30 17:45:19.810724','4','Dr.Anik (gestrology)','[{"added": {}}]',11,1,1),
 (38,'2019-11-30 17:46:37.443833','5','Dr.Islam (Medicine)','[{"added": {}}]',11,1,1),
 (39,'2019-11-30 17:47:27.540099','21','tamim','[{"changed": {"fields": ["notice", "branch"]}}]',12,1,2),
 (40,'2019-11-30 20:10:49.290904','22','sakib','[{"changed": {"fields": ["img", "phone", "doc", "branch"]}}]',12,1,2),
 (41,'2019-11-30 20:12:57.031771','2','news','[{"changed": {"fields": ["subject", "msg"]}}]',7,1,2),
 (42,'2019-11-30 20:13:41.945714','1','medicine','[{"changed": {"fields": ["subject", "msg"]}}]',7,1,2),
 (43,'2019-11-30 20:14:25.265724','22','sakib','[{"changed": {"fields": ["notice"]}}]',12,1,2);
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`user_id`	integer NOT NULL,
	`permission_id`	integer NOT NULL,
	FOREIGN KEY(`permission_id`) REFERENCES `auth_permission`(`id`) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`) DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`user_id`	integer NOT NULL,
	`group_id`	integer NOT NULL,
	FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`) DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS `auth_user` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`password`	varchar ( 128 ) NOT NULL,
	`last_login`	datetime,
	`is_superuser`	bool NOT NULL,
	`username`	varchar ( 150 ) NOT NULL UNIQUE,
	`first_name`	varchar ( 30 ) NOT NULL,
	`email`	varchar ( 254 ) NOT NULL,
	`is_staff`	bool NOT NULL,
	`is_active`	bool NOT NULL,
	`date_joined`	datetime NOT NULL,
	`last_name`	varchar ( 150 ) NOT NULL
);
INSERT INTO `auth_user` (id,password,last_login,is_superuser,username,first_name,email,is_staff,is_active,date_joined,last_name) VALUES (1,'pbkdf2_sha256$150000$OSlWWfh427jh$kvZ/Ww4YfjlGrMnRVDGpg+eQ8ycZqoWhDLSI6aylevc=','2019-12-01 10:20:02.185471',1,'HMS','','',1,1,'2019-11-26 17:50:25.195098',''),
 (2,'pbkdf2_sha256$150000$Rkm4znHPGb8s$cEh5dzP5egIIPBIOlmAtBz7f6Yl1sjTxysbDpJrk6Ho=',NULL,0,'phph','','pronaydas112233@gmail.com',0,0,'2019-11-26 20:36:20.628076',''),
 (3,'pbkdf2_sha256$150000$qbjYCCoIh5e7$vqqIHbSonFGBzD51yoqTzVD1xsv9L8yKcl23vGt60uE=',NULL,0,'g','','pronaydas1122@gmail.com',0,1,'2019-11-27 04:07:20.957885',''),
 (4,'pbkdf2_sha256$150000$0zlRvGPhsiC1$InqLcBR2vDY0tpm5BlELzc77BloQgIjr1KrMRou/Vn8=','2019-11-27 14:34:13.942373',0,'HP','','pronaydas1122@gmail.com',0,1,'2019-11-27 04:14:36.069743',''),
 (5,'pbkdf2_sha256$150000$lZhWKUuyEhu2$6/408/m2YkQ/T0gQzyqj9t/rF8hZs4X1Gr5phkdVTOs=',NULL,0,'ANIK','','',0,1,'2019-11-27 16:15:30.427909',''),
 (6,'pbkdf2_sha256$150000$aIQNQmQ7xUFw$aNW/0ruYlMhWuQHWYOv45MO9MEsCivw8NkLIl5lkVNY=','2019-11-30 20:04:47.960950',0,'gp','','pronaydas1122@gmail.com',0,1,'2019-11-27 16:25:04.835785',''),
 (7,'pbkdf2_sha256$150000$hvjvGLp7ulhV$9ClITkekP0InNnwPtDzAySejYo9hhTeaX+RSwi15S8E=',NULL,0,'KAKA','','',0,1,'2019-11-27 18:47:24.755644',''),
 (8,'pbkdf2_sha256$150000$wZaiVssyKU0D$5UaDYlcGO+656EVsKmlJ7i68Cavs9cNqf1I3X6jEbsI=','2019-11-27 19:04:30.581833',0,'DJ@','','pronaydas1122@gmail.com',0,1,'2019-11-27 18:59:01.518165',''),
 (12,'pbkdf2_sha256$150000$sghA95LehAY9$EHlH+P47iuOO8hZqw8VIJZo3FOj5PY46F1k+lP9J11s=',NULL,0,'Rakib','','pronaydas1122@gmail.com',0,1,'2019-11-28 20:16:49.905520',''),
 (13,'pbkdf2_sha256$150000$ky21AomFaZaO$f1yaPFrMdJKdg6bG+kyGAMWNbXJOKWzhCa0CBMupQTA=',NULL,0,'rakib','','pronaydas1122@gmail.com',0,1,'2019-11-28 20:21:29.284231',''),
 (14,'pbkdf2_sha256$150000$uC556Z2fahfQ$DaS6sNc9sNQ+sRPwb9n+Guia4usaD6dOae5zcG4NQ3U=',NULL,0,'hasan','','pronaydas1122@gmail.com',0,1,'2019-11-28 20:42:10.183435',''),
 (15,'pbkdf2_sha256$150000$ZnKPv5ZWSxVB$+5C4YSe2LmetXtd28xEP70qqyx3Y4PXf7HBF8z5lzAA=',NULL,0,'ab','','pronaydas1122@gmail.com',0,1,'2019-11-28 20:49:32.826328',''),
 (16,'pbkdf2_sha256$150000$Oqe9c4bO7v7b$cJYWNnsaDN3BcFzjvBoNwyXYSHWJH4osnAkEpisixLk=',NULL,0,'Tipu','','pronaydas1122@gmail.com',0,1,'2019-11-28 21:02:31.253568',''),
 (17,'pbkdf2_sha256$150000$StB6YJGEWx8G$/zS11xNsVPs3JkeKn3Oxu9UIzJbvyxGRbOFBSNoa+Nc=','2019-11-28 21:08:45.769554',0,'Tipudas','','pronaydas1122@gmail.com',0,1,'2019-11-28 21:06:42.189439',''),
 (18,'pbkdf2_sha256$150000$4MFABCnPiOBF$BnJZoK2gTC8qpXSoPyfNk0cLCpbU1gFmLDxvmHI8paQ=','2019-11-28 21:11:51.442815',0,'Kamal','','pronaydas1122@gmail.com',0,1,'2019-11-28 21:10:30.449079',''),
 (19,'pbkdf2_sha256$150000$HGo8u2uJsJWq$+s9i6FnyJz/LDaIfSREV/c7A3wjekGkT4alNdyHHePA=','2019-12-01 09:24:19.905152',0,'tamim','','pronaydas1122@gmail.com',0,1,'2019-11-30 16:46:02.188962',''),
 (20,'pbkdf2_sha256$150000$jzdw85fRwIU3$awWktj+haEN7VuhHefHonTeTTqHAzsatKiEqBd0C5Jg=','2019-12-01 10:17:48.935727',0,'sakib','','pronaydas1122@gmail.com',0,1,'2019-11-30 20:07:08.473442',''),
 (21,'pbkdf2_sha256$150000$Rs1rWhidGYRC$BMyM/5uU6py6aXC9+DsFYv9kcON87PLEu3uZyHMmfs8=',NULL,0,'koli','','pronaydas1122@gmail.com',0,0,'2019-12-01 10:15:46.026500','');
CREATE TABLE IF NOT EXISTS `auth_permission` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`content_type_id`	integer NOT NULL,
	`codename`	varchar ( 100 ) NOT NULL,
	`name`	varchar ( 255 ) NOT NULL,
	FOREIGN KEY(`content_type_id`) REFERENCES `django_content_type`(`id`) DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (1,1,'add_logentry','Can add log entry'),
 (2,1,'change_logentry','Can change log entry'),
 (3,1,'delete_logentry','Can delete log entry'),
 (4,1,'view_logentry','Can view log entry'),
 (5,2,'add_permission','Can add permission'),
 (6,2,'change_permission','Can change permission'),
 (7,2,'delete_permission','Can delete permission'),
 (8,2,'view_permission','Can view permission'),
 (9,3,'add_group','Can add group'),
 (10,3,'change_group','Can change group'),
 (11,3,'delete_group','Can delete group'),
 (12,3,'view_group','Can view group'),
 (13,4,'add_user','Can add user'),
 (14,4,'change_user','Can change user'),
 (15,4,'delete_user','Can delete user'),
 (16,4,'view_user','Can view user'),
 (17,5,'add_contenttype','Can add content type'),
 (18,5,'change_contenttype','Can change content type'),
 (19,5,'delete_contenttype','Can delete content type'),
 (20,5,'view_contenttype','Can view content type'),
 (21,6,'add_session','Can add session'),
 (22,6,'change_session','Can change session'),
 (23,6,'delete_session','Can delete session'),
 (24,6,'view_session','Can view session'),
 (25,7,'add_notice','Can add notice'),
 (26,7,'change_notice','Can change notice'),
 (27,7,'delete_notice','Can delete notice'),
 (28,7,'view_notice','Can view notice'),
 (29,8,'add_registrationprofile','Can add registration profile'),
 (30,8,'change_registrationprofile','Can change registration profile'),
 (31,8,'delete_registrationprofile','Can delete registration profile'),
 (32,8,'view_registrationprofile','Can view registration profile'),
 (33,9,'add_supervisedregistrationprofile','Can add supervised registration profile'),
 (34,9,'change_supervisedregistrationprofile','Can change supervised registration profile'),
 (35,9,'delete_supervisedregistrationprofile','Can delete supervised registration profile'),
 (36,9,'view_supervisedregistrationprofile','Can view supervised registration profile'),
 (37,10,'add_site','Can add site'),
 (38,10,'change_site','Can change site'),
 (39,10,'delete_site','Can delete site'),
 (40,10,'view_site','Can view site'),
 (41,11,'add_branch','Can add branch'),
 (42,11,'change_branch','Can change branch'),
 (43,11,'delete_branch','Can delete branch'),
 (44,11,'view_branch','Can view branch'),
 (45,12,'add_profile','Can add profile'),
 (46,12,'change_profile','Can change profile'),
 (47,12,'delete_profile','Can delete profile'),
 (48,12,'view_profile','Can view profile'),
 (49,13,'add_appointment','Can add appointment'),
 (50,13,'change_appointment','Can change appointment'),
 (51,13,'delete_appointment','Can delete appointment'),
 (52,13,'view_appointment','Can view appointment');
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`group_id`	integer NOT NULL,
	`permission_id`	integer NOT NULL,
	FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(`permission_id`) REFERENCES `auth_permission`(`id`) DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS `auth_group` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar ( 150 ) NOT NULL UNIQUE
);
CREATE INDEX IF NOT EXISTS `hospitalapp_profile_notice_id_a4d2cc2b` ON `hospitalapp_profile` (
	`notice_id`
);
CREATE INDEX IF NOT EXISTS `hospitalapp_profile_branch_id_6771d78b` ON `hospitalapp_profile` (
	`branch_id`
);
CREATE INDEX IF NOT EXISTS `hospitalapp_notice_branch_id_505203b1` ON `hospitalapp_notice` (
	`branch_id`
);
CREATE INDEX IF NOT EXISTS `hospitalapp_appointment_user_id_2a89b4fd` ON `hospitalapp_appointment` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `django_session_expire_date_a5c62663` ON `django_session` (
	`expire_date`
);
CREATE UNIQUE INDEX IF NOT EXISTS `django_content_type_app_label_model_76bd3d3b_uniq` ON `django_content_type` (
	`app_label`,
	`model`
);
CREATE INDEX IF NOT EXISTS `django_admin_log_user_id_c564eba6` ON `django_admin_log` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `django_admin_log_content_type_id_c4bce8eb` ON `django_admin_log` (
	`content_type_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` ON `auth_user_user_permissions` (
	`user_id`,
	`permission_id`
);
CREATE INDEX IF NOT EXISTS `auth_user_user_permissions_user_id_a95ead1b` ON `auth_user_user_permissions` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `auth_user_user_permissions_permission_id_1fbb5f2c` ON `auth_user_user_permissions` (
	`permission_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `auth_user_groups_user_id_group_id_94350c0c_uniq` ON `auth_user_groups` (
	`user_id`,
	`group_id`
);
CREATE INDEX IF NOT EXISTS `auth_user_groups_user_id_6a12ed8b` ON `auth_user_groups` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `auth_user_groups_group_id_97559544` ON `auth_user_groups` (
	`group_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `auth_permission_content_type_id_codename_01ab375a_uniq` ON `auth_permission` (
	`content_type_id`,
	`codename`
);
CREATE INDEX IF NOT EXISTS `auth_permission_content_type_id_2f476e4b` ON `auth_permission` (
	`content_type_id`
);
CREATE INDEX IF NOT EXISTS `auth_group_permissions_permission_id_84c5c92e` ON `auth_group_permissions` (
	`permission_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` ON `auth_group_permissions` (
	`group_id`,
	`permission_id`
);
CREATE INDEX IF NOT EXISTS `auth_group_permissions_group_id_b120cbf9` ON `auth_group_permissions` (
	`group_id`
);
COMMIT;
