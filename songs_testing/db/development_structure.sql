CREATE TABLE "authors" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "songs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "year" integer, "created_at" datetime, "updated_at" datetime, "author_id" integer);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20130206152344');

INSERT INTO schema_migrations (version) VALUES ('20130206153405');

INSERT INTO schema_migrations (version) VALUES ('20130206153742');