CREATE TABLE school_infos(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    school_name VARCHAR(255) NOT NULL,
    school_level VARCHAR(255) NOT NULL,
    contact_phone_no VARCHAR(255) NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    is_approved VARCHAR(255) default(0),
    city_id bigint unsigned NOT NULL,
    township_id bigint unsigned NOT NULL,
    address_detail TEXT NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);

ALTER TABLE users ADD school_info_id BIGINT  NULL;

CREATE TABLE school_users(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    school_info_id BIGINT  NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    otp CHAR(6) NOT NULL,
    expired_at TIMESTAMP NOT NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    FOREIGN KEY (school_info_id) REFERENCES school_infos(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);


ALTER TABLE school_users ADD is_remember_me TINYINT DEFAULT(0);
ALTER TABLE  school_users ADD signin_attempts INT DEFAULT(0);
ALTER TABLE  school_users ADD is_locked BIT DEFAULT(FALSE);
ALTER TABLE  school_users ADD is_signin_active BIT DEFAULT(FALSE);


CREATE TABLE `personal_access_tokens`(
`id` bigint unsigned NOT NULL AUTO_INCREMENT,
`tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
`tokenable_id` bigint unsigned NOT NULL,
`name` text COLLATE utf8mb4_unicode_ci NOT NULL,
`token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
`abilities` text COLLATE utf8mb4_unicode_ci,
`last_used_at` timestamp NULL DEFAULT NULL,
`expires_at` timestamp NULL DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
