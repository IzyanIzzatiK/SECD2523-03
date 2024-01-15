CREATE TABLE UserType (
    UserTypeID NUMBER PRIMARY KEY,
    userType VARCHAR2(50) NOT NULL
);

CREATE TABLE Users (
    UserID NUMBER PRIMARY KEY,
    F_Name VARCHAR2(50),
    L_Name VARCHAR2(50),
    Address VARCHAR2(255),
    City VARCHAR2(50),
    State VARCHAR2(50),
    Postcode VARCHAR2(20),
    Email VARCHAR2(100),
    UserTypeID NUMBER,
    CONSTRAINT fk_UserType FOREIGN KEY (UserTypeID) REFERENCES UserType(UserTypeID)
);

CREATE TABLE Telephone (
    UserID NUMBER,
    no_phone VARCHAR2(15),
    CONSTRAINT pk_Telephone PRIMARY KEY (UserID, no_phone),
    CONSTRAINT fk_Telephone_User FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE NormalUser (
    UserID NUMBER PRIMARY KEY,

    CONSTRAINT fk_NormalUser_User FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Admin (
    UserID NUMBER PRIMARY KEY,
    Role VARCHAR2(50),
    CONSTRAINT fk_Admin_User FOREIGN KEY (UserID) REFERENCES Users(UserID)
);


CREATE TABLE EventOrganizer (
    UserID NUMBER PRIMARY KEY,
     Social_Media VARCHAR2(50),
    CONSTRAINT fk_EventOrganizer_User FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Event (
    EventID NUMBER PRIMARY KEY,
    UserID NUMBER,
    Event_Description VARCHAR2(255),
    Event_Location VARCHAR2(100),
    Event_Type VARCHAR2(50),
    Number_Audience NUMBER,
    Is_Approve VARCHAR2(1),
    Event_Name VARCHAR2(100),
    CONSTRAINT fk_Event_User FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE EventTime (
    EventID NUMBER PRIMARY KEY,
    Start_Time TIMESTAMP,
    End_Time TIMESTAMP,
    CONSTRAINT fk_EventTime_Event FOREIGN KEY (EventID) REFERENCES Event(EventID)
);

CREATE TABLE Feedback (
    FeedbackID NUMBER PRIMARY KEY,
    UserID NUMBER,
    EventID NUMBER,
    Feedback_Text VARCHAR2(500),
    Timestamp TIMESTAMP,
    CONSTRAINT fk_Feedback_User FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CONSTRAINT fk_Feedback_Event FOREIGN KEY (EventID) REFERENCES Event(EventID)
);

CREATE TABLE PaymentMethod (
    MethodID NUMBER PRIMARY KEY,
    Payment_Method VARCHAR2(50)
);



CREATE TABLE Payment (
    PaymentID NUMBER PRIMARY KEY,
    UserID NUMBER,
    MethodID NUMBER,
    Amount NUMBER,
    Timestamp TIMESTAMP,
    CONSTRAINT fk_Payment_User FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CONSTRAINT fk_Payment_Method FOREIGN KEY (MethodID) REFERENCES PaymentMethod(MethodID)
);

CREATE TABLE TicketType (
    Ticket_TypeID NUMBER PRIMARY KEY,
    Ticket_Type VARCHAR2(50)
);

CREATE TABLE Ticket (
    TicketID NUMBER PRIMARY KEY,
    UserID NUMBER,
    PaymentID NUMBER,
    EventID NUMBER,
    Ticket_TypeID NUMBER,
    Price NUMBER(10, 2),
    Date_of_Purchase DATE,
    CONSTRAINT fk_Ticket_User FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CONSTRAINT fk_Ticket_Payment FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID),
    CONSTRAINT fk_Ticket_Event FOREIGN KEY (EventID) REFERENCES Event(EventID),
    CONSTRAINT fk_Ticket_TicketType FOREIGN KEY (Ticket_TypeID) REFERENCES TicketType(Ticket_TypeID)
);

CREATE TABLE Report (
    ReportID NUMBER PRIMARY KEY,
    EventID NUMBER, 
    UserID NUMBER,
    ReportTitle VARCHAR2(100),
    ReportData CLOB,
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_Report_User FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CONSTRAINT fk_Report_Event FOREIGN KEY (EventID) REFERENCES Event(EventID)
);
-- Inserting data into UserType table
INSERT INTO UserType (UserTypeID, userType) VALUES (1, 'Normal User');
INSERT INTO UserType (UserTypeID, userType) VALUES (2, 'Admin');
INSERT INTO UserType (UserTypeID, userType) VALUES (3, 'Event Organizer');

-- Inserting data into Users table
INSERT INTO Users (UserID, F_Name, L_Name, Address, City, State, Postcode, Email, UserTypeID)
VALUES (101, 'John', 'Doe', '123 Main Street', 'Kuala Lumpur', 'Wilayah Persekutuan', '50200', 'john.doe@email.com', 1);

INSERT INTO Users (UserID, F_Name, L_Name, Address, City, State, Postcode, Email, UserTypeID)
VALUES (102, 'Jane', 'Smith', '456 Oak Avenue', 'Penang', 'Penang', '10300', 'jane.smith@email.com', 2);

INSERT INTO Users (UserID, F_Name, L_Name, Address, City, State, Postcode, Email, UserTypeID)
VALUES (103, 'Ahmad', 'Rahman', '789 Pine Road', 'Johor Bahru', 'Johor', '80000', 'ahmad.rahman@email.com', 1);

INSERT INTO Users (UserID, F_Name, L_Name, Address, City, State, Postcode, Email, UserTypeID)
VALUES (104, 'Siti', 'Hassan', '321 Cedar Lane', 'Kota Kinabalu', 'Sabah', '88000', 'siti.hassan@email.com', 1);

INSERT INTO Users (UserID, F_Name, L_Name, Address, City, State, Postcode, Email, UserTypeID)
VALUES (105, 'David', 'Lim', '555 Maple Street', 'Ipoh', 'Perak', '30000', 'david.lim@email.com', 2);

INSERT INTO Users (UserID, F_Name, L_Name, Address, City, State, Postcode, Email, UserTypeID)
VALUES (106, 'Aisha', 'Ng', '987 Birch Avenue', 'Shah Alam', 'Selangor', '40100', 'aisha.ng@email.com', 1);

INSERT INTO Users (UserID, F_Name, L_Name, Address, City, State, Postcode, Email, UserTypeID)
VALUES (107, 'Michael', 'Wong', '222 Elm Road', 'George Town', 'Penang', '10200', 'michael.wong@email.com', 1);

INSERT INTO Users (UserID, F_Name, L_Name, Address, City, State, Postcode, Email, UserTypeID)
VALUES (108, 'Emily', 'Tan', '777 Pine Lane', 'Kuching', 'Sarawak', '93000', 'emily.tan@email.com', 3);

INSERT INTO Users (UserID, F_Name, L_Name, Address, City, State, Postcode, Email, UserTypeID)
VALUES (109, 'Hassan', 'Ibrahim', '444 Cedar Avenue', 'Kuala Terengganu', 'Terengganu', '20000', 'hassan.ibrahim@email.com', 1);

INSERT INTO Users (UserID, F_Name, L_Name, Address, City, State, Postcode, Email, UserTypeID)
VALUES (110, 'Nina', 'Chong', '888 Oak Road', 'Petaling Jaya', 'Selangor', '46200', 'nina.chong@email.com', 1);

INSERT INTO Users (UserID, F_Name, L_Name, Address, City, State, Postcode, Email, UserTypeID)
VALUES (111, 'Ravi', 'Kumar', '111 Pine Lane', 'Alor Setar', 'Kedah', '5000', 'ravi.kumar@email.com', 3);

INSERT INTO Users (UserID, F_Name, L_Name, Address, City, State, Postcode, Email, UserTypeID)
VALUES (112, 'Anita', 'Raj', '666 Maple Avenue', 'Miri', 'Sarawak', '98000', 'anita.raj@email.com', 1);

INSERT INTO Users (UserID, F_Name, L_Name, Address, City, State, Postcode, Email, UserTypeID)
VALUES (113, 'Chen', 'Yong', '333 Birch Road', 'Seremban', 'Negeri Sembilan', '70200', 'chen.yong@email.com', 1);

INSERT INTO Users (UserID, F_Name, L_Name, Address, City, State, Postcode, Email, UserTypeID)
VALUES (114, 'Saravanan', 'Naidu', '999 Elm Avenue', 'Langkawi', 'Kedah', '7000', 'saravanan.naidu@email.com', 3);

INSERT INTO Users (UserID, F_Name, L_Name, Address, City, State, Postcode, Email, UserTypeID)
VALUES (115, 'Farah', 'Ali', '777 Cedar Lane', 'Kuala Lumpur', 'Wilayah Persekutuan', '50400', 'farah.ali@email.com', 1);

INSERT INTO Users (UserID, F_Name, L_Name, Address, City, State, Postcode, Email, UserTypeID)
VALUES (116, 'Tengku', 'Aziz', '555 Pine Road', 'Johor Bahru', 'Johor', '80200', 'tengku.aziz@email.com', 1);

INSERT INTO Users (UserID, F_Name, L_Name, Address, City, State, Postcode, Email, UserTypeID)
VALUES (117, 'Lily', 'Chan', '222 Maple Avenue', 'Kota Bharu', 'Kelantan', '15000', 'lily.chan@email.com', 3);

INSERT INTO Users (UserID, F_Name, L_Name, Address, City, State, Postcode, Email, UserTypeID)
VALUES (118, 'Arjun', 'Rajput', '888 Birch Road', 'Shah Alam', 'Selangor', '40200', 'arjun.rajput@email.com', 1);

INSERT INTO Users (UserID, F_Name, L_Name, Address, City, State, Postcode, Email, UserTypeID)
VALUES (119, 'Nor', 'Azizah', '444 Elm Lane', 'Kuantan', 'Pahang', '25000', 'nor.azizah@email.com', 1);

INSERT INTO Users (UserID, F_Name, L_Name, Address, City, State, Postcode, Email, UserTypeID)
VALUES (120, 'Wei', 'Liu', '666 Oak Road', 'George Town', 'Penang', '10100', 'wei.liu@email.com', 3);

-- Inserting data into Telephone table
INSERT INTO Telephone (UserID, no_phone) VALUES (101, '0123456789');
INSERT INTO Telephone (UserID, no_phone) VALUES (102, '0112345678');
INSERT INTO Telephone (UserID, no_phone) VALUES (103, '0198765432');
INSERT INTO Telephone (UserID, no_phone) VALUES (104, '0176543210');
INSERT INTO Telephone (UserID, no_phone) VALUES (105, '0167890123');
INSERT INTO Telephone (UserID, no_phone) VALUES (106, '0134567890');
INSERT INTO Telephone (UserID, no_phone) VALUES (107, '0109876543');
INSERT INTO Telephone (UserID, no_phone) VALUES (108, '0145678901');
INSERT INTO Telephone (UserID, no_phone) VALUES (109, '0156789012');
INSERT INTO Telephone (UserID, no_phone) VALUES (110, '0123456782');
INSERT INTO Telephone (UserID, no_phone) VALUES (111, '0112345671');
INSERT INTO Telephone (UserID, no_phone) VALUES (112, '0198765434');
INSERT INTO Telephone (UserID, no_phone) VALUES (113, '0176543230');
INSERT INTO Telephone (UserID, no_phone) VALUES (114, '0167890113');
INSERT INTO Telephone (UserID, no_phone) VALUES (115, '0134567290');
INSERT INTO Telephone (UserID, no_phone) VALUES (116, '0109816543');
INSERT INTO Telephone (UserID, no_phone) VALUES (117, '0125678901');
INSERT INTO Telephone (UserID, no_phone) VALUES (118, '0176789012');
INSERT INTO Telephone (UserID, no_phone) VALUES (119, '0123456783');
INSERT INTO Telephone (UserID, no_phone) VALUES (120, '0112345675');

-- Inserting data into NormalUser table
INSERT INTO NormalUser (UserID)
VALUES (101);

INSERT INTO NormalUser (UserID)
VALUES (103);

INSERT INTO NormalUser (UserID)
VALUES (104);

INSERT INTO NormalUser (UserID)
VALUES (106);

INSERT INTO NormalUser (UserID)
VALUES (107);

INSERT INTO NormalUser (UserID)
VALUES (109);

INSERT INTO NormalUser (UserID)
VALUES (110);

INSERT INTO NormalUser (UserID)
VALUES (112);

INSERT INTO NormalUser (UserID)
VALUES (113);

INSERT INTO NormalUser (UserID)
VALUES (115);

INSERT INTO NormalUser (UserID)
VALUES (116);

INSERT INTO NormalUser (UserID)
VALUES (118);

INSERT INTO NormalUser (UserID)
VALUES (119);

-- Inserting data into Admin table
INSERT INTO Admin (UserID, Role)
VALUES (102, 'Event Admin');

INSERT INTO Admin (UserID, Role)
VALUES (105, 'Technical Admin');

-- Inserting data into EventOrganizer table
INSERT INTO EventOrganizer (UserID, Social_Media)
VALUES (108, 'Facebook'); 

INSERT INTO EventOrganizer (UserID, Social_Media)
VALUES (111, 'Instagram'); 

INSERT INTO EventOrganizer (UserID, Social_Media)
VALUES (114, 'Twitter'); 

INSERT INTO EventOrganizer (UserID, Social_Media)
VALUES (117, 'LinkedIn'); 

INSERT INTO EventOrganizer (UserID, Social_Media)
VALUES (120, 'YouTube'); 

-- Inserting data into Event table
INSERT  ALL
    INTO Event (EventID, UserID, Event_Name, Event_Description, Event_Location, Event_Type, Number_Audience, Is_Approve) VALUES (201, 101, 'Health and Wellness Seminar', 'Educational seminar on maintaining a healthy lifestyle.', 'Penang Medical Center', 'Health', 200, 'y')
    INTO Event (EventID, UserID, Event_Name, Event_Description, Event_Location, Event_Type, Number_Audience, Is_Approve) VALUES (202, 113, 'Cultural Festival', 'A celebration of diverse cultures through music, dance, and food.', 'Merdeka Square, Kuala Lumpur', 'Cultural', 1000, 'y')
    INTO Event (EventID, UserID, Event_Name, Event_Description, Event_Location, Event_Type, Number_Audience, Is_Approve) VALUES (203, 103, 'Startup Pitch Day', 'Entrepreneurs pitch their innovative startup ideas to potential investors.', 'Cyberjaya Innovation Hub', 'Business', 300, 'y')
    INTO Event (EventID, UserID, Event_Name, Event_Description, Event_Location, Event_Type, Number_Audience, Is_Approve) VALUES (204, 104, 'Art Exhibition', 'Showcasing local and international artists masterpieces.', 'National Art Gallery, Kuala Lumpur', 'Art', 150, 'y')
    INTO Event (EventID, UserID, Event_Name, Event_Description, Event_Location, Event_Type, Number_Audience, Is_Approve) VALUES (205, 107, 'Music Festival', 'Live performances from top local and international artists.', 'Sunway Lagoon, Selangor', 'Music', 800, 'y')
    INTO Event (EventID, UserID, Event_Name, Event_Description, Event_Location, Event_Type, Number_Audience, Is_Approve) VALUES (206, 106, 'Green Living Expo', 'Promoting sustainable living practices and eco-friendly products.', 'Mid Valley Exhibition Center', 'Environment', 400, 'y')
    INTO Event (EventID, UserID, Event_Name, Event_Description, Event_Location, Event_Type, Number_Audience, Is_Approve) VALUES (207, 107, 'Sports Carnival', 'Various sports competitions and activities for all ages.', 'Stadium Negara, Kuala Lumpur', 'Sports', 600, 'n')
    INTO Event (EventID, UserID, Event_Name, Event_Description, Event_Location, Event_Type, Number_Audience, Is_Approve) VALUES (208, 108, 'Food Truck Festival', 'A culinary delight featuring a variety of food trucks and vendors.', 'Dataran Merdeka, Kuala Lumpur', 'Food', 250, 'y')
    INTO Event (EventID, UserID, Event_Name, Event_Description, Event_Location, Event_Type, Number_Audience, Is_Approve) VALUES (209, 109, 'Science Fair', 'Interactive exhibits showcasing scientific advancements and experiments.', 'Petrosains, The Discovery Centre', 'Science', 180, 'n')
    INTO Event (EventID, UserID, Event_Name, Event_Description, Event_Location, Event_Type, Number_Audience, Is_Approve) VALUES (210, 110, 'Fashion Show', 'Showcasing the latest trends in fashion and design.', 'KL Fashion Pavilion', 'Fashion', 350, 'n')
    INTO Event (EventID, UserID, Event_Name, Event_Description, Event_Location, Event_Type, Number_Audience, Is_Approve) VALUES (211, 111, 'Film Festival', 'Screening of independent and international films.', 'Golden Screen Cinemas, Pavilion', 'Film', 200, 'y')
    INTO Event (EventID, UserID, Event_Name, Event_Description, Event_Location, Event_Type, Number_Audience, Is_Approve) VALUES (212, 112, 'Education Expo', 'Explore educational opportunities and career paths.', 'Sunway Pyramid Convention Center', 'Education', 300, 'y')
    INTO Event (EventID, UserID, Event_Name, Event_Description, Event_Location, Event_Type, Number_Audience, Is_Approve) VALUES (213, 113, 'Book Fair', 'A paradise for book lovers with a wide selection of books and literary events.', 'Times Square Mall, Kuala Lumpur', 'Literature', 120, 'y')
    INTO Event (EventID, UserID, Event_Name, Event_Description, Event_Location, Event_Type, Number_Audience, Is_Approve) VALUES (214, 114, 'Technology Conference', 'Bringing together experts to discuss the latest trends in technology.', 'Berjaya Times Square Hotel', 'Technology', 400, 'y')
    INTO Event (EventID, UserID, Event_Name, Event_Description, Event_Location, Event_Type, Number_Audience, Is_Approve) VALUES (215, 115, 'Dance Showcase', 'A mesmerizing showcase of various dance styles.', 'The Star Performing Arts Center', 'Performing Arts', 250, 'n')
    INTO Event (EventID, UserID, Event_Name, Event_Description, Event_Location, Event_Type, Number_Audience, Is_Approve) VALUES (216, 116, 'Gaming Expo', 'Explore the world of gaming with exhibitions and tournaments.', 'Mid Valley Megamall', 'Gaming', 180, 'n')
    INTO Event (EventID, UserID, Event_Name, Event_Description, Event_Location, Event_Type, Number_Audience, Is_Approve) VALUES (217, 117, 'Charity Run', 'A fundraising run for various charitable causes.', 'Lake Gardens, Kuala Lumpur', 'Charity', 500, 'n')
    INTO Event (EventID, UserID, Event_Name, Event_Description, Event_Location, Event_Type, Number_Audience, Is_Approve) VALUES (218, 118, 'Travel Fair', 'Discover exciting travel destinations and deals.', 'KL Convention Center', 'Travel', 300, 'y')
    INTO Event (EventID, UserID, Event_Name, Event_Description, Event_Location, Event_Type, Number_Audience, Is_Approve) VALUES (219, 119, 'Automotive Expo', 'Showcasing the latest trends in the automotive industry.', 'Malaysia International Trade and Exhibition Centre', 'Automotive', 400, 'y')
    INTO Event (EventID, UserID, Event_Name, Event_Description, Event_Location, Event_Type, Number_Audience, Is_Approve) VALUES (220, 120, 'Tech Expo 2024', 'Annual technology exhibition showcasing the latest innovations.', 'KL Convention Center', 'Technology', 500, 'y')
SELECT 1 FROM dual;


-- Inserting data into EventTime table
INSERT  ALL
    INTO EventTime (EventID, Start_Time, End_Time) VALUES (201, TO_TIMESTAMP('2024-02-15 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-02-15 17:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO EventTime (EventID, Start_Time, End_Time) VALUES (202, TO_TIMESTAMP('2024-03-10 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-03-10 15:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO EventTime (EventID, Start_Time, End_Time) VALUES (203, TO_TIMESTAMP('2024-04-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-04-05 22:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO EventTime (EventID, Start_Time, End_Time) VALUES (204, TO_TIMESTAMP('2024-05-20 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-05-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO EventTime (EventID, Start_Time, End_Time) VALUES (205, TO_TIMESTAMP('2024-06-15 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-06-15 20:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO EventTime (EventID, Start_Time, End_Time) VALUES (206, TO_TIMESTAMP('2024-07-08 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-07-09 02:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO EventTime (EventID, Start_Time, End_Time) VALUES (207, TO_TIMESTAMP('2024-08-03 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-03 16:30:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO EventTime (EventID, Start_Time, End_Time) VALUES (208, TO_TIMESTAMP('2024-09-18 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-09-18 17:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO EventTime (EventID, Start_Time, End_Time) VALUES (209, TO_TIMESTAMP('2024-10-12 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-12 21:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO EventTime (EventID, Start_Time, End_Time) VALUES (210, TO_TIMESTAMP('2024-11-05 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-11-05 16:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO EventTime (EventID, Start_Time, End_Time) VALUES (211, TO_TIMESTAMP('2024-12-20 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-20 23:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO EventTime (EventID, Start_Time, End_Time) VALUES (212, TO_TIMESTAMP('2025-01-15 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-15 22:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO EventTime (EventID, Start_Time, End_Time) VALUES (213, TO_TIMESTAMP('2025-02-28 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-02-28 16:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO EventTime (EventID, Start_Time, End_Time) VALUES (214, TO_TIMESTAMP('2025-03-22 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-03-22 19:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO EventTime (EventID, Start_Time, End_Time) VALUES (215, TO_TIMESTAMP('2025-04-10 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-04-10 18:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO EventTime (EventID, Start_Time, End_Time) VALUES (216, TO_TIMESTAMP('2025-05-05 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-05-05 22:30:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO EventTime (EventID, Start_Time, End_Time) VALUES (217, TO_TIMESTAMP('2025-06-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-06-20 20:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO EventTime (EventID, Start_Time, End_Time) VALUES (218, TO_TIMESTAMP('2025-07-15 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-07-15 11:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO EventTime (EventID, Start_Time, End_Time) VALUES (219, TO_TIMESTAMP('2025-08-08 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-08-08 17:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO EventTime (EventID, Start_Time, End_Time) VALUES (220, TO_TIMESTAMP('2025-09-25 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-09-25 16:30:00', 'YYYY-MM-DD HH24:MI:SS'))
SELECT 1 FROM dual;

-- change format view
SELECT EventID, TO_CHAR(Start_Time, 'YYYY-MM-DD HH24:MI:SS') AS Start_Time, TO_CHAR(End_Time, 'YYYY-MM-DD HH24:MI:SS') AS End_Time
FROM EventTime;

-- Inserting data into Feedback table
INSERT ALL
    INTO Feedback (FeedbackID, UserID, EventID, Feedback_Text, Timestamp) VALUES (1, 101, 201, 'Great seminar!', TO_TIMESTAMP('2024-02-15 12:30:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Feedback (FeedbackID, UserID, EventID, Feedback_Text, Timestamp) VALUES (2, 113, 202, 'Amazing cultural experience!', TO_TIMESTAMP('2024-03-10 15:45:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Feedback (FeedbackID, UserID, EventID, Feedback_Text, Timestamp) VALUES (3, 103, 203, 'Innovative startup ideas!', TO_TIMESTAMP('2024-04-05 20:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Feedback (FeedbackID, UserID, EventID, Feedback_Text, Timestamp) VALUES (4, 104, 204, 'Beautiful art pieces!', TO_TIMESTAMP('2024-05-20 16:30:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Feedback (FeedbackID, UserID, EventID, Feedback_Text, Timestamp) VALUES (5, 107, 205, 'Fantastic music performances!', TO_TIMESTAMP('2024-06-15 22:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Feedback (FeedbackID, UserID, EventID, Feedback_Text, Timestamp) VALUES (6, 106, 206, 'Loved the eco-friendly products!', TO_TIMESTAMP('2024-07-08 02:30:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Feedback (FeedbackID, UserID, EventID, Feedback_Text, Timestamp) VALUES (7, 107, 207, 'Great sports carnival!', TO_TIMESTAMP('2024-08-03 11:15:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Feedback (FeedbackID, UserID, EventID, Feedback_Text, Timestamp) VALUES (8, 108, 208, 'Delicious food truck options!', TO_TIMESTAMP('2024-09-18 18:45:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Feedback (FeedbackID, UserID, EventID, Feedback_Text, Timestamp) VALUES (9, 109, 209, 'Impressive science exhibits!', TO_TIMESTAMP('2024-10-12 21:30:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Feedback (FeedbackID, UserID, EventID, Feedback_Text, Timestamp) VALUES (10, 110, 210, 'Fashion show was fantastic!', TO_TIMESTAMP('2024-11-05 16:15:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Feedback (FeedbackID, UserID, EventID, Feedback_Text, Timestamp) VALUES (11, 111, 211, 'Enjoyed the film festival!', TO_TIMESTAMP('2024-12-20 23:45:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Feedback (FeedbackID, UserID, EventID, Feedback_Text, Timestamp) VALUES (12, 112, 212, 'Informative education expo!', TO_TIMESTAMP('2025-01-15 22:30:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Feedback (FeedbackID, UserID, EventID, Feedback_Text, Timestamp) VALUES (13, 113, 213, 'Book fair was a paradise!', TO_TIMESTAMP('2025-02-28 16:45:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Feedback (FeedbackID, UserID, EventID, Feedback_Text, Timestamp) VALUES (14, 114, 214, 'Tech conference was insightful!', TO_TIMESTAMP('2025-03-22 19:30:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Feedback (FeedbackID, UserID, EventID, Feedback_Text, Timestamp) VALUES (15, 115, 215, 'Mesmerizing dance showcase!', TO_TIMESTAMP('2025-04-10 18:15:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Feedback (FeedbackID, UserID, EventID, Feedback_Text, Timestamp) VALUES (16, 116, 216, 'Gaming expo was awesome!', TO_TIMESTAMP('2025-05-05 22:45:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Feedback (FeedbackID, UserID, EventID, Feedback_Text, Timestamp) VALUES (17, 117, 217, 'Charity run for a good cause!', TO_TIMESTAMP('2025-06-20 20:30:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Feedback (FeedbackID, UserID, EventID, Feedback_Text, Timestamp) VALUES (18, 118, 218, 'Exciting travel fair!', TO_TIMESTAMP('2025-07-15 11:30:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Feedback (FeedbackID, UserID, EventID, Feedback_Text, Timestamp) VALUES (19, 119, 219, 'Latest trends in automotive!', TO_TIMESTAMP('2025-08-08 17:15:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Feedback (FeedbackID, UserID, EventID, Feedback_Text, Timestamp) VALUES (20, 120, 220, 'Impressive tech innovations!', TO_TIMESTAMP('2025-09-25 16:45:00', 'YYYY-MM-DD HH24:MI:SS'))
SELECT 1 FROM dual;

-- Inserting data into PaymentMethod table
INSERT ALL
    INTO PaymentMethod (MethodID, Payment_Method) VALUES (1, 'Credit Card')
    INTO PaymentMethod (MethodID, Payment_Method) VALUES (2, 'Debit Card')
    INTO PaymentMethod (MethodID, Payment_Method) VALUES (3, 'PayPal')
    INTO PaymentMethod (MethodID, Payment_Method) VALUES (4, 'FPX')
SELECT 1 FROM dual;

-- Inserting data into Payment table
INSERT ALL
    INTO Payment (PaymentID, UserID, MethodID, Amount, Timestamp) VALUES (1, 101, 1, 50.00, TO_TIMESTAMP('2024-02-10 13:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Payment (PaymentID, UserID, MethodID, Amount, Timestamp) VALUES (2, 113, 2, 75.00, TO_TIMESTAMP('2024-03-01 14:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Payment (PaymentID, UserID, MethodID, Amount, Timestamp) VALUES (3, 103, 3, 100.00, TO_TIMESTAMP('2024-04-01 19:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Payment (PaymentID, UserID, MethodID, Amount, Timestamp) VALUES (4, 104, 4, 60.00, TO_TIMESTAMP('2024-04-20 15:30:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Payment (PaymentID, UserID, MethodID, Amount, Timestamp) VALUES (5, 107, 4, 120.00, TO_TIMESTAMP('2024-05-15 21:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Payment (PaymentID, UserID, MethodID, Amount, Timestamp) VALUES (6, 106, 2, 40.00, TO_TIMESTAMP('2024-06-08 03:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Payment (PaymentID, UserID, MethodID, Amount, Timestamp) VALUES (7, 107, 1, 90.00, TO_TIMESTAMP('2024-06-03 12:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Payment (PaymentID, UserID, MethodID, Amount, Timestamp) VALUES (8, 108, 1, 80.00, TO_TIMESTAMP('2024-06-18 19:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Payment (PaymentID, UserID, MethodID, Amount, Timestamp) VALUES (9, 109, 2, 55.00, TO_TIMESTAMP('2024-09-12 22:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Payment (PaymentID, UserID, MethodID, Amount, Timestamp) VALUES (10, 110, 3, 70.00, TO_TIMESTAMP('2024-02-05 17:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Payment (PaymentID, UserID, MethodID, Amount, Timestamp) VALUES (11, 111, 4, 65.00, TO_TIMESTAMP('2024-02-20 22:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Payment (PaymentID, UserID, MethodID, Amount, Timestamp) VALUES (12, 112, 4, 110.00, TO_TIMESTAMP('2025-01-01 23:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Payment (PaymentID, UserID, MethodID, Amount, Timestamp) VALUES (13, 113, 4, 45.00, TO_TIMESTAMP('2025-01-28 17:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Payment (PaymentID, UserID, MethodID, Amount, Timestamp) VALUES (14, 114, 4, 95.00, TO_TIMESTAMP('2025-02-22 20:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Payment (PaymentID, UserID, MethodID, Amount, Timestamp) VALUES (15, 115, 1, 85.00, TO_TIMESTAMP('2025-02-10 19:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Payment (PaymentID, UserID, MethodID, Amount, Timestamp) VALUES (16, 116, 2, 50.00, TO_TIMESTAMP('2025-03-05 23:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Payment (PaymentID, UserID, MethodID, Amount, Timestamp) VALUES (17, 117, 3, 30.00, TO_TIMESTAMP('2025-05-20 21:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Payment (PaymentID, UserID, MethodID, Amount, Timestamp) VALUES (18, 118, 4, 75.00, TO_TIMESTAMP('2025-06-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Payment (PaymentID, UserID, MethodID, Amount, Timestamp) VALUES (19, 119, 4, 40.00, TO_TIMESTAMP('2025-05-08 18:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Payment (PaymentID, UserID, MethodID, Amount, Timestamp) VALUES (20, 120, 4, 60.00, TO_TIMESTAMP('2025-03-25 17:00:00', 'YYYY-MM-DD HH24:MI:SS'))
SELECT 1 FROM dual;

-- Inserting data into TicketType table
INSERT ALL
    INTO TicketType (Ticket_TypeID, Ticket_Type) VALUES (1, 'Early Bird')
    INTO TicketType (Ticket_TypeID, Ticket_Type) VALUES (2, 'Normal')
    INTO TicketType (Ticket_TypeID, Ticket_Type) VALUES (3, 'VIP')
SELECT 1 FROM dual;

-- Inserting data into Ticket table
INSERT ALL 
    INTO Ticket (TicketID, UserID, PaymentID, EventID, Ticket_TypeID, Price, Date_of_Purchase) VALUES (1, 101, 1, 201, 1, 50.00, TO_DATE('2024-02-10 13:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Ticket (TicketID, UserID, PaymentID, EventID, Ticket_TypeID, Price, Date_of_Purchase) VALUES (2, 113, 2, 202, 2, 75.00, TO_DATE('2024-03-01 14:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Ticket (TicketID, UserID, PaymentID, EventID, Ticket_TypeID, Price, Date_of_Purchase) VALUES (3, 103, 3, 203, 3, 100.00, TO_DATE('2024-04-01 19:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Ticket (TicketID, UserID, PaymentID, EventID, Ticket_TypeID, Price, Date_of_Purchase) VALUES (4, 104, 4, 204, 1, 60.00, TO_DATE('2024-04-20 15:30:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Ticket (TicketID, UserID, PaymentID, EventID, Ticket_TypeID, Price, Date_of_Purchase) VALUES (5, 107, 5, 205, 2, 120.00, TO_DATE('2024-05-15 21:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Ticket (TicketID, UserID, PaymentID, EventID, Ticket_TypeID, Price, Date_of_Purchase) VALUES (6, 106, 6, 206, 3, 40.00, TO_DATE('2024-06-08 03:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Ticket (TicketID, UserID, PaymentID, EventID, Ticket_TypeID, Price, Date_of_Purchase) VALUES (7, 107, 7, 207, 1, 90.00, TO_DATE('2024-06-03 12:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Ticket (TicketID, UserID, PaymentID, EventID, Ticket_TypeID, Price, Date_of_Purchase) VALUES (8, 108, 8, 208, 2, 80.00, TO_DATE('2024-06-18 19:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Ticket (TicketID, UserID, PaymentID, EventID, Ticket_TypeID, Price, Date_of_Purchase) VALUES (9, 109, 9, 209, 3, 55.00, TO_DATE('2024-09-12 22:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Ticket (TicketID, UserID, PaymentID, EventID, Ticket_TypeID, Price, Date_of_Purchase) VALUES (10, 110, 10, 210, 1, 70.00, TO_DATE('2024-05-02 17:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Ticket (TicketID, UserID, PaymentID, EventID, Ticket_TypeID, Price, Date_of_Purchase) VALUES (11, 111, 11, 211, 2, 65.00, TO_DATE('2024-02-20 22:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Ticket (TicketID, UserID, PaymentID, EventID, Ticket_TypeID, Price, Date_of_Purchase) VALUES (12, 112, 12, 212, 3, 110.00, TO_DATE('2025-01-01 23:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Ticket (TicketID, UserID, PaymentID, EventID, Ticket_TypeID, Price, Date_of_Purchase) VALUES (13, 113, 13, 213, 1, 45.00, TO_DATE('2025-01-28 17:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Ticket (TicketID, UserID, PaymentID, EventID, Ticket_TypeID, Price, Date_of_Purchase) VALUES (14, 114, 14, 214, 2, 95.00, TO_DATE('2025-02-22 20:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Ticket (TicketID, UserID, PaymentID, EventID, Ticket_TypeID, Price, Date_of_Purchase) VALUES (15, 115, 15, 215, 3, 85.00, TO_DATE('2025-02-10 19:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Ticket (TicketID, UserID, PaymentID, EventID, Ticket_TypeID, Price, Date_of_Purchase) VALUES (16, 116, 16, 216, 1, 50.00, TO_DATE('2025-03-05 23:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Ticket (TicketID, UserID, PaymentID, EventID, Ticket_TypeID, Price, Date_of_Purchase) VALUES (17, 117, 17, 217, 2, 30.00, TO_DATE('2025-05-20 21:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Ticket (TicketID, UserID, PaymentID, EventID, Ticket_TypeID, Price, Date_of_Purchase) VALUES (18, 118, 18, 218, 3, 75.00, TO_DATE('2025-06-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Ticket (TicketID, UserID, PaymentID, EventID, Ticket_TypeID, Price, Date_of_Purchase) VALUES (19, 119, 19, 219, 1, 40.00, TO_DATE('2025-05-08 18:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Ticket (TicketID, UserID, PaymentID, EventID, Ticket_TypeID, Price, Date_of_Purchase) VALUES (20, 120, 20, 220, 2, 60.00, TO_DATE('2025-03-25 17:00:00', 'YYYY-MM-DD HH24:MI:SS'))
SELECT 1 FROM dual;

-- Inserting data into Report table
INSERT ALL
    INTO Report (ReportID, EventID, UserID, ReportTitle, ReportData, Timestamp) VALUES (1, 201, 101, 'Health and Wellness Seminar Report', TO_CLOB('Report content for Health and Wellness Seminar.'), CURRENT_TIMESTAMP)
    INTO Report (ReportID, EventID, UserID, ReportTitle, ReportData, Timestamp) VALUES (2, 202, 113, 'Cultural Festival Report', TO_CLOB('Report content for Cultural Festival.'), CURRENT_TIMESTAMP)
    INTO Report (ReportID, EventID, UserID, ReportTitle, ReportData, Timestamp) VALUES (3, 203, 103, 'Startup Pitch Day Report', TO_CLOB('Report content for Startup Pitch Day.'), CURRENT_TIMESTAMP)
    INTO Report (ReportID, EventID, UserID, ReportTitle, ReportData, Timestamp) VALUES (4, 204, 104, 'Art Exhibition Report', TO_CLOB('Report content for Art Exhibition.'), CURRENT_TIMESTAMP)
    INTO Report (ReportID, EventID, UserID, ReportTitle, ReportData, Timestamp) VALUES (5, 205, 107, 'Music Festival Report', TO_CLOB('Report content for Music Festival.'), CURRENT_TIMESTAMP)
    INTO Report (ReportID, EventID, UserID, ReportTitle, ReportData, Timestamp) VALUES (6, 206, 106, 'Green Living Expo Report', TO_CLOB('Report content for Green Living Expo.'), CURRENT_TIMESTAMP)
    INTO Report (ReportID, EventID, UserID, ReportTitle, ReportData, Timestamp) VALUES (7, 208, 108, 'Food Truck Festival Report', TO_CLOB('Report content for Food Truck Festival.'), CURRENT_TIMESTAMP)
    INTO Report (ReportID, EventID, UserID, ReportTitle, ReportData, Timestamp) VALUES (8, 211, 111, 'Film Festival Report', TO_CLOB('Report content for Film Festival.'), CURRENT_TIMESTAMP)
    INTO Report (ReportID, EventID, UserID, ReportTitle, ReportData, Timestamp) VALUES (9, 212, 112, 'Education Expo Report', TO_CLOB('Report content for Education Expo.'), CURRENT_TIMESTAMP)
    INTO Report (ReportID, EventID, UserID, ReportTitle, ReportData, Timestamp) VALUES (10, 213, 113, 'Book Fair Report', TO_CLOB('Report content for Book Fair.'), CURRENT_TIMESTAMP)
    INTO Report (ReportID, EventID, UserID, ReportTitle, ReportData, Timestamp) VALUES (11, 214, 114, 'Technology Conference Report', TO_CLOB('Report content for Technology Conference.'), CURRENT_TIMESTAMP)
    INTO Report (ReportID, EventID, UserID, ReportTitle, ReportData, Timestamp) VALUES (12, 218, 118, 'Travel Fair Report', TO_CLOB('Report content for Travel Fair.'), CURRENT_TIMESTAMP)
    INTO Report (ReportID, EventID, UserID, ReportTitle, ReportData, Timestamp) VALUES (13, 219, 119, 'Automotive Expo Report', TO_CLOB('Report content for Automotive Expo.'), CURRENT_TIMESTAMP)
    INTO Report (ReportID, EventID, UserID, ReportTitle, ReportData, Timestamp) VALUES (14, 220, 120, 'Tech Expo 2024 Report', TO_CLOB('Report content for Tech Expo 2024.'), CURRENT_TIMESTAMP)
SELECT 1 FROM dual;

