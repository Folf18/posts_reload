CREATE TABLE "users" (
  "id" serial PRIMARY KEY,
  "username" varchar(255) NOT NULL,
  "email" varchar(255) NOT NULL,
  "password" varchar(255) NOT NULL,
  "is_blocked" boolean NOT NULL DEFAULT false,
  "role_id" int NOT NULL DEFAULT 1,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
);

CREATE TABLE "role" (
  "id" serial PRIMARY KEY,
  "name" varchar(255) NOT NULL,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
);

CREATE TABLE "post" (
  "id" serial PRIMARY KEY,
  "summary" varchar(255) NOT NULL,
  "description" varchar,
  "post_type_id" int NOT NULL,
  "user_id" int NOT NULL,
  "post_status_id" int NOT NULL DEFAULT 1,
 "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
);

CREATE TABLE "post_type" (
  "id" serial PRIMARY KEY,
  "name" varchar(255) NOT NULL,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
);

CREATE TABLE "notification" (
  "id" serial PRIMARY KEY,
  "message" varchar(255) NOT NULL,
  "post_id" int NOT NULL,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
);

CREATE TABLE "post_status" (
  "id" serial PRIMARY KEY,
  "name" varchar(255) NOT NULL,
 "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
);

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "role" ("id");

ALTER TABLE "post" ADD FOREIGN KEY ("post_type_id") REFERENCES "post_type" ("id");

ALTER TABLE "post" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "notification" ADD FOREIGN KEY ("post_id") REFERENCES "post" ("id");

ALTER TABLE "post" ADD FOREIGN KEY ("post_status_id") REFERENCES "post_status" ("id");
