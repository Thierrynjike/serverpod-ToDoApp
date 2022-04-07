--
-- Class Task as table task
--

CREATE TABLE task (
  "id" serial,
  "name" text NOT NULL,
  "description" text NOT NULL,
  "creationDate" timestamp without time zone,
  "assignedTo" text NOT NULL
);

ALTER TABLE ONLY task
  ADD CONSTRAINT task_pkey PRIMARY KEY (id);


