### 1. PostgreSQL

PostgreSQL একটি শক্তিশালী, ওপেন সোর্স রিলেশনাল ডেটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS), যা মূলত SQL এবং কিছু object-oriented বৈশিষ্ট্য সমর্থন করে। এটি ACID-compliant, অর্থাৎ এটি Atomicity, Consistency, Isolation, এবং Durability নিশ্চিত করে, যাতে ডেটা নিরাপদ এবং নির্ভরযোগ্য থাকে।
PostgreSQL খুবই স্কেলযোগ্য, এবং এতে রয়েছে stored procedures, triggers, views, এবং complex queries ব্যবহারের সুবিধা। এটি ডেভেলপারদের enterprise-level অ্যাপ্লিকেশন বানাতে সাহায্য করে এবং JSON, XML এর মত ডেটা ফর্ম্যাটও সাপোর্ট করে।

উদাহরণ:
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  age INTEGER
);

### 2. PostgreSQL-(Schema)

Schema হলো ডেটাবেসের ভিতরে একটি লজিকাল স্ট্রাকচার, যেটা বিভিন্ন টেবিল, ভিউ, ফাংশন, এবং অন্যান্য অবজেক্টকে সংগঠিত করে রাখে।
একটি ডেটাবেসে অনেকগুলি স্কিমা থাকতে পারে। এতে টেবিলগুলোর নাম এক হলেও আলাদা স্কিমাতে আলাদা অবজেক্ট হিসেবে থাকতে পারে।

উদাহরণ:
CREATE SCHEMA ecommerce;
CREATE TABLE ecommerce.products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  price NUMERIC
);


### 3. Primary Key এবং Foreign Key

Primary Key এটি এমন একটি কলাম (বা কলামসমষ্টি) যা প্রতিটি রেকর্ডকে অদ্বিতীয় (unique) ও non-null করে চিহ্নিত করে।
Foreign Key এটি এমন একটি কলাম যা অন্য টেবিলের primary key-কে reference করে। এটি টেবিলগুলোর মধ্যে সম্পর্ক তৈরি করে এবং referential integrity নিশ্চিত করে।


### 4. VARCHAR এবং CHAR

পরিবর্তনশীল দৈর্ঘ্য (variable) খালি জায়গা রাখে না মেমোরি বাঁচায়, কিন্তু সামান্য ধীর ।

উদাহরণ: 
name CHAR(10);    
title VARCHAR(50);


### 5. SELECT statement-এ WHERE

WHERE clause ব্যবহার করা হয় যখন ডেটাবেস থেকে শর্ত অনুযায়ী নির্দিষ্ট ডেটা আনতে হয়। এটি ডেটা ফিল্টার করতে সাহায্য করে।

উদাহরণ:
SELECT * FROM students WHERE age > 18;


### 6. LIMIT এবং OFFSET

এই দুইটি ক্লজ ব্যবহার হয় ডেটার pagination বা slicing করতে।
LIMIT: কতগুলো রেকর্ড দেখাতে হবে সেটি নির্ধারণ করে।
OFFSET: কতটি রেকর্ড স্কিপ করতে হবে সেটি বলে দেয়।

উদাহরণ:
SELECT * FROM products LIMIT 10 OFFSET 20;


### 7. UPDATE 

UPDATE স্টেটমেন্ট ব্যবহার করে ডেটাবেজের মধ্যে থাকা বিদ্যমান ডেটা পরিবর্তন করা যায়।

উদাহরণ:
UPDATE students SET age = 20 WHERE id = 1;


### 8. JOIN

JOIN ব্যবহার করা হয় দুই বা তার বেশি টেবিলকে একটি কমন কলামের মাধ্যমে সংযুক্ত করতে।
INNER JOIN: দুই টেবিলেই ম্যাচিং ডেটা থাকলে দেখায়।
LEFT JOIN: বাম টেবিলের সব ডেটা ও ডান টেবিলের ম্যাচিং ডেটা।
RIGHT JOIN, FULL JOIN ইত্যাদিও আছে।


### 9. GROUP BY

GROUP BY ব্যবহার করা হয় একই ধরনের ডেটাকে গ্রুপ করে তার উপর aggregate function (COUNT, SUM, AVG ইত্যাদি) প্রয়োগ করার জন্য।

উদাহরণ:
SELECT department_id, COUNT(*) 
FROM employees 
GROUP BY department_id;


### 10. PostgreSQL-এ COUNT(), SUM(), AVG()

এগুলো হলো aggregate functions যা ব্যবহার করে ডেটা বিশ্লেষণ করা যায়:
COUNT(): মোট রেকর্ড সংখ্যা
SUM(): যোগফল
AVG(): গড় হিসাব


উদাহরণ:
SELECT 
  COUNT(*) AS total_students,
  SUM(marks) AS total_marks,
  AVG(marks) AS average_marks
FROM students;


