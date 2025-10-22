CREATE TABLE school_info(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    school_name VARCHAR(255) NOT NULL,
    school_level VARCHAR(255) NOT NULL,
    contact_phone_no VARCHAR(255) NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    is_approved VARCHAR(255) NOT NULL,
    city_id bigint unsigned NOT NULL,
    township_id bigint unsigned NOT NULL,
    address_detail VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    updated_at  TIMESTAMP DEFAULT NULL
);
