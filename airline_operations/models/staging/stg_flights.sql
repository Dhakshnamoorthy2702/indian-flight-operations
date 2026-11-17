select
    cast(flight_id as int) as flight_id,
    cast(flight_date as date) as flight_date,
    airline_code,
    flight_number,
    origin_airport,
    destination_airport,
    scheduled_departure,
    actual_departure,
    scheduled_arrival,
    actual_arrival,
    status,
    delay_reason
from {{ ref('flights') }}