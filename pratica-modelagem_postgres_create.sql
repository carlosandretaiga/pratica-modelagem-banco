CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"nome" TEXT,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	"price" integer NOT NULL,
	"size" TEXT NOT NULL,
	"category" TEXT NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.picturesProducts" (
	"id" serial NOT NULL,
	"imageUrl" TEXT NOT NULL,
	"productId" serial NOT NULL,
	CONSTRAINT "picturesProducts_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.orders" (
	"id" serial NOT NULL,
	"statusProduct" TEXT NOT NULL,
	"date" DATE NOT NULL,
	"addressId" integer NOT NULL,
	"userId" integer NOT NULL,
	CONSTRAINT "orders_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.ordersProducts" (
	"id" serial NOT NULL,
	"productId" integer NOT NULL,
	"quantity" integer NOT NULL,
	"orderId" integer NOT NULL,
	CONSTRAINT "ordersProducts_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.address" (
	"id" serial NOT NULL,
	"street" TEXT NOT NULL,
	"number" TEXT NOT NULL,
	"codePostal" TEXT NOT NULL,
	"city" TEXT NOT NULL,
	"state" TEXT NOT NULL,
	"userId" integer NOT NULL,
	CONSTRAINT "address_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "picturesProducts" ADD CONSTRAINT "picturesProducts_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "orders" ADD CONSTRAINT "orders_fk0" FOREIGN KEY ("addressId") REFERENCES "address"("id");
ALTER TABLE "orders" ADD CONSTRAINT "orders_fk1" FOREIGN KEY ("userId") REFERENCES "users"("id");

ALTER TABLE "ordersProducts" ADD CONSTRAINT "ordersProducts_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "ordersProducts" ADD CONSTRAINT "ordersProducts_fk1" FOREIGN KEY ("orderId") REFERENCES "orders"("id");

ALTER TABLE "address" ADD CONSTRAINT "address_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");







