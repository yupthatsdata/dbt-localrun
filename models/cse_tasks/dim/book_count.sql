select author, count(*) as total_books
from {{ref("cse_task_int")}}
group by author