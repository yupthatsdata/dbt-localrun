with
    cleaning_books as (
        select
            title,
            author,
            user_rating,
            reviews,
            price,
            release_year,
            genre,
            row_number() over (partition by title order by title) as release_index
        from {{ ref("cse_task_stage") }}
        order by title, release_index
    ),
    cleaned_books as (select * from cleaning_books where release_index = 1)
select title, author, user_rating, reviews, price, release_year, genre
from cleaned_books
