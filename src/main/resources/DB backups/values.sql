-- https://x-team.com/blog/automatic-timestamps-with-postgresql/
/*ROLES */
INSERT INTO role (name) VALUES ('ADMIN');
INSERT INTO role (name) VALUES ('MANAGER');
INSERT INTO role (name) VALUES ('USER');

/*USERS*/
INSERT INTO users (username, email, password, is_blocked) VALUES ( 'user1'::character varying(255), 'user1@mail.com'::character varying(255), '12345678'::character varying(255), false::boolean);
INSERT INTO users (username, email, password, is_blocked) VALUES ( 'user2'::character varying(255), 'user2@mail.com'::character varying(255), '12345678'::character varying(255), false::boolean);
INSERT INTO users (username, email, password, is_blocked) VALUES ( 'user3'::character varying(255), 'user3@mail.com'::character varying(255), '12345678'::character varying(255), false::boolean);
INSERT INTO users (username, email, password, is_blocked) VALUES ( 'user4'::character varying(255), 'user4@mail.com'::character varying(255), '12345678'::character varying(255), false::boolean);
INSERT INTO users (username, email, password, is_blocked) VALUES ( 'user5'::character varying(255), 'user5@mail.com'::character varying(255), '12345678'::character varying(255), false::boolean);
INSERT INTO users (username, email, password, is_blocked) VALUES ( 'user6'::character varying(255), 'user6@mail.com'::character varying(255), '12345678'::character varying(255), false::boolean);
INSERT INTO users (username, email, password, is_blocked) VALUES ( 'user7'::character varying(255), 'user7@mail.com'::character varying(255), '12345678'::character varying(255), false::boolean);
INSERT INTO users (username, email, password, is_blocked) VALUES ( 'user8'::character varying(255), 'user8@mail.com'::character varying(255), '12345678'::character varying(255), false::boolean);
INSERT INTO users (username, email, password, is_blocked) VALUES ( 'user9'::character varying(255), 'user9@mail.com'::character varying(255), '12345678'::character varying(255), false::boolean);
INSERT INTO users (username, email, password, is_blocked) VALUES ( 'user10'::character varying(255), 'user10@mail.com'::character varying(255), '12345678'::character varying(255), false::boolean);


INSERT INTO users (username, email, is_blocked, role_id, password) VALUES ('manager1'::character varying(255), 'manager1@mail.com'::character varying(255), false::boolean, '2'::integer, '12345678'::character varying(255));
INSERT INTO users (username, email, is_blocked, role_id, password) VALUES ('manager2'::character varying(255), 'manager2@mail.com'::character varying(255), false::boolean, '2'::integer, '12345678'::character varying(255));
INSERT INTO users (username, email, is_blocked, role_id, password) VALUES ('manager3'::character varying(255), 'manager3@mail.com'::character varying(255), false::boolean, '2'::integer, '12345678'::character varying(255));
INSERT INTO users (username, email, is_blocked, role_id, password) VALUES ('manager4'::character varying(255), 'manager4@mail.com'::character varying(255), false::boolean, '2'::integer, '12345678'::character varying(255));
INSERT INTO users (username, email, is_blocked, role_id, password) VALUES ('manager5'::character varying(255), 'manager5@mail.com'::character varying(255), false::boolean, '2'::integer, '12345678'::character varying(255));

INSERT INTO users (username, email, is_blocked, role_id, password) VALUES ('admin1'::character varying(255), 'admin1@mail.com'::character varying(255), false::boolean, '1'::integer, '12345678'::character varying(255));
INSERT INTO users (username, email, is_blocked, role_id, password) VALUES ('admin2'::character varying(255), 'admin2@mail.com'::character varying(255), false::boolean, '1'::integer, '12345678'::character varying(255));
INSERT INTO users (username, email, is_blocked, role_id, password) VALUES ('admin3'::character varying(255), 'admin3@mail.com'::character varying(255), false::boolean, '1'::integer, '12345678'::character varying(255));

/*POST TYPES*/
INSERT INTO post_type (name) VALUES ('TYPE1');
INSERT INTO post_type (name) VALUES ('TYPE2');
INSERT INTO post_type (name) VALUES ('TYPE3');

/*POST STATUSES*/
INSERT INTO post_status (name) VALUES ('NEW');
INSERT INTO post_status (name) VALUES ('APPROVED');
INSERT INTO post_status (name) VALUES ('DECLINED');

/*POSTS*/
