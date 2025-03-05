select 
    name as title, 
    author, 
    user_rating,
    reviews,
    price,
    year as release_year, 
    genre
from {{source("ANALYTICS","BESTSELLERS_BOOKS")}}