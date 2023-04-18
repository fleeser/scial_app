--
-- Class AuthEmail as table auth_email
--

CREATE TABLE "auth_email" (
  "id" serial,
  "userId" integer NOT NULL,
  "email" text NOT NULL,
  "hash" text NOT NULL
);

ALTER TABLE ONLY "auth_email"
  ADD CONSTRAINT auth_email_pkey PRIMARY KEY (id);

CREATE UNIQUE INDEX auth_email_email_idx ON "auth_email" USING btree ("email");


--
-- Class AuthForgotPasswordRequest as table auth_forgot_password_request
--

CREATE TABLE "auth_forgot_password_request" (
  "id" serial,
  "email" text NOT NULL,
  "verificationCode" text NOT NULL
);

ALTER TABLE ONLY "auth_forgot_password_request"
  ADD CONSTRAINT auth_forgot_password_request_pkey PRIMARY KEY (id);

CREATE INDEX auth_forgot_password_request_email_idx ON "auth_forgot_password_request" USING btree ("email");
CREATE INDEX auth_forgot_password_request_verification_code_idx ON "auth_forgot_password_request" USING btree ("verificationCode");


--
-- Class AuthSignUpRequest as table auth_sign_up_request
--

CREATE TABLE "auth_sign_up_request" (
  "id" serial,
  "email" text NOT NULL,
  "hash" text NOT NULL,
  "verificationCode" text NOT NULL
);

ALTER TABLE ONLY "auth_sign_up_request"
  ADD CONSTRAINT auth_sign_up_request_pkey PRIMARY KEY (id);

CREATE UNIQUE INDEX auth_sign_up_request_email_idx ON "auth_sign_up_request" USING btree ("email");


--
-- Class User as table users
--

CREATE TABLE "users" (
  "id" serial,
  "name" text,
  "created" timestamp without time zone NOT NULL,
  "imageUrl" text,
  "verified" boolean NOT NULL,
  "private" boolean NOT NULL,
  "badges" json NOT NULL
);

ALTER TABLE ONLY "users"
  ADD CONSTRAINT users_pkey PRIMARY KEY (id);


