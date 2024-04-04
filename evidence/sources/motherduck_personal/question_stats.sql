select
  status
  , total_questions
  , round(avg_score, 3) as avg_score
from personal.question_stats
