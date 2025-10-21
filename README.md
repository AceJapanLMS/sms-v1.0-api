# sms-v1.0-api
This is web api for mobile integration to consume mobile  devices .

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

api/school/register
HTTP Verb: POST
json body: 
{
'school_name':'TOP ONE',
'school_level':'High School',
'email':'user1@gmail.com',
'phone':'0912345678910',
'city_Id':3,
'township_id':4,
'address':'YGN'
}