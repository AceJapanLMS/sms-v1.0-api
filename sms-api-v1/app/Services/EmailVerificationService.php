<?php

namespace App\Services;

class EmailVerificationService
{
    /**
     * Check if email is valid and has valid MX records
     *
     * @param string $email
     * @return bool
     */
    public function isValidEmail(string $email): bool
    {
        // First check if email is valid format
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            return false;
        }

        // Extract domain
        $domain = substr(strrchr($email, "@"), 1);

        // Check if domain has valid MX records
        return checkdnsrr($domain, 'MX');
    }

    /**
     * Additional checks for disposable email domains
     *
     * @param string $email
     * @return bool
     */
    public function isDisposableEmail(string $email): bool
    {
        $domain = substr(strrchr($email, "@"), 1);
        
        // List of common disposable email domains
        $disposableDomains = [
            'tempmail.com',
            'temp-mail.org',
            'throwawaymail.com',
            'mailinator.com',
            'yopmail.com',
            'guerrillamail.com',
            // Add more as needed
        ];

        return in_array(strtolower($domain), $disposableDomains);
    }
}