CREATE SCHEMA e01;

/* Create Tables for the entity sets */

CREATE TABLE e01."Center" (
  "ID" serial NOT NULL,
  "Open" boolean NOT NULL DEFAULT false,
  CONSTRAINT "Center_pkey" PRIMARY KEY ("ID")
);

CREATE TABLE e01."Person" (
  "ID" serial NOT NULL,
  "Name" character varying(20) NOT NULL DEFAULT 'Max Mustermann',
  "DateOfBirth" date,
  "AddressID" integer,

  CONSTRAINT "Person_pkey" PRIMARY KEY ("ID")
  CONSTRAINT "Person_lives_at" FOREIGN KEY "AddressID"
    REFERENCES e01."Address" ("ID")
      ON UPDATE NO ACTION
      /* We do not want to delete a person when the adress is deleted */
      ON DELETE SET NULL,
);

CREATE TABLE e01."Room" (
    "ID" character varying(10) NOT NULL,
    "Capacity" integer NOT NULL DEFAULT 0,
    "CenterID" integer,
    CONSTRAINT "Room_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "Room_is_in_Center" FOREIGN KEY ("CenterID")
        REFERENCES e01."Center" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
);

CREATE TABLE e01."Address" (
  "ID" serial NOT NULL,
  "Street" character varying(30) NOT NULL,
  "Number" character varying(5) NOT NULL,
  "ZipCode" character varying(7) NOT NULL,
  CONSTRAINT "Address_pkey" PRIMARY KEY ("ID"),
  CONSTRAINT "Street_Number_ZipCode_Uniqueness"
    UNIQUE ("Street", "Number", "ZipCode")
);

CREATE TABLE e01."TimeSlot" (
  /* Different way to define primary key constraint */
  "ID" serial NOT NULL PRIMARY KEY,
  "StartTime" time NOT NULL,
  "EndTime" time NOT NULL,

  /* As much constraints as possible :) */
  CONSTRAINT "StartTime_must_before_EndTime" CHECK ("StartTime" < "EndTime")
);

CREATE TABLE e01."Activity" (
  "ID" serial NOT NULL PRIMARY KEY,
  "Description" character varying(30) NOT NULL,
  "Agenda" text DEFAULT 'No Agenda given',
);

CREATE TABLE e01."Meeting" (
  "ID" serial NOT NULL PRIMARY KEY,

  /* Different way to define foreign key constraint */
  "TimeSlotID" integer NOT NULL,
  "RoomID" integer NOT NULL,

  CONSTRAINT "Meeting_is_happen_at" FOREIGN KEY "TimeSlotID"
    REFERENCES e01."TimeSlot" ("ID") MATCH SIMPLE
      ON UPDATE NO ACTION
      ON DELETE CASCADE,

  CONSTRAINT "Meeting_is_happen_in" FOREIGN KEY "RoomID"
    REFERENCES e01."Room" ("ID") MATCH SIMPLE
      ON UPDATE NO ACTION
      ON DELETE CASCADE,
);

/* Create Many to Many Relationships */

CREATE TABLE e01."Partakes" (
  "PersonID" integer NOT NULL,
  "MeetingID" integer NOT NULL,

  CONSTRAINT "Partakes_pkey" PRIMARY KEY ("PersonID", "MeetingID"),
  CONSTRAINT "Partakes_MeetingID_fkey" FOREIGN KEY ("MeetingID")
    REFERENCES e01."Meeting" ("ID") MATCH SIMPLE
      ON UPDATE NO ACTION
      ON DELETE CASCADE,
  CONSTRAINT "Partakes_PersonID_fkey" FOREIGN KEY ("PersonID")
    REFERENCES e01."Person" ("ID") MATCH SIMPLE
      ON UPDATE NO ACTION
      ON DELETE CASCADE
);

CREATE TABLE e01."MeetingDoesActivity" (
  "ActivityID" integer NOT NULL,
  "MeetingID" integer NOT NULL,

  CONSTRAINT "MeetingDoesActivity_pkey" PRIMARY KEY ("ActivityID", "MeetingID"),

  CONSTRAINT "MeetingDoesActivity_ActivityID_fkey" FOREIGN KEY ("ActivityID")
    REFERENCES e01."Activity" ("ID") MATCH SIMPLE
      ON UPDATE NO ACTION
      ON DELETE CASCADE,

  CONSTRAINT "MeetingDoesActivity_MeetingID_fkey" FOREIGN KEY ("MeetingID")
    REFERENCES e01."Meeting" ("ID") MATCH SIMPLE
      ON UPDATE NO ACTION
      ON DELETE CASCADE,
);

