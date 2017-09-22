# Students and Courses [![Build Status](https://travis-ci.org/tmoolmuang/student.svg?branch=master)](https://travis-ci.org/tmoolmuang/student)

* Ruby version 2.3.3p222

* Rails version 5.0.5

* Windows 10 - 64bit

* Live demo - https://students-tm.herokuapp.com


![studentcourses](https://user-images.githubusercontent.com/24881495/29548012-8a5378f0-86b2-11e7-9f22-c62b90d2206d.jpg)

# Sample Requests

* Student

INDEX
$ curl https://students-tm.herokuapp.com/api/v1/students -H "Authorization: Token token=MitJ68gojrz_55N3n8MKxg"

SHOW 
$ curl https://students-tm.herokuapp.com/api/v1/students/1 -H "Authorization: Token token=MitJ68gojrz_55N3n8MKxg"

CREATE
$ curl -H "Authorization: Token token=MitJ68gojrz_55N3n8MKxg" -H "Content-Type: application/json" -X POST -d '{ "name": "Spider Girl" }' https://students-tm.herokuapp.com/api/v1/students

UPDATE
$ curl -H "Authorization: Token token=MitJ68gojrz_55N3n8MKxg" -H "Content-Type: application/json" -X PUT -d '{ "name": "Spider Man" }' https://students-tm.herokuapp.com/api/v1/students/4

DELETE
$ curl https://students-tm.herokuapp.com/api/v1/students/4 -H "Authorization: Token token=MitJ68gojrz_55N3n8MKxg" -X DELETE


* course

INDEX
$ curl https://students-tm.herokuapp.com/api/v1/courses -H "Authorization: Token token=MitJ68gojrz_55N3n8MKxg" 

SHOW
$ curl https://students-tm.herokuapp.com/api/v1/courses/1 -H "Authorization: Token token=MitJ68gojrz_55N3n8MKxg"

CREATE
$ curl -H "Authorization: Token token=MitJ68gojrz_55N3n8MKxg" -H "Content-Type: application/json" -X POST -d '{ "name": "PHY101", "description": "Beginning Physics" }' https://students-tm.herokuapp.com/api/v1/courses

UPDATE
$ curl -H "Authorization: Token token=MitJ68gojrz_55N3n8MKxg" -H "Content-Type: application/json" -X PUT -d '{ "name": "PHY101", "description": "Physics I" }' https://students-tm.herokuapp.com/api/v1/courses/6

DELETE
$ curl https://students-tm.herokuapp.com/api/v1/courses/6 -H "Authorization: Token token=MitJ68gojrz_55N3n8MKxg" -X DELETE


* student_courses

INDEX
$ curl https://students-tm.herokuapp.com/api/v1/records -H "Authorization: Token token=MitJ68gojrz_55N3n8MKxg" 

CREATE
$ curl -H "Authorization: Token token=MitJ68gojrz_55N3n8MKxg" -H "Content-Type: application/json" -X POST -d '{"course_id": 1, "note": "added via curl" }' https://students-tm.herokuapp.com/api/v1/students/1/student_courses

DELETE
$ curl https://students-tm.herokuapp.com/api/v1/students/1/student_courses/23 -H "Authorization: Token token=MitJ68gojrz_55N3n8MKxg" -X DELETE

