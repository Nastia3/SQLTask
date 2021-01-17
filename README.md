# SQLTask
task for ms sqlServer


1.We need database with following data
    - We will save information in database about different hotels
    - Every hotel has following information, Name, Foundation year, Adress, Is active (indicates if hotel currently active)
    - We will have information about hotel rooms. Each hotel has many rooms. Every room belomg to only one hotel
    - Every room has following information: Number, Price, Comfort level (1,2,3) when 3 is most comfort level, Capability (amount of people that can leave in this room, like 1, 2,3 4 etc)
    - We will have information about users, that includes following fields: Name, Email
    - We will also store rezervations/bookings in our database. User can reserve many rooms. In same time Room can be reserved by many users.
    - Every rezervation has following information: user that performed rezervation, room that is reserved and Start/end date of reservation.
2. Implement SQL script that generates database.
3. Create sql file that contains sql commands that do following:
    - [x]1) Add 3 hotels to DB, one with name 'Edelweiss’
    - [x]2) Get All hotels from DB
    - [x]3) Update first hotel foundation year from existing value to 1937
    - [x]4) Delete 3d hotel from DB by Id
    - [x]5) Insert 10 users to Database, but have at least 2 users with Name Andrew or Anton
    - [x]6) Get all users which name starts from "A"
    - [x]7) Insert 10 rooms in DB. 7 to first hotel and 3 to other. Make sure both hotels have room number 101. Make sure 'Edelweiss' has room number 301, but other hotel no. Also make sure 'Edelweiss' do not have rooms with comfort level 3, but second hotel has at least one room with such comfort level
   - [x]8) Select All rooms from DB sorted by Price
    - [x]9) Select All rooms from DB that belong to 'Edelweiss' hotel and sorted by price
    - [x]10) Select Hotels that have rooms with comfort level 3
    - [x]11) Select Hotelname and room number for rooms that have comfort level 1
    - [x]12) Select Hotel names and count of hotel rooms
    - [x]13) Insert 10 different reservations to db.
    - [x]14) Select Username, room number, reservation period.
