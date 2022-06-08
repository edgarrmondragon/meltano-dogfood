select
  case when is_answered then 'Answered' else 'Unanswered' end as status
  , count(question_id) as total_questions
  , avg(score) as avg_score
from {{ source('stackoverflow', 'questions') }}
group by is_answered
