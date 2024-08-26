-- Create AgentDetails Table
CREATE TABLE AgentDetails (
    agent_id VARCHAR(100) PRIMARY KEY,
    company_id NUMERIC(100)
);

-- Create HotelDetails Table
CREATE TABLE HotelDetails (
    hotel_id SERIAL PRIMARY KEY,
    hotel_type CHAR(100) NOT NULL,
    country CHAR(100) NOT NULL,
    city CHAR(100) NOT NULL
);

-- Create CustomerDetails Table
CREATE TABLE CustomerDetails (
    customer_id SERIAL PRIMARY KEY,
    adults NUMERIC CHECK (adults >= 0),
    children NUMERIC CHECK (children >= 0),
    babies NUMERIC CHECK (babies >= 0),
    customer_classification CHAR(100)
);

-- Create RoomDetails Table
CREATE TABLE RoomDetails (
    room_id SERIAL PRIMARY KEY,
    room_type CHAR(100) NOT NULL
);

-- Create ReservationDetails Table
CREATE TABLE ReservationDetails (
    reservation_id SERIAL PRIMARY KEY,
    room_id SERIAL NOT NULL,
    reservation_status CHAR(100) NOT NULL,
    reservation_status_date DATE NOT NULL,
    FOREIGN KEY (room_id) REFERENCES RoomDetails(room_id)
);

-- Create BookingDetails Table
CREATE TABLE BookingDetails (
    booking_id SERIAL PRIMARY KEY,
    hotel_id SERIAL NOT NULL,
    customer_id SERIAL NOT NULL,
    agent_id VARCHAR(100),
    room_id SERIAL NOT NULL,
    stays_in_weekend_nights NUMERIC CHECK (stays_in_weekend_nights >= 0),
    stays_in_week_nights NUMERIC CHECK (stays_in_week_nights >= 0),
    required_car_parking_spaces NUMERIC CHECK (required_car_parking_spaces >= 0),
    arrival_date_month CHAR(100),
    arrival_date_day NUMERIC,
    arrival_date_year NUMERIC,
    price NUMERIC CHECK (price >= 0),
    lead_time NUMERIC CHECK (lead_time >= 0),
    deposit_type CHAR(100) DEFAULT 'None',
    waiting_list NUMERIC CHECK (waiting_list >= 0),
    FOREIGN KEY (hotel_id) REFERENCES HotelDetails(hotel_id),
    FOREIGN KEY (agent_id) REFERENCES AgentDetails(agent_id),
    FOREIGN KEY (customer_id) REFERENCES CustomerDetails(customer_id),
    FOREIGN KEY (room_id) REFERENCES RoomDetails(room_id)
);
