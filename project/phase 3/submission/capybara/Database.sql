CREATE TABLE EVENT(
    eventID VARCHAR2(15),
    name    VARCHAR2(100) NOT NULL,
    location VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    category VARCHAR2(100) NOT NULL,
    isPaid VARCHAR2(1) NOT NULL,
    organizationID VARCHAR2(15) NOT NULL,
    personInCharge VARCHAR2(100) NOT NULL,
    CONSTRAINT eventID_pk PRIMARY KEY (eventID)
);

CREATE TABLE PAYMENT(
    paymentID VARCHAR2(15),
    payment_type VARCHAR2(15) NOT NULL,
    verificationID VARCHAR2(15) NOT NULL,
    participantID VARCHAR2(15) NOT NULL,
    eventID VARCHAR2(15) NOT NULL, 
    CONSTRAINT paymentID_pk PRIMARY KEY (paymentID)
);

CREATE TABLE BOOKING(
    verificationID VARCHAR2(15) NOT NULL,
    bookingDate DATE NOT NULL,
    participantID VARCHAR2(15) NOT NULL,
    eventID VARCHAR2(15) NOT NULL,
    CONSTRAINT verificationID_pk PRIMARY KEY (verificationID)
);

CREATE TABLE ORGANIZER(
    organizerID VARCHAR2(15) NOT NULL,
    organizerName VARCHAR2(100) NOT NULL,
    organizerEmail VARCHAR2(100) NOT NULL,
    organizerTelPhone VARCHAR2(12) NOT NULL,
    CONSTRAINT organizerID_pk PRIMARY KEY (organizerID)
);

CREATE TABLE PARTICIPANT(
    participantID VARCHAR2(15) NOT NULL,
    participantName VARCHAR2(100) NOT NULL,
    participantEmail VARCHAR2(100) NOT NULL,
    participantTelPhone VARCHAR2(15) NOT NULL,
    CONSTRAINT participantID_pk PRIMARY KEY (participantID)
);

CREATE TABLE CALENDAR(
    calendarID VARCHAR2(15) NOT NULL,
    startingDate DATE NOT NULL,
    eventID VARCHAR2(15) NOT NULL,
    CONSTRAINT calendarID_pk PRIMARY KEY (calendarID)
);

CREATE TABLE UPCOMING_EVENT(
    calendarID VARCHAR2(15) NOT NULL,
    eventID VARCHAR2(15) NOT NULL,
    startingDate DATE NOT NULL
);

CREATE TABLE PAST_EVENT(
    calendarID VARCHAR2(15) NOT NULL,
    eventID VARCHAR2(15) NOT NULL,
    startingDate DATE NOT NULL
);

-- Here lies constraint foreign key -- 

-- Payment

ALTER TABLE PAYMENT
ADD CONSTRAINT verificationID_fk2 FOREIGN KEY (verificationID) REFERENCES BOOKING;

ALTER TABLE PAYMENT
ADD CONSTRAINT participantID_fk FOREIGN KEY (participantID) REFERENCES PARTICIPANT;

ALTER TABLE PAYMENT
ADD CONSTRAINT eventID_fk2 FOREIGN KEY (eventID) REFERENCES EVENT;

-- Booking

ALTER TABLE BOOKING
ADD CONSTRAINT participantID_fk2 FOREIGN KEY (participantID) REFERENCES PARTICIPANT;

ALTER TABLE BOOKING
ADD CONSTRAINT eventID_fk FOREIGN KEY (eventID) REFERENCES EVENT;

-- Event

ALTER TABLE EVENT
ADD CONSTRAINT organizationID_fk FOREIGN KEY (organizationID) REFERENCES ORGANIZER;

-- Calendar

ALTER TABLE CALENDAR
ADD CONSTRAINT eventID_fk3 FOREIGN KEY (eventID) REFERENCES EVENT;

-- Upcoming Event

ALTER TABLE UPCOMING_EVENT
ADD CONSTRAINT eventID_fk4 FOREIGN KEY (eventID) REFERENCES EVENT;

-- Past Event

ALTER TABLE PAST_EVENT
ADD CONSTRAINT eventID_fk5 FOREIGN KEY (eventID) REFERENCES EVENT;

-- Here lies Adding Ton of Data

