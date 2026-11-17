select
    airport_code,
    airport_name,
    city,
    state
from {{ ref('airports') }}