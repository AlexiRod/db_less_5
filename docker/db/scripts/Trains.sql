CREATE DATABASE trains;
GRANT ALL PRIVILEGES ON DATABASE trains TO rodionov_203;

\connect trains

CREATE TABLE "train" (
  "trainNr" SERIAL PRIMARY KEY,
  "length" real,
  "startStation" varchar,
  "endStation" varchar
);

CREATE TABLE "station" (
  "stationName" varchar PRIMARY KEY,
  "trackNum" int,
  "region" varchar,
  "cityName" varchar
);

CREATE TABLE "city" (
  "name" varchar,
  "region" varchar,
  PRIMARY KEY ("name", "region")
);

CREATE TABLE "connected" (
  "id" int PRIMARY KEY,
  "departure" timestamp,
  "arrival" timestamp,
  "trainNr" int,
  "departureStation" varchar,
  "arrivalStation" varchar
);

ALTER TABLE "station" ADD FOREIGN KEY ("cityName", "region") REFERENCES "city" ("name", "region");
ALTER TABLE "train" ADD FOREIGN KEY ("startStation") REFERENCES "station" ("stationName");
ALTER TABLE "train" ADD FOREIGN KEY ("endStation") REFERENCES "station" ("stationName");
ALTER TABLE "connected" ADD FOREIGN KEY ("trainNr") REFERENCES "train" ("trainNr");
ALTER TABLE "connected" ADD FOREIGN KEY ("arrivalStation") REFERENCES "station" ("stationName");
ALTER TABLE "connected" ADD FOREIGN KEY ("departureStation") REFERENCES "station" ("stationName");
