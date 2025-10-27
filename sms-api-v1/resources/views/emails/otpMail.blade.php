<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>sms-web-api - OTP</title>
</head>
<body>
    <h3>Dear, {{ $mailData['school_name'] }}</h3>
    <h3>{{ $mailData['title'] }}</h3>

    <p style="font-size: 24px; font-weight: 700;">Your OTP code is: {{ $mailData['otp'] }}</p>

    <p>
        This otp code will expire in 15 minutes. If you did not request this code, please ignore this email.
    </p>

    <p>Thank you,<br/>sms-web-api</p>
</body>
</html>
