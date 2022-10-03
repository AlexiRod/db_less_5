CREATE DATABASE hospital;
GRANT ALL PRIVILEGES ON DATABASE hospital TO rodionov_203;

\connect hospital

CREATE TABLE "stationPersonel" (
  "persNr" SERIAL PRIMARY KEY,
  "nameNumbers" int,
  "station" int
);

CREATE TABLE "doctor" (
  "persNr" SERIAL PRIMARY KEY,
  "area" varchar,
  "rank" varchar
);

CREATE TABLE "caregiver" (
  "persNr" SERIAL PRIMARY KEY,
  "qualification" varchar
);

CREATE TABLE "patient" (
  "patientNr" SERIAL PRIMARY KEY,
  "name" varchar,
  "disease" varchar,
  "doctor" int
);

CREATE TABLE "hospitalStation" (
  "statNr" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "room" (
  "roomNr" SERIAL PRIMARY KEY,
  "bedsNum" int,
  "station" int
);

CREATE TABLE "admission" (
  "id" SERIAL PRIMARY KEY,
  "fromDate" timestamp,
  "toDate" timestamp,
  "patient" int,
  "room" int
);

ALTER TABLE "admission" ADD FOREIGN KEY ("patient") REFERENCES "patient" ("patientNr");
ALTER TABLE "admission" ADD FOREIGN KEY ("room") REFERENCES "room" ("roomNr");
ALTER TABLE "patient" ADD FOREIGN KEY ("doctor") REFERENCES "doctor" ("persNr");
ALTER TABLE "room" ADD FOREIGN KEY ("station") REFERENCES "hospitalStation" ("statNr");
ALTER TABLE "stationPersonel" ADD FOREIGN KEY ("station") REFERENCES "hospitalStation" ("statNr");
