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