
php 8.3
laravlel 11.0
mysql 8.5
api generate 
port:api/city/{1}
HTTP Verb: GET 
{
"success": true,
"data": [
{
"id": 3,
"city_name": "Yangon",
"created_at": "2025-06-16T15:12:08.000000Z",
"updated_at": "2025-06-16T15:12:08.000000Z"
},
{
"id": 4,
"city_name": "Mandalay",
"created_at": "2025-06-16T15:12:25.000000Z",
"updated_at": "2025-06-16T15:12:25.000000Z"
},
{
"id": 5,
"city_name": "Naypyitaw",
"created_at": "2025-06-16T15:42:21.000000Z",
"updated_at": "2025-06-16T15:42:21.000000Z"
},
{
"id": 6,
"city_name": "Mawlamyine",
"created_at": "2025-06-17T02:53:30.000000Z",
"updated_at": "2025-07-04T08:40:34.000000Z"
},
{
"id": 7,
"city_name": "MyintKyiNar",
"created_at": "2025-07-04T08:35:59.000000Z",
"updated_at": "2025-07-04T08:35:59.000000Z"
}
]
}
township api
api generate 
port:api/township/
HTTP Verb: GET 
{
"success": true,
"data": [
{
"id": 3,
"township_name": "Hlaing",
"city_id":3,
"created_at": "2025-06-16T15:12:08.000000Z",
"updated_at": "2025-06-16T15:12:08.000000Z"
},
{
"id": 4,
"township_name": "အမရပူရမြို့နယ်",
"city_id":4,
"created_at": "2025-06-16T15:12:08.000000Z",
"updated_at": "2025-06-16T15:12:08.000000Z"
}
]
}


(http://127.0.0.1:8000/api/schoolinfo)
HTTP Verb: POST

Header config
Key:value
Accept:application/json

REQUEST json body: 
{
"school_name":"TOP ONE5",
"school_level":"High School",
"contact_email":"user5@gmail.com",
"contact_phone_no":"0912345678910",
"city_id":3,
"township_id":4,
"address_detail":"YGN"
}
RESPONSE JSON BODY
{
    "success": true,
    "data": true,
    "message": "School Info created"
}
//branch name : send_otp_api
function name : send email as OTP to user's email 
api/sendEmailOTP
HTTP Verb : POST 
Header Key:value
Accept:application/json
RESPONSE JSON BODY: 
{
"status":"School Info register is completed for {school_name}",
"school_name":"TOP ONE",
"email" : "user1@gmail.com",
"otp"   : "123456",
"expired_at": "5 minutes"
}

//branch name : verify_otp_api
function name : verify email OTP to complate registartion process 
/api/verifyOTP
HTTP Verb : POST 
Header Key:value
Accept:application/json
REQUEST JSON BODY: 
{
"email" : "user1@gmail.com",
"otp"   : "123456"
}
// checking logic psudocode 
if(check opt and email) from this Query table school_users
then verify success 
else verify failed 
================================================================================================================
//branch name : define_usernewpassword_api
function name : define user New password and store user table 
api/setnewuserPassword
HTTP Verb : POST
Header Key:value
Accept:application/json
REQUEST JSON BODY: 
{
"email" : "user1@gmail.com",
"password"   : "123456",
"confirm_password"   : "123456"
}
Query table reference : school_users
================================================================================================================
//branch name : user_login_api
function name : sign for user login
api/sign
HTTP Verb : POST
Header Key:value
Accept:application/json
REQUEST JSON BODY: 
{
"email" : "user1@gmail.com",
"password"   : "123456",
}
Query table reference : school_users
================================================================================================================