INSERT INTO PARTICIPANT VALUES ('P001', 'John Doe', 'john.doe@example.com', '123-456-7890'); 
INSERT INTO PARTICIPANT VALUES ('P002', 'Jane Smith', 'jane.smith@example.com', '987-654-3210');
INSERT INTO PARTICIPANT VALUES ('P003', 'Bob Johnson', 'bob.johnson@example.com', '111-222-3333');
INSERT INTO PARTICIPANT VALUES ('P004', 'Alice Brown', 'alice.brown@example.com', '444-555-6666');
INSERT INTO PARTICIPANT VALUES ('P005', 'Charlie White', 'charlie.white@example.com', '777-888-9999');
INSERT INTO PARTICIPANT VALUES ('P006', 'Eva Davis', 'eva.davis@example.com', '333-444-5555');
INSERT INTO PARTICIPANT VALUES ('P007', 'Frank Miller', 'frank.miller@example.com', '666-777-8888');
INSERT INTO PARTICIPANT VALUES ('P008', 'Grace Wilson', 'grace.wilson@example.com', '222-333-4444');
INSERT INTO PARTICIPANT VALUES ('P009', 'Henry Lee', 'henry.lee@example.com', '999-000-1111');
INSERT INTO PARTICIPANT VALUES ('P010', 'Ivy Taylor', 'ivy.taylor@example.com', '555-666-7777');
INSERT INTO PARTICIPANT VALUES ('P011', 'Jack Robinson', 'jack.robinson@example.com', '888-999-0000');
INSERT INTO PARTICIPANT VALUES ('P012', 'Kelly Turner', 'kelly.turner@example.com', '444-555-6666');
INSERT INTO PARTICIPANT VALUES ('P013', 'Leo Harris', 'leo.harris@example.com', '111-222-3333');
INSERT INTO PARTICIPANT VALUES ('P014', 'Mia Garcia', 'mia.garcia@example.com', '777-888-9999');
INSERT INTO PARTICIPANT VALUES ('P015', 'Nora Evans', 'nora.evans@example.com', '123-456-7890');
INSERT INTO PARTICIPANT VALUES ('P016', 'Oscar Wright', 'oscar.wright@example.com', '987-654-3210');
INSERT INTO PARTICIPANT VALUES ('P017', 'Pamela Adams', 'pamela.adams@example.com', '111-222-3333');
INSERT INTO PARTICIPANT VALUES ('P018', 'Quincy Green', 'quincy.green@example.com', '555-666-7777');
INSERT INTO PARTICIPANT VALUES ('P019', 'Rachel Hall', 'rachel.hall@example.com', '777-888-9999');
INSERT INTO PARTICIPANT VALUES ('P020', 'Samuel Lewis', 'samuel.lewis@example.com', '222-333-4444');

INSERT INTO ORGANIZER VALUES ('ORG001', 'ABC Events', 'abc.events@example.com', '123-456-7890');
INSERT INTO ORGANIZER VALUES ('ORG002', 'XYZ Productions', 'xyz.productions@example.com', '987-654-3210');
INSERT INTO ORGANIZER VALUES ('ORG003', 'EventCo Enterprises', 'eventco@example.com', '555-123-4567');
INSERT INTO ORGANIZER VALUES ('ORG004', 'Dream Events', 'dream.events@example.com', '111-222-3333');
INSERT INTO ORGANIZER VALUES ('ORG005', 'Elite Planners', 'elite.planners@example.com', '444-555-6666');
INSERT INTO ORGANIZER VALUES ('ORG006', 'City Celebrations', 'city.celebrations@example.com', '777-888-9999');
INSERT INTO ORGANIZER VALUES ('ORG007', 'Gala Creations', 'gala.creations@example.com', '999-888-7777');
INSERT INTO ORGANIZER VALUES ('ORG008', 'Star Productions', 'star.productions@example.com', '333-222-1111');
INSERT INTO ORGANIZER VALUES ('ORG009', 'Epic Events', 'epic.events@example.com', '666-555-4444');
INSERT INTO ORGANIZER VALUES ('ORG010', 'Global Celebrations', 'global.celebrations@example.com', '000-999-8888');
INSERT INTO ORGANIZER VALUES ('ORG011', 'Royal Gatherings', 'royal.gatherings@example.com', '222-333-4444');
INSERT INTO ORGANIZER VALUES ('ORG012', 'Creative Minds Events', 'creative.minds@example.com', '777-666-555;');
INSERT INTO ORGANIZER VALUES ('ORG013', 'Grand Affairs', 'grand.affairs@example.com', '444-333-2222');
INSERT INTO ORGANIZER VALUES ('ORG014', 'Majestic Events', 'majestic.events@example.com', '111-000-9999');
INSERT INTO ORGANIZER VALUES ('ORG015', 'Elegance Productions', 'elegance.productions@example.com', '888-777-6666');
INSERT INTO ORGANIZER VALUES ('ORG016', 'Premier Planners', 'premier.planners@example.com', '555-444-3333');
INSERT INTO ORGANIZER VALUES ('ORG017', 'Harmony Events', 'harmony.events@example.com', '222-111-0000');
INSERT INTO ORGANIZER VALUES ('ORG018', 'Prestige Productions', 'prestige.productions@example.com', '999-888-7777');
INSERT INTO ORGANIZER VALUES ('ORG019', 'Chic Celebrations', 'chic.celebrations@example.com', '666-555-4444');
INSERT INTO ORGANIZER VALUES ('ORG020', 'Signature Events', 'signature.events@example.com', '333-222-1111');

