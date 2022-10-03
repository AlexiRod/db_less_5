CREATE DATABASE library;
GRANT ALL PRIVILEGES ON DATABASE library TO rodionov_203;

\connect library

CREATE TABLE "book" (
  "ISBN" int PRIMARY KEY,
  "title" varchar,
  "author" varchar,
  "pageNum" int,
  "year" int,
  "publisher" varchar
);

CREATE TABLE "copy" (
  "copyNum" int PRIMARY KEY,
  "ISBN" int,
  "place" varchar
);

CREATE TABLE "category" (
  "name" varchar PRIMARY KEY
);

CREATE TABLE "reader" (
  "readerId" int PRIMARY KEY,
  "firstName" varchar,
  "lastName" varchar,
  "address" varchar,
  "birthday" timestamp
);

CREATE TABLE "publisher" (
  "publisherName" varchar PRIMARY KEY,
  "address" varchar
);

CREATE TABLE "bookCategory" (
  "id" SERIAL PRIMARY KEY,
  "ISBN" int,
  "name" varchar
);

CREATE TABLE "readerGetCopy" (
  "id" SERIAL PRIMARY KEY,
  "copyNum" int,
  "readerId" int,
  "returnDate" timestamp
);

CREATE TABLE "subcategory" (
  "id" SERIAL PRIMARY KEY,
  "parentCategory" varchar,
  "childCategory" varchar
);

ALTER TABLE "book" ADD FOREIGN KEY ("publisher") REFERENCES "publisher" ("publisherName");
ALTER TABLE "copy" ADD FOREIGN KEY ("ISBN") REFERENCES "book" ("ISBN");
ALTER TABLE "subcategory" ADD FOREIGN KEY ("childCategory") REFERENCES "category" ("name");
ALTER TABLE "subcategory" ADD FOREIGN KEY ("parentCategory") REFERENCES "category" ("name");
ALTER TABLE "readerGetCopy" ADD FOREIGN KEY ("copyNum") REFERENCES "copy" ("copyNum");
ALTER TABLE "readerGetCopy" ADD FOREIGN KEY ("readerId") REFERENCES "reader" ("readerId");
ALTER TABLE "bookCategory" ADD FOREIGN KEY ("ISBN") REFERENCES "book" ("ISBN");
ALTER TABLE "bookCategory" ADD FOREIGN KEY ("name") REFERENCES "category" ("name");
