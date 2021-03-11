CREATE TABLE role (
	role_id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(20)
);

INSERT INTO role (title) values ('superadmin', 'admin', 'user');

CREATE TABLE user (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(20) NOT NULL,
	password TEXT NOT NULL,
	email TEXT NOT NULL,
	role_id INT NOT NULL,
	date_created DATETIME DEFAULT NOW() NOT NULL,
	date_deleted DATETIME DEFAULT NULL,
	FOREIGN KEY (role_id) REFERENCES role(role_id)
);

CREATE TABLE user_hash (
	user_hash_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT NOT NULL,
	hash TEXT NOT NULL,
	date_created DATETIME DEFAULT NOW() NOT NULL,
	date_expires DATETIME NOT NULL,
	FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE tracked_url (
	tracked_url_id INT PRIMARY KEY AUTO_INCREMENT,
	url TEXT NOT NULL,
	user_id INT NOT NULL,
	date_added DATETIME DEFAULT NOW(),
	date_removed DATETIME DEFAULT NULL,
	FOREIGN KEY (user_id) REFERENCES user(user_id),
);