INSERT INTO CALENDAR VALUES ('CAL001', TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'EVT001');
INSERT INTO CALENDAR VALUES ('CAL002', TO_DATE('2024-02-20', 'YYYY-MM-DD'), 'EVT002');
INSERT INTO CALENDAR VALUES ('CAL003', TO_DATE('2024-03-10', 'YYYY-MM-DD'), 'EVT003');
INSERT INTO CALENDAR VALUES ('CAL004', TO_DATE('2024-04-05', 'YYYY-MM-DD'), 'EVT004');
INSERT INTO CALENDAR VALUES ('CAL005', TO_DATE('2024-05-15', 'YYYY-MM-DD'), 'EVT005');
INSERT INTO CALENDAR VALUES ('CAL006', TO_DATE('2024-06-08', 'YYYY-MM-DD'), 'EVT006');
INSERT INTO CALENDAR VALUES ('CAL007', TO_DATE('2024-07-20', 'YYYY-MM-DD'), 'EVT007');
INSERT INTO CALENDAR VALUES ('CAL008', TO_DATE('2024-08-12', 'YYYY-MM-DD'), 'EVT008');
INSERT INTO CALENDAR VALUES ('CAL009', TO_DATE('2024-09-25', 'YYYY-MM-DD'), 'EVT009');
INSERT INTO CALENDAR VALUES ('CAL010', TO_DATE('2024-10-18', 'YYYY-MM-DD'), 'EVT010');
INSERT INTO CALENDAR VALUES ('CAL011', TO_DATE('2024-11-08', 'YYYY-MM-DD'), 'EVT011');
INSERT INTO CALENDAR VALUES ('CAL012', TO_DATE('2024-12-01', 'YYYY-MM-DD'), 'EVT012');
INSERT INTO CALENDAR VALUES ('CAL013', TO_DATE('2024-12-20', 'YYYY-MM-DD'), 'EVT013');
INSERT INTO CALENDAR VALUES ('CAL014', TO_DATE('2025-01-15', 'YYYY-MM-DD'), 'EVT014');
INSERT INTO CALENDAR VALUES ('CAL015', TO_DATE('2025-02-10', 'YYYY-MM-DD'), 'EVT015');
INSERT INTO CALENDAR VALUES ('CAL016', TO_DATE('2025-03-05', 'YYYY-MM-DD'), 'EVT016');
INSERT INTO CALENDAR VALUES ('CAL017', TO_DATE('2025-04-18', 'YYYY-MM-DD'), 'EVT017');
INSERT INTO CALENDAR VALUES ('CAL018', TO_DATE('2025-05-20', 'YYYY-MM-DD'), 'EVT018');
INSERT INTO CALENDAR VALUES ('CAL019', TO_DATE('2025-06-08', 'YYYY-MM-DD'), 'EVT019');
INSERT INTO CALENDAR VALUES ('CAL020', TO_DATE('2025-07-15', 'YYYY-MM-DD'), 'EVT020');

