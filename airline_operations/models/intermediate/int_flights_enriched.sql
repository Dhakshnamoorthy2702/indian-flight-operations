with flights as (
    select * from {{ ref('stg_flights') }}
),

airlines as (
    select * from {{ ref('stg_airlines') }}
),

airports as (
    select * from {{ ref('stg_airports') }}
)

select
    flights.flight_id,
    flights.flight_date,
    flights.airline_code,
    airlines.airline_name,
    flights.flight_number,

    flights.origin_airport,
    departure_airports.airport_name as origin_airport_name,
    departure_airports.city as origin_city,

    flights.destination_airport,
    destination_airports.airport_name as destination_airport_name,
    destination_airports.city as destination_city,

    flights.scheduled_departure,
    flights.actual_departure,
    flights.scheduled_arrival,
    flights.actual_arrival,
    flights.status,
    flights.delay_reason

from flights

left join airlines
    on flights.airline_code = airlines.airline_code

left join airports as departure_airports
    on flights.origin_airport = departure_airports.airport_code

left join airports as destination_airports
    on flights.destination_airport = destination_airports.airport_code
