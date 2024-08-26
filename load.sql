/*
The FullDataset table has been created and loaded with data from a comprehensive CSV file.
This dataset serves as a consolidated source for all data needed to populate the database tables.
Below, we use this dataset to fill the AgentDetails, HotelDetails, CustomerDetails, RoomDetails,
ReservationDetails, and BookingDetails tables. Each INSERT INTO operation extracts distinct and 
relevant fields from the FullDataset, linking data across tables based on matching criteria to ensure 
integrity and coherence throughout the database.
*/

-- Populate AgentDetails table
INSERT INTO AgentDetails (agent_id, company_id)
SELECT DISTINCT agent_id, company_id FROM FullDataset;

-- Populate HotelDetails table
INSERT INTO HotelDetails (hotel_type, country, city)
SELECT DISTINCT hotel_type, country, city FROM FullDataset;

-- Populate CustomerDetails table
INSERT INTO CustomerDetails (adults, children, babies, customer_classification)
SELECT adults, children, babies, customer_classification FROM FullDataset;

-- Populate RoomDetails table
INSERT INTO RoomDetails (room_type)
SELECT DISTINCT room_type FROM FullDataset;

-- Populate ReservationDetails table
INSERT INTO ReservationDetails (room_id, reservation_status, reservation_status_date)
SELECT rd.room_id, fd.reservation_status, fd.reservation_status_date 
FROM FullDataset fd
JOIN RoomDetails rd ON fd.room_type = rd.room_type;

-- Populate BookingDetails table
INSERT INTO BookingDetails (hotel_id, agent_id, room_id, stays_in_weekend_nights, stays_in_week_nights, required_car_parking_spaces, arrival_date_month, arrival_date_day, arrival_date_year, price, lead_time, deposit_type, waiting_list)
SELECT 
    h.hotel_id,
    a.agent_id,
    rd.room_id,
    fd.stays_in_weekend_nights,
    fd.stays_in_week_nights,
    fd.required_car_parking_spaces,
    fd.arrival_date_month,
    fd.arrival_date_day_of_month,
    fd.arrival_date_year,
    fd.price,
    fd.lead_time,
    fd.deposit_type,
    fd.days_in_waiting_list
FROM 
    FullDataset fd
    INNER JOIN HotelDetails h ON fd.hotel_type = h.hotel_type AND fd.city = h.city
    INNER JOIN AgentDetails a ON fd.agent_id = a.agent_id
    INNER JOIN RoomDetails rd ON fd.room_type= rd.room_type;