INSERT INTO EVENT VALUES ('EVT001', 'Summer Gala', 'Grand Ballroom', 'summer.gala@example.com', 'Social', 'Y', 'ORG001', 'Alex Anderson');
INSERT INTO EVENT VALUES ('EVT002', 'Tech Conference 2024', 'Convention Center', 'tech.conference@example.com', 'Technology', 'N', 'ORG002', 'Bella Clark');
INSERT INTO EVENT VALUES ('EVT003', 'Art Exhibition', 'City Art Gallery', 'art.exhibition@example.com', 'Arts', 'Y', 'ORG003', 'Carter Davis');
INSERT INTO EVENT VALUES ('EVT004', 'Corporate Retreat', 'Luxury Resort', 'corporate.retreat@example.com', 'Business', 'N', 'ORG004', 'Diana Edwards');
INSERT INTO EVENT VALUES ('EVT005', 'Music Festival', 'Outdoor Stadium', 'music.festival@example.com', 'Entertainment', 'Y', 'ORG005', 'Ethan Foster');
INSERT INTO EVENT VALUES ('EVT006', 'Health and Wellness Expo', 'Exhibition Hall', 'wellness.expo@example.com', 'Health', 'N', 'ORG006', 'Fiona Garcia');
INSERT INTO EVENT VALUES ('EVT007', 'Fashion Show', 'Fashion Center', 'fashion.show@example.com', 'Fashion', 'Y', 'ORG007', 'George Harris');
INSERT INTO EVENT VALUES ('EVT008', 'Community Fair', 'Local Park', 'community.fair@example.com', 'Community', 'N', 'ORG008', 'Hannah Ingram');
INSERT INTO EVENT VALUES ('EVT009', 'Sports Championship', 'Sports Arena', 'sports.championship@example.com', 'Sports', 'Y', 'ORG009', 'Isaac Johnson');
INSERT INTO EVENT VALUES ('EVT010', 'Wedding Celebration', 'Luxury Hotel', 'wedding.celebration@example.com', 'Wedding', 'N', 'ORG010', 'Jasmine Kim');
INSERT INTO EVENT VALUES ('EVT011', 'Food and Wine Tasting', 'Vineyard', 'food.wine@example.com', 'Culinary', 'Y', 'ORG011', 'Kevin Lopez');
INSERT INTO EVENT VALUES ('EVT012', 'Technology Expo', 'Exhibition Center', 'tech.expo@example.com', 'Technology', 'N', 'ORG012', 'Lily Morgan');
INSERT INTO EVENT VALUES ('EVT013', 'Film Festival', 'Movie Theater', 'film.festival@example.com', 'Entertainment', 'Y', 'ORG013', 'Max Nelson');
INSERT INTO EVENT VALUES ('EVT014', 'Educational Summit', 'University Auditorium', 'education.summit@example.com', 'Education', 'N', 'ORG014', 'Nina Oliver');
INSERT INTO EVENT VALUES ('EVT015', 'Charity Auction', 'Event Hall', 'charity.auction@example.com', 'Charity', 'Y', 'ORG015', 'Owen Parker');
INSERT INTO EVENT VALUES ('EVT016', 'Holiday Celebration', 'Community Center', 'holiday.celebration@example.com', 'Holiday', 'N', 'ORG016', 'Penny Quinn');
INSERT INTO EVENT VALUES ('EVT017', 'Science Fair', 'Science Museum', 'science.fair@example.com', 'Science', 'Y', 'ORG017', 'Quinn Rivera');
INSERT INTO EVENT VALUES ('EVT018', 'Gaming Convention', 'Convention Center', 'gaming.convention@example.com', 'Gaming', 'N', 'ORG018', 'Ryan Silva');
INSERT INTO EVENT VALUES ('EVT019', 'Auto Show', 'Convention Center', 'auto.show@example.com', 'Automotive', 'Y', 'ORG019', 'Samantha Turner');
INSERT INTO EVENT VALUES ('EVT020', 'Dance Performance', 'Dance Theater', 'dance.performance@example.com', 'Arts', 'N', 'ORG020', 'Tyler Walker');

-- Here lies going booking an event

-- Free Event
-- Lets say user with the id 'P001' until 'P009' registered for event with id 'EVT002'
-- Their verification id will be automatically generated
INSERT INTO BOOKING VALUES (DBMS_RANDOM.STRING('L', 15), SYSDATE,'P001','EVT002');
INSERT INTO BOOKING VALUES (DBMS_RANDOM.STRING('L', 15), SYSDATE,'P002','EVT002');
INSERT INTO BOOKING VALUES (DBMS_RANDOM.STRING('L', 15), SYSDATE,'P003','EVT002');
INSERT INTO BOOKING VALUES (DBMS_RANDOM.STRING('L', 15), SYSDATE,'P004','EVT002');
INSERT INTO BOOKING VALUES (DBMS_RANDOM.STRING('L', 15), SYSDATE,'P005','EVT002');
INSERT INTO BOOKING VALUES (DBMS_RANDOM.STRING('L', 15), SYSDATE,'P006','EVT002');
INSERT INTO BOOKING VALUES (DBMS_RANDOM.STRING('L', 15), SYSDATE,'P007','EVT002');
INSERT INTO BOOKING VALUES (DBMS_RANDOM.STRING('L', 15), SYSDATE,'P008','EVT002');
INSERT INTO BOOKING VALUES (DBMS_RANDOM.STRING('L', 15), SYSDATE,'P009','EVT002');

