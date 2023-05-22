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
-- Class Counter as table counters
--

CREATE TABLE "counters" (
  "id" serial,
  "value" integer NOT NULL
);

ALTER TABLE ONLY "counters"
  ADD CONSTRAINT counters_pkey PRIMARY KEY (id);


--
-- Class EventGuestSuggestion as table event_guest_suggestions
--

CREATE TABLE "event_guest_suggestions" (
  "id" serial,
  "sender" integer NOT NULL,
  "user" integer NOT NULL,
  "event" integer NOT NULL,
  "created" timestamp without time zone NOT NULL,
  "text" text
);

ALTER TABLE ONLY "event_guest_suggestions"
  ADD CONSTRAINT event_guest_suggestions_pkey PRIMARY KEY (id);


--
-- Class EventGuest as table event_guests
--

CREATE TABLE "event_guests" (
  "id" serial,
  "user" integer NOT NULL,
  "event" integer NOT NULL,
  "created" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "event_guests"
  ADD CONSTRAINT event_guests_pkey PRIMARY KEY (id);


--
-- Class EventInvitation as table event_invitations
--

CREATE TABLE "event_invitations" (
  "id" serial,
  "user" integer NOT NULL,
  "sender" integer NOT NULL,
  "event" integer NOT NULL,
  "created" timestamp without time zone NOT NULL,
  "text" text,
  "status" integer NOT NULL
);

ALTER TABLE ONLY "event_invitations"
  ADD CONSTRAINT event_invitations_pkey PRIMARY KEY (id);


--
-- Class EventRequest as table event_requests
--

CREATE TABLE "event_requests" (
  "id" serial,
  "user" integer NOT NULL,
  "companions" json NOT NULL,
  "event" integer NOT NULL,
  "created" timestamp without time zone NOT NULL,
  "text" text,
  "status" integer NOT NULL
);

ALTER TABLE ONLY "event_requests"
  ADD CONSTRAINT event_requests_pkey PRIMARY KEY (id);


--
-- Class Event as table events
--

CREATE TABLE "events" (
  "id" serial,
  "type" integer NOT NULL,
  "visibility" integer NOT NULL,
  "created" timestamp without time zone NOT NULL,
  "title" text NOT NULL,
  "verified" boolean NOT NULL,
  "hosts" json NOT NULL,
  "lat" double precision NOT NULL,
  "long" double precision NOT NULL,
  "description" text,
  "start" timestamp without time zone NOT NULL,
  "end" timestamp without time zone NOT NULL,
  "imageUrl" text
);

ALTER TABLE ONLY "events"
  ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Class FriendRequest as table friend_requests
--

CREATE TABLE "friend_requests" (
  "id" serial,
  "sender" integer NOT NULL,
  "receiver" integer NOT NULL,
  "text" text,
  "status" integer NOT NULL,
  "created" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "friend_requests"
  ADD CONSTRAINT friend_requests_pkey PRIMARY KEY (id);


--
-- Class Friendship as table friendships
--

CREATE TABLE "friendships" (
  "id" serial,
  "users" json NOT NULL,
  "created" timestamp without time zone NOT NULL,
  "badges" json NOT NULL
);

ALTER TABLE ONLY "friendships"
  ADD CONSTRAINT friendships_pkey PRIMARY KEY (id);


--
-- Class Notification as table notifications
--

CREATE TABLE "notifications" (
  "id" serial,
  "created" timestamp without time zone NOT NULL,
  "type" integer NOT NULL,
  "read" boolean NOT NULL,
  "ref" integer NOT NULL,
  "receiver" integer NOT NULL
);

ALTER TABLE ONLY "notifications"
  ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Class Rating as table ratings
--

CREATE TABLE "ratings" (
  "id" serial,
  "created" timestamp without time zone NOT NULL,
  "type" integer NOT NULL,
  "sender" integer NOT NULL,
  "receiver" integer NOT NULL,
  "stars" integer NOT NULL,
  "text" text
);

ALTER TABLE ONLY "ratings"
  ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


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
  "badges" json NOT NULL,
  "uniqueCode" text NOT NULL
);

ALTER TABLE ONLY "users"
  ADD CONSTRAINT users_pkey PRIMARY KEY (id);


