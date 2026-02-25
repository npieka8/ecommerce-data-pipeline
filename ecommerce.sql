CREATE TABLE "users" (
  "user_id" integer PRIMARY KEY,
  "first_name" text,
  "last_name" text,
  "email" text UNIQUE,
  "phone_number" text,
  "address" text,
  "postal_code" text,
  "status" varchar,
  "created_at" timestamp,
  "last_login" timestamp
);

CREATE TABLE "products" (
  "product_id" integer PRIMARY KEY,
  "product_name" text,
  "description" text,
  "price" numeric(10,2),
  "quantity" integer,
  "status" varchar,
  "views" integer,
  "international_shipping" boolean,
  "created_at" timestamp
);

CREATE TABLE "orders" (
  "order_id" integer PRIMARY KEY,
  "user_id" integer,
  "total_amount" numeric(10,2),
  "created_at" timestamp,
  "status" varchar
);

CREATE TABLE "order_items" (
  "order_item_id" integer PRIMARY KEY,
  "order_id" integer,
  "product_id" integer,
  "quantity" integer,
  "price" numeric(10,2)
);

ALTER TABLE "orders" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "order_items" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("order_id");

ALTER TABLE "order_items" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("product_id");