-- Paid Event
-- Lets say user with the id 'P001' registered for event with id 'EVT001'
-- Their verification id will be automatically generated
INSERT INTO BOOKING VALUES ('abecipqggkutwtu', SYSDATE,'P001','EVT001'); -- generated verification id abecipqggkutwtu

-- Pay Using Online Banking
INSERT INTO PAYMENT VALUES ('PYT001', 'Online Banking', 'abecipqggkutwtu', 'P001', 'EVT001');

-- Here lies user P001 refund money for event EVT001
DELETE FROM PAYMENT WHERE participantID='P001' AND eventID='EVT001' AND verificationID='abecipqggkutwtu';
DELETE FROM BOOKING WHERE participantID='P001' AND verificationID='abecipqggkutwtu';

-- Here lies organizer create a new event
-- Add one more calendarID
INSERT INTO EVENT VALUES ('EVT021', 'Defcon', 'Computer Science Lab', 'deflcon.performance@example.com', 'Cyber Security', 'N', 'ORG020', 'Megat');
INSERT INTO CALENDAR VALUES ('CAL021', TO_DATE('2025-07-18', 'YYYY-MM-DD'), 'EVT021');

-- Here lies finding out the trending event analyzation
SELECT
    E.category,
    COUNT(B.eventID) AS booking_count
FROM
    EVENT E
LEFT JOIN
    BOOKING B ON E.eventID = B.eventID
GROUP BY
    E.category;

-- Here lies finding out the top 10 active students
SELECT
    P.participantName,
    COUNT(B.participantID) AS booking_count
FROM
    PARTICIPANT P
JOIN
    BOOKING B ON P.participantID = B.participantID
GROUP BY
    P.participantName
ORDER BY
    booking_count DESC
FETCH FIRST 10 ROWS ONLY;

-- Here lies finding out the organizer of event
SELECT
    O.organizerName,
    E.eventID,
    E.name AS eventName,
    E.location,
    E.category,
    E.isPaid
FROM
    ORGANIZER O
JOIN
    EVENT E ON O.organizerID = E.organizationID
ORDER BY
    O.organizerName, E.eventID;


-- Here lies the most profitable event
INSERT INTO BOOKING VALUES ('abecipqggkutwtz', SYSDATE,'P002','EVT001'); -- generated verification id abecipqggkutwtz
INSERT INTO PAYMENT VALUES ('PYT002', 'Online Banking', 'abecipqggkutwtz', 'P002', 'EVT001');

INSERT INTO BOOKING VALUES ('abecipqggkutwtp', SYSDATE,'P003','EVT001'); -- generated verification id abecipqggkutwtp
INSERT INTO PAYMENT VALUES ('PYT003', 'Online Banking', 'abecipqggkutwtp', 'P003', 'EVT001');

INSERT INTO BOOKING VALUES ('abecipqggkutwto', SYSDATE,'P004','EVT001'); -- generated verification id abecipqggkutwto
INSERT INTO PAYMENT VALUES ('PYT004', 'Online Banking', 'abecipqggkutwto', 'P004', 'EVT001');

SELECT
    E.eventID,
    E.name AS eventName,
    E.category,
    COUNT(B.participantID) AS participantsCount
FROM
    EVENT E
JOIN
    BOOKING B ON E.eventID = B.eventID
WHERE
    E.isPaid = 'Y'
GROUP BY
    E.eventID, E.name, E.category
ORDER BY
    participantsCount DESC
FETCH FIRST 1 ROWS ONLY;



-- Populate UPCOMING_EVENT and PAST_EVENT tables based on the startingDate

INSERT INTO UPCOMING_EVENT (calendarID, eventID, startingDate)
SELECT c.calendarID, e.eventID, c.startingDate
FROM CALENDAR c
JOIN EVENT e ON c.eventID = e.eventID
WHERE c.startingDate > TO_DATE('2024-01-15', 'YYYY-MM-DD');

INSERT INTO PAST_EVENT (calendarID, eventID, startingDate)
SELECT c.calendarID, e.eventID, c.startingDate
FROM CALENDAR c
JOIN EVENT e ON c.eventID = e.eventID
WHERE c.startingDate <= TO_DATE('2024-01-15', 'YYYY-MM-DD');

