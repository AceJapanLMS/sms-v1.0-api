php 8.3
laravlel 11.0
mysql 8.5
===========================================================================================================
api generate 
port:api/city/{1}
HTTP Verb: GET 
```
{
"success": true,
"data": [
{
"id": 3,
"city_name": "Yangon",
"created_at": "2025-06-16T15:12:08.000000Z",
"updated_at": "2025-06-16T15:12:08.000000Z"
}
]
}
```
township api
api generate 
port:api/township/
HTTP Verb: GET 
```
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
```
(http://127.0.0.1:8000/api/schoolinfo)
HTTP Verb: POST

Header config
Key:value
Accept:application/json

REQUEST json body: 
```
{
"school_name":"TOP ONE5",
"school_level":"High School",
"contact_email":"user5@gmail.com",
"contact_phone_no":"0912345678910",
"city_id":3,
"township_id":4,
"address_detail":"YGN"
}
```
RESPONSE JSON BODY
```
{
    "success": true,
    "data": true,
    "message": "School Info created"
}
```
//branch name : send_otp_api
function name : send email as OTP to user's email 
send otp email api 
1) send otp email for mobile register process
2) add user email  , password and school_info_id into users table 
3) add record school_users 

api/schoolinfo
HTTP Verb : POST 
Header Key:value
Accept:application/json
RESPONSE JSON BODY: 
```
{
"status":"School Info register is completed for {school_name}",
"school_name":"TOP ONE",
"email" : "user1@gmail.com",
"otp"   : "123456",
"expired_at": "5 minutes"
}
```
//branch name : send_otp
function name : verify email OTP to complate registartion process 
/api/sendotp
HTTP Verb : POST 
Header Key:value
Accept:application/json
REQUEST JSON BODY: 
```
{
"email" : "user1@gmail.com",
"school_name":'TOP ONE'
}
```
===========================================================================================================
//branch name : re_send_otp
function name : verify email OTP to complate registartion process
/api/resendotp
HTTP Verb : POST
Header Key:value
Accept:application/json
REQUEST JSON BODY:
```
{
    "email": "akog02@gmail.com",
    "school_name": "HI"
}
```
================================================================================================================
//branch name : verify_otp_api
function name : verify email OTP to complate registartion process 
/api/verifyotp
HTTP Verb : POST 
Header Key:value
Accept:application/json
REQUEST JSON BODY: 
```
{
"email" : "user1@gmail.com",
"otp"   : "123456"
}
```
// checking logic psudocode 
if(check opt and email) from this Query table school_users
then verify success 
else verify failed 
================================================================================================================
//branch name : define_usernewpassword_api
function name : define user New password and store user table 
api/setnewuserpassword
HTTP Verb : POST
Header Key:value
Accept:application/json
REQUEST JSON BODY: 
```
{
    "email": "akog0230@gmail.com",
    "password": "1",
    "confirm_password": "aaaaaa"
}
```
Query table reference : school_users
================================================================================================================
//branch name : user_sign_api
function name : sign with user name and password
api/signin
HTTP Verb : POST
Header Key:value
Accept:application/json
REQUEST JSON BODY: 
```
{
"email" : "user1@gmail.com",
"password"   : "123456",
"is_remember_me":true,
"signin_attempts":0
}
```
Query table reference : school_users,school_infos.is_approved=1
select u.id,u.email,si.is_approved from school_users u
inner join school_infos si on u.school_info_id=si.id
where si.is_approved=1
================================================================================================================
branch name: dashboard_noticeboard_api
function name: dashboard/noticeboard for admin user
secured api
api/dashboard/noticeboard
HTTP Verb : GET
Header Key:value
Accept:application/json
RESPONSE JSON BODY: 
```
{
 "success": true,
    "data": [
        "today":[
            {
                "notice":"ကျောင်းသားမိဘ စုံညီတွေ့ဆုံပွဲ",
                "from_date:'2025-10-28 08:48:36',
                "to_date":'2025-10-28 23:48:36',
                "grade_id":NULL,
                "grade_name":NULL
            },
            {
                "notice":"Chemical Test",
                "from_date:'2025-10-28 08:48:36',
                "to_date":'2025-10-28 23:48:36',
                "grade_id":11,
                "grade_name":Grade11
            }
        ],
        "upcomming":[
            {
                "notice":"Student Grading",
                "from_date:'2025-10-28 08:48:36',
                "to_date":'2025-10-28 23:48:36',
                "grade_id":12,
                "grade_name":Grade12
            },
            {
                "notice":"Revision for BIO Subject",
                "from_date:'2025-10-29 08:48:36',
                "to_date":'2025-10-30 23:48:36',
                "grade_id":12,
                "grade_name":Grade12
            },
            {
                "notice":"Revision for MATH Subject",
                "from_date:'2025-10-29 08:48:36',
                "to_date":'2025-10-30 23:48:36',
                "grade_id":12,
                "grade_name":Grade12
            }     
        ]
    ]
}
```
Query table reference : notices 
===========================================================================================================
branch name: dashboard_myschool_api
function name: dashboard/my school for admin user
secured api
api/dashboard/notice_board
HTTP Verb : GET
Header Key:value
Accept:application/json
RESPONSE JSON BODY: 
===========================================================================================================
branch name: dashboard_attendance_api
function name: dashboard/attendance for admin user
secured api
api/dashboard/notice_board
HTTP Verb : GET
Header Key:value
Accept:application/json
RESPONSE JSON BODY: 
===========================================================================================================
branch name: dashboard_grading_api
function name: dashboard/grading for admin user
secured api
api/dashboard/notice_board
HTTP Verb : GET
Header Key:value
Accept:application/json
RESPONSE JSON BODY: 
===========================================================================================================
api/roles
===========================================================================================================
api/userProfile
===========================================================================================================
api/forgotpassword
===========================================================================================================
api/changepassword
{
    "current_password":"xxxxxx",
    "new_password":"xyz123",
    "confirm_password":"xyz123"
}
===========================================================================================================
api/logout
===========================================================================================================
secured api
api/teacher
```
{
"profile_image": "base64 format", 
"name":"Tr. Min Min",
"nrc":"12/Nataka(N)9517536452,
"brithday":"2025-10-10",
"phone":"09852963741",
"address","YGN",
"teacher_level":"Founder",
"role":"Teacher",
"education":"BED",
"teacher_fees":800000,
"username":"MG",
"password":"987654"
}
```
===========================================================================================================
web app side
enable web user for mobile (admin control)