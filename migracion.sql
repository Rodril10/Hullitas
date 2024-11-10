BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "app_eventos" (
	"id"	integer NOT NULL,
	"NOMBRE_EVENTO"	varchar(200) NOT NULL,
	"FECHA"	date NOT NULL,
	"DESCRIPCION"	varchar(500) NOT NULL,
	"IMAGEN"	varchar(100),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "app_testimonios" (
	"id"	integer NOT NULL,
	"NOMBRE_APELLIDO"	varchar(200) NOT NULL,
	"ACCION"	varchar(200) NOT NULL,
	"TESTIMONIO"	varchar(800) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "app_adopta" (
	"id"	integer NOT NULL,
	"NOMBRE"	varchar(200) NOT NULL,
	"ESPECIE"	varchar(200) NOT NULL,
	"IMAGEN"	varchar(100),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "app_dona" (
	"id"	integer NOT NULL,
	"NOMBRE"	varchar(200) NOT NULL,
	"VALOR"	integer NOT NULL,
	"FECHA_DONACION"	datetime NOT NULL,
	"METODO_PAGO"	varchar(50) NOT NULL,
	"COMENTARIOS"	text,
	"USER_id"	integer NOT NULL,
	FOREIGN KEY("USER_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2024-11-09 01:38:39.400431');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2024-11-09 01:38:39.432710');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2024-11-09 01:38:39.457411');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2024-11-09 01:38:39.476643');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2024-11-09 01:38:39.492088');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2024-11-09 01:38:39.522618');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2024-11-09 01:38:39.542733');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2024-11-09 01:38:39.561727');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2024-11-09 01:38:39.576540');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2024-11-09 01:38:39.633866');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2024-11-09 01:38:39.639862');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2024-11-09 01:38:39.654680');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2024-11-09 01:38:39.674700');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2024-11-09 01:38:39.692405');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2024-11-09 01:38:39.711516');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2024-11-09 01:38:39.722594');
INSERT INTO "django_migrations" VALUES (17,'auth','0012_alter_user_first_name_max_length','2024-11-09 01:38:39.742619');
INSERT INTO "django_migrations" VALUES (18,'sessions','0001_initial','2024-11-09 01:38:39.760631');
INSERT INTO "django_migrations" VALUES (19,'app','0001_initial','2024-11-09 01:57:16.862176');
INSERT INTO "django_migrations" VALUES (20,'app','0002_alter_eventos_imagen','2024-11-09 02:37:16.082615');
INSERT INTO "django_migrations" VALUES (21,'app','0003_alter_eventos_imagen','2024-11-09 03:49:06.046998');
INSERT INTO "django_migrations" VALUES (22,'app','0004_testimonios','2024-11-09 05:00:40.744771');
INSERT INTO "django_migrations" VALUES (23,'app','0005_adopta','2024-11-09 06:05:22.331840');
INSERT INTO "django_migrations" VALUES (24,'app','0006_dona','2024-11-10 03:47:44.978705');
INSERT INTO "django_migrations" VALUES (25,'app','0007_remove_dona_direccion_remove_dona_email','2024-11-10 04:24:07.495910');
INSERT INTO "django_admin_log" VALUES (1,'1','Eventos object (1)',1,'[{"added": {}}]',7,1,'2024-11-09 02:24:21.581625');
INSERT INTO "django_admin_log" VALUES (2,'1','Eventos object (1)',3,'',7,1,'2024-11-09 02:39:17.086219');
INSERT INTO "django_admin_log" VALUES (3,'2','Eventos object (2)',1,'[{"added": {}}]',7,1,'2024-11-09 02:39:50.781700');
INSERT INTO "django_admin_log" VALUES (4,'3','Eventos object (3)',1,'[{"added": {}}]',7,1,'2024-11-09 02:41:38.234220');
INSERT INTO "django_admin_log" VALUES (5,'4','Eventos object (4)',1,'[{"added": {}}]',7,1,'2024-11-09 02:44:40.781746');
INSERT INTO "django_admin_log" VALUES (6,'5','Eventos object (5)',1,'[{"added": {}}]',7,1,'2024-11-09 02:46:45.027730');
INSERT INTO "django_admin_log" VALUES (7,'6','Eventos object (6)',1,'[{"added": {}}]',7,1,'2024-11-09 03:51:05.079302');
INSERT INTO "django_admin_log" VALUES (8,'6','Eventos object (6)',2,'[{"changed": {"fields": ["IMAGEN"]}}]',7,1,'2024-11-09 03:52:35.132170');
INSERT INTO "django_admin_log" VALUES (9,'6','Eventos object (6)',3,'',7,1,'2024-11-09 03:53:19.418323');
INSERT INTO "django_admin_log" VALUES (10,'1','Testimonios object (1)',1,'[{"added": {}}]',8,1,'2024-11-09 05:10:19.963719');
INSERT INTO "django_admin_log" VALUES (11,'2','Testimonios object (2)',1,'[{"added": {}}]',8,1,'2024-11-09 05:10:41.033027');
INSERT INTO "django_admin_log" VALUES (12,'3','Testimonios object (3)',1,'[{"added": {}}]',8,1,'2024-11-09 05:11:00.213752');
INSERT INTO "django_admin_log" VALUES (13,'4','Testimonios object (4)',1,'[{"added": {}}]',8,1,'2024-11-09 05:11:18.959650');
INSERT INTO "django_admin_log" VALUES (14,'5','Testimonios object (5)',1,'[{"added": {}}]',8,1,'2024-11-09 05:11:40.336019');
INSERT INTO "django_admin_log" VALUES (15,'1','Adopta object (1)',1,'[{"added": {}}]',9,1,'2024-11-09 06:16:04.523555');
INSERT INTO "django_admin_log" VALUES (16,'6','Testimonios object (6)',1,'[{"added": {}}]',8,1,'2024-11-09 20:59:33.924575');
INSERT INTO "django_admin_log" VALUES (17,'17','Adopta object (17)',1,'[{"added": {}}]',9,1,'2024-11-09 21:11:45.106536');
INSERT INTO "django_admin_log" VALUES (18,'18','Adopta object (18)',1,'[{"added": {}}]',9,1,'2024-11-09 21:15:29.440156');
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'app','eventos');
INSERT INTO "django_content_type" VALUES (8,'app','testimonios');
INSERT INTO "django_content_type" VALUES (9,'app','adopta');
INSERT INTO "django_content_type" VALUES (10,'app','dona');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_eventos','Can add eventos');
INSERT INTO "auth_permission" VALUES (26,7,'change_eventos','Can change eventos');
INSERT INTO "auth_permission" VALUES (27,7,'delete_eventos','Can delete eventos');
INSERT INTO "auth_permission" VALUES (28,7,'view_eventos','Can view eventos');
INSERT INTO "auth_permission" VALUES (29,8,'add_testimonios','Can add testimonios');
INSERT INTO "auth_permission" VALUES (30,8,'change_testimonios','Can change testimonios');
INSERT INTO "auth_permission" VALUES (31,8,'delete_testimonios','Can delete testimonios');
INSERT INTO "auth_permission" VALUES (32,8,'view_testimonios','Can view testimonios');
INSERT INTO "auth_permission" VALUES (33,9,'add_adopta','Can add adopta');
INSERT INTO "auth_permission" VALUES (34,9,'change_adopta','Can change adopta');
INSERT INTO "auth_permission" VALUES (35,9,'delete_adopta','Can delete adopta');
INSERT INTO "auth_permission" VALUES (36,9,'view_adopta','Can view adopta');
INSERT INTO "auth_permission" VALUES (37,10,'add_dona','Can add dona');
INSERT INTO "auth_permission" VALUES (38,10,'change_dona','Can change dona');
INSERT INTO "auth_permission" VALUES (39,10,'delete_dona','Can delete dona');
INSERT INTO "auth_permission" VALUES (40,10,'view_dona','Can view dona');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$870000$tsSIEaHbx3cXCSy5moXxpw$eYiGvEVbqzyJXkngoopZyWe6qfjE6Ghl8PLkjd443SI=','2024-11-10 04:32:39.220205',1,'admin','','admi@contoso.com',1,1,'2024-11-09 02:08:13.273815','');
INSERT INTO "auth_user" VALUES (2,'pbkdf2_sha256$870000$rHbOfmCoa8YckI0nIdx5VZ$dQRuDrwAgvtmggtrTw6WKNHtZKgbuSQxcDvn2ir9e1Q=',NULL,0,'joe','','',0,1,'2024-11-09 15:49:28.662702','');
INSERT INTO "auth_user" VALUES (3,'pbkdf2_sha256$870000$0PXJs16TbSqEsAFp0XbVay$zCPNx5eimyPUAejD7hXlG6HSQ5YGcdpksmV47N3Ft10=',NULL,0,'lulu','','',0,1,'2024-11-10 01:28:30.271974','');
INSERT INTO "auth_user" VALUES (4,'pbkdf2_sha256$870000$c4ufrGt9bU80yWd0qmvSbO$voYR7VpA9Y/cQBM3ReS90j5GJsY3v2pCpbjLIF4Zhkc=','2024-11-10 01:44:44.399920',0,'lolo','','',0,1,'2024-11-10 01:44:43.819895','');
INSERT INTO "auth_user" VALUES (5,'pbkdf2_sha256$870000$0XCFdsnvn5Q28n0GOVc0uZ$Z3zQG4ud2VW4GiAFwiAi+rWi5IEi/eG+Ajx39dy+ACQ=','2024-11-10 01:46:05.507116',0,'loli','','',0,1,'2024-11-10 01:46:04.975214','');
INSERT INTO "auth_user" VALUES (6,'pbkdf2_sha256$870000$NZEYDhkKcsx2Xpo9trAFIs$fDdck78wbUpb2ukW1YQXuIz0S255KrGKvls0OyxVQts=','2024-11-10 01:46:31.468739',0,'lala','','',0,1,'2024-11-10 01:46:30.975454','');
INSERT INTO "auth_user" VALUES (7,'pbkdf2_sha256$870000$R8gOaXLu36V3HGXnfBZDd9$pBN0gbqlGz/d5uwIzvvc+qG/obs2FepuErc8eBXjLNU=','2024-11-10 01:47:26.910309',0,'sasa','','',0,1,'2024-11-10 01:47:26.420183','');
INSERT INTO "auth_user" VALUES (8,'pbkdf2_sha256$870000$xrvMc7qR4TWTcdSfjCAnAl$owKez2y7qmCQbpSkZhAP1lN714c9tzDVERut1WALr1o=','2024-11-10 01:48:11.751337',0,'lili','','',0,1,'2024-11-10 01:48:11.246760','');
INSERT INTO "auth_user" VALUES (9,'pbkdf2_sha256$870000$sbNg1aSMUaoUkOCFXZX5Q4$4zH4kl0rc4Q18PH+CnLuKU+Eu5auiZ1hxscy6ZToWB4=','2024-11-10 05:02:45.366470',0,'JOE','','',0,1,'2024-11-10 02:18:25.730436','');
INSERT INTO "auth_user" VALUES (10,'pbkdf2_sha256$870000$OsYqAgEL1DHcK2K9XhaXT8$Q0T/TEltSwBeicsje0WrKTHQe5JV9n2GiaUqsB7OtrI=','2024-11-10 02:18:56.878574',0,'JOU','','',0,1,'2024-11-10 02:18:56.365744','');
INSERT INTO "auth_user" VALUES (11,'pbkdf2_sha256$870000$Idxlz8w9cnShw95gtpds0X$eJFdLnPibtiOKj8mXClj9ZYizZf/eHmdKDvfMP7l5tA=','2024-11-10 02:22:38.064187',0,'JOI','','',0,1,'2024-11-10 02:22:37.572673','');
INSERT INTO "auth_user" VALUES (12,'pbkdf2_sha256$870000$Erstk2wdWhAFS2SAJMybA0$bmsDsRX9Y9R/8VJSrBXKe+sBdjOp6n6IvwcxSd+vzcs=','2024-11-10 03:20:49.392837',0,'Contador','','',0,1,'2024-11-10 03:19:45.776389','');
INSERT INTO "django_session" VALUES ('sx0xmvntv50owdkj90e1ayti68ujsriv','.eJxVjDEOAiEQAP9CbQgbWBBLe99AgF3k1EBy3FXGvxuSK7SdmcxbhLhvNeyD17CQuAgQp1-WYn5ym4Iesd27zL1t65LkTORhh7x14tf1aP8GNY46t96ek1aJ2JVYDCYFThkwBrPGwik77Rx4RmuIyKNF9EyZCAg8EIvPF9xcOA8:1t9auo:zyNFjQF-rA9IgmHRBTdqnGmET-dwGuFAHJELtuH32ZE','2024-11-23 02:09:30.486948');
INSERT INTO "django_session" VALUES ('r9akvnrerotu703j67jt2cvxsjicqw29','.eJxVjDEOAiEQAP9CbQgbWBBLe99AgF3k1EBy3FXGvxuSK7SdmcxbhLhvNeyD17CQuAgQp1-WYn5ym4Iesd27zL1t65LkTORhh7x14tf1aP8GNY46t96ek1aJ2JVYDCYFThkwBrPGwik77Rx4RmuIyKNF9EyZCAg8EIvPF9xcOA8:1t9cUi:4f9zWmyEw4lv-Te2rY4KB1kIdh6BsVFlWqAsM7vT89Y','2024-11-23 03:50:40.405255');
INSERT INTO "django_session" VALUES ('gug8fi3symwbcv3a5chpk88uoevrqhqe','.eJxVjDEOAiEQAP9CbQgbWBBLe99AgF3k1EBy3FXGvxuSK7SdmcxbhLhvNeyD17CQuAgQp1-WYn5ym4Iesd27zL1t65LkTORhh7x14tf1aP8GNY46t96ek1aJ2JVYDCYFThkwBrPGwik77Rx4RmuIyKNF9EyZCAg8EIvPF9xcOA8:1t9diA:sOSCU9mXF1z6bFjKTAFwlgrCWBmclWqhZIr0E7iSQMM','2024-11-23 05:08:38.462912');
INSERT INTO "django_session" VALUES ('29b9t9j0jewe5ehe4uw0za1a2560zcmd','e30:1t9x0O:jb_QazJ8pX2q21jurky_l4Ydl0OiUks8j97BOdtBf3c','2024-11-24 01:44:44.392217');
INSERT INTO "django_session" VALUES ('imbzd8jlvag3w9bvu0ipoin7v4kbcjhk','e30:1t9xrY:d38D1dR8TAHI8sUvwVi8q7WNBdzd2_BmlwgI-caiRBA','2024-11-24 02:39:40.136799');
INSERT INTO "django_session" VALUES ('u10gmssrz5t8ohesl54ag5qfmadww8n1','e30:1t9xsn:bSKuIcv98-jdmfnVIQke2eqhZtwInqU-q8rVGclOWXk','2024-11-24 02:40:57.094469');
INSERT INTO "django_session" VALUES ('7ln164zdvdejtizgqmtlhv997ehla1ee','e30:1t9xt9:2mA3-E4C8nR_nW3Cl7ZX5yw5C-WmOQMx5Z3E3kD_R3k','2024-11-24 02:41:19.533636');
INSERT INTO "django_session" VALUES ('dcy160r6qnm1zjfew5qwdwwqvk6rjatv','e30:1t9xu0:uIbfZmxnlYj1y2Bd-LcdyPlkdvvLwnTwmIF3kfnHgX8','2024-11-24 02:42:12.670118');
INSERT INTO "django_session" VALUES ('6nksr5ahl4608rhkcst2xb2wgyzecved','e30:1t9yVN:fvn6dRi9mnL3pbMwy1h6nEvhqWQ9lyjX9JkeG2QP52w','2024-11-24 03:20:49.375852');
INSERT INTO "django_session" VALUES ('ycw5icaa66bzswvqsvxxotg6drbmxkqw','e30:1t9yVf:APcbLrMR5yWupBxsvGfL1asI3wUHEWa1xfPsVdL_Hq8','2024-11-24 03:21:07.039285');
INSERT INTO "django_session" VALUES ('683zd37pqf98dtyqcv22acqhjuptn4k4','.eJxVjMsOwiAQRf-FtSHlzbh07zcQZgCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbeQlzYmcG7PS7YaRHbjtI99hunVNv6zIj3xV-0MGvPeXn5XD_Dmoc9Vt7ZUEUFIU80mQ0AgjIqJI3aJ03JlonSqKSsnZKkwSK3vlJkpNgbWbvD-ksN9A:1tA061:_H_hJWArSIPmWr3RJijl2FQhdpBHZy-uhTnpFj3j3jw','2024-11-24 05:02:45.377499');
INSERT INTO "app_eventos" VALUES (2,'¡Huellitas Rescata a 50 Animales en Operativo Especial!','2024-08-07','El equipo de Huellitas, en colaboración con las autoridades locales, llevó a cabo un exitoso operativo de rescate en una finca abandonada. Gracias a la rápida actuación, se logró salvar a 50 animales, incluyendo perros, gatos y otros animales domésticos, que ahora reciben el cuidado y tratamiento que necesitan.','Eventos/Evento_Rescate_50_animales.jpeg');
INSERT INTO "app_eventos" VALUES (3,'¡Nueva Clínica Veterinaria Inaugurada!','2024-08-23','Nos complace anunciar la apertura de nuestra nueva clínica veterinaria en el centro de la ciudad. Este centro ofrecerá servicios de esterilización, vacunación y atención médica general a todos los animales rescatados por la fundación, así como a las mascotas de la comunidad. ¡Gracias a todos los donantes que hicieron esto posible!','Eventos/Inaguracion_clinica.jpeg');
INSERT INTO "app_eventos" VALUES (4,'Huellitas Lanza Programa de Educación en Escuelas','2024-10-16','La fundación Huellitas ha lanzado un nuevo programa educativo en escuelas locales para concienciar a los más jóvenes sobre la importancia del cuidado responsable de los animales. Este programa incluye charlas, actividades interactivas y la visita de algunos de nuestros adorables amigos peludos.','Eventos/Lanzamiento_Escuela.jpeg');
INSERT INTO "app_eventos" VALUES (5,'Evento de Adopción Exitoso: ¡20 Animales Encontraron Hogar!','2024-11-05','Estamos emocionados de compartir que nuestro reciente evento de adopción fue un gran éxito. Gracias al apoyo de la comunidad, 20 animales rescatados encontraron nuevos hogares llenos de amor. Agradecemos a todos los adoptantes por abrir sus corazones y hogares a nuestros queridos peludos.','Eventos/Adopcion_Noviembre.jpeg');
INSERT INTO "app_testimonios" VALUES (1,'María López','Adoptante de "Luna"','Adoptar a Luna ha sido una de las mejores decisiones de mi vida. Cuando la encontramos en Huellitas, estaba asustada y en muy mal estado, pero gracias al amor y cuidado de todo el equipo, hoy es una perrita feliz y saludable. Agradezco profundamente el trabajo incansable de Huellitas por rescatar y dar segundas oportunidades a tantos animales.');
INSERT INTO "app_testimonios" VALUES (2,'Carlos Martínez','Voluntario','Ser voluntario en Huellitas ha sido una experiencia transformadora. He aprendido mucho sobre el cuidado y rehabilitación de animales rescatados, y he visto de primera mano la dedicación y pasión con la que el equipo trabaja todos los días. Cada pequeña contribución que hago me llena de satisfacción, sabiendo que estamos marcando una diferencia en la vida de tantos animales.');
INSERT INTO "app_testimonios" VALUES (3,'Ana Gómez','Beneficiaria de la Jornada de Esterilización','Gracias a la jornada de esterilización gratuita organizada por Huellitas, pude esterilizar a mis dos gatos sin costo alguno. Esta iniciativa no solo ayuda a controlar la población animal, sino que también mejora la calidad de vida de nuestras mascotas. Estoy muy agradecida por el apoyo y la atención que recibimos ese día.');
INSERT INTO "app_testimonios" VALUES (4,'Pedro Ramírez','Participante del Programa Educativo','El programa educativo de Huellitas en la escuela de mis hijos ha sido increíble. Mis hijos han aprendido sobre la importancia del respeto y cuidado hacia los animales, y ahora están más conscientes de cómo tratar a nuestras mascotas. Este tipo de educación es fundamental para formar a futuras generaciones más empáticas y responsables.');
INSERT INTO "app_testimonios" VALUES (5,'Laura Hernández','Donante','Decidí hacer una donación a Huellitas porque creo en su misión y en el impacto positivo que tienen en la comunidad. Saber que mi contribución ayuda a rescatar, rehabilitar y reubicar a animales en situación de vulnerabilidad me llena de orgullo. Invito a todos a apoyar esta maravillosa causa.');
INSERT INTO "app_testimonios" VALUES (6,'Verónica Rodríguez','Rescatista Voluntaria','Unirme a Huellitas como rescatista voluntaria ha sido una de las decisiones más gratificantes que he tomado. He aprendido tanto sobre el rescate y la rehabilitación de animales, y me siento honrada de poder ayudar a estos seres inocentes a encontrar una segunda oportunidad. El compromiso y la pasión del equipo de Huellitas son verdaderamente inspiradores, y me siento agradecida de ser parte de esta maravillosa comunidad.');
INSERT INTO "app_testimonios" VALUES (7,'Luisa Méndez','Donante Frecuente','He sido donante de Huellitas durante varios años y estoy constantemente impresionada por el impacto positivo que tienen en la vida de los animales y sus adoptantes. Saber que mis contribuciones ayudan a rescatar y cuidar a estos animales en necesidad me llena de satisfacción. Huellitas es una organización con un gran corazón y una misión clara, y me enorgullece apoyarlos.');
INSERT INTO "app_testimonios" VALUES (8,'Miguel Torres','Adoptante de "Nala"','Nala era una gatita tímida y asustada cuando la conocimos en Huellitas. Con el apoyo y la guía del equipo, pudimos ganarnos su confianza y ahora es una parte integral de nuestra familia. Su transformación ha sido increíble, y no puedo agradecer lo suficiente a Huellitas por su dedicación y amor hacia los animales. Adoptar a Nala ha sido una experiencia maravillosa y recomiendo a todos considerar la adopción.');
INSERT INTO "app_testimonios" VALUES (9,'Camila Fernández','Beneficiaria del Programa de Concienciación','El programa de concienciación de Huellitas ha tenido un impacto profundo en mi comunidad. Gracias a sus talleres educativos, ahora entendemos mejor cómo cuidar y respetar a nuestras mascotas. Este conocimiento ha creado un ambiente más armonioso y responsable en nuestro vecindario. Estoy muy agradecida por la dedicación de Huellitas a la educación y el bienestar animal.');
INSERT INTO "app_testimonios" VALUES (10,'José Ramírez','Adoptante de "Max"','Adoptar a Max de Huellitas ha sido una bendición. Llegó a nuestra vida en el momento justo, trayendo consigo una energía y alegría que no sabíamos que nos hacía falta. El equipo de Huellitas fue increíblemente atento durante todo el proceso, asegurándose de que Max y nuestra familia fuéramos una buena combinación. Ahora, Max es el centro de atención en nuestro hogar y no podemos imaginar la vida sin él.');
INSERT INTO "app_testimonios" VALUES (11,'Gabriela Sánchez','Adoptante de "Simba"','Adoptar a Simba ha sido una de las decisiones más gratificantes que hemos tomado como familia. Este pequeño gatito ha llenado nuestra casa de alegría y risas. El equipo de Huellitas hizo todo el proceso de adopción tan fácil y agradable. Nos proporcionaron toda la información que necesitábamos y se aseguraron de que Simba se adaptara bien a su nuevo hogar. Ahora no podemos imaginar nuestra vida sin él.');
INSERT INTO "app_testimonios" VALUES (12,'Andrés López','Donante Regular','Huellitas ha sido una parte importante de nuestra comunidad, y estoy orgulloso de ser donante regular. Saber que mi contribución ayuda a rescatar y cuidar a animales necesitados es increíblemente satisfactorio. El impacto positivo que tienen en la vida de estos animales y en sus adoptantes es incalculable. El equipo de Huellitas es apasionado y dedicado, y me siento honrado de poder apoyar su misión.');
INSERT INTO "app_adopta" VALUES (1,'Max','Perro','ADOPTA/Perrito1.png');
INSERT INTO "app_adopta" VALUES (2,'Bella','Perro','ADOPTA/Perrito2.png');
INSERT INTO "app_adopta" VALUES (3,'Charlie','Perro','ADOPTA/Perrito3.png');
INSERT INTO "app_adopta" VALUES (4,'Luna','Perro','ADOPTA/Perrito4.png');
INSERT INTO "app_adopta" VALUES (5,'Rocky','Perro','ADOPTA/Perrito5.png');
INSERT INTO "app_adopta" VALUES (6,'Lucy','Perro','ADOPTA/Perrito6.png');
INSERT INTO "app_adopta" VALUES (7,'Buddy','Perro','ADOPTA/Perrito7.png');
INSERT INTO "app_adopta" VALUES (8,'Maggie','Perro','ADOPTA/Perrito8.png');
INSERT INTO "app_adopta" VALUES (9,'Duke','Perro','ADOPTA/Perrito9.png');
INSERT INTO "app_adopta" VALUES (10,'Milo','Gato','ADOPTA/Gato1.png');
INSERT INTO "app_adopta" VALUES (11,'Chloe','Gato','ADOPTA/Gato2.png');
INSERT INTO "app_adopta" VALUES (12,'Lily','Gato','ADOPTA/Gato3.png');
INSERT INTO "app_adopta" VALUES (13,'Oliver','Gato','ADOPTA/Gato4.png');
INSERT INTO "app_adopta" VALUES (14,'Simba','Gato','ADOPTA/Gato5.png');
INSERT INTO "app_adopta" VALUES (15,'Nala','Gato','ADOPTA/Gato7.png');
INSERT INTO "app_adopta" VALUES (16,'Cleo','Gato','ADOPTA/Gato6.png');
INSERT INTO "app_adopta" VALUES (17,'Mirringa','Gato','ADOPTA/Gato8.jpeg');
INSERT INTO "app_adopta" VALUES (18,'Muñeca','Perro','ADOPTA/Perrito10.png');
INSERT INTO "app_dona" VALUES (1,'Pepito Perez',10000,'2024-11-10 04:30:21.513638','TD','Esto es una prueba',1);
INSERT INTO "app_dona" VALUES (2,'Joe Vill',30000,'2024-11-10 04:32:18.237741','TD','Esto es una prueba',9);
INSERT INTO "app_dona" VALUES (3,'Gabriela Sánchez',10000,'2024-11-10 04:56:19.375567','TD','Esto es una prueba',1);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "app_dona_USER_id_2c9715d8" ON "app_dona" (
	"USER_id"
);
END;

COMMIT;
