{{
  config(
    materialized='table',
    tags=['prod']
  )
}}

SELECT
user_id,
user_activated_date,
days_since_activated,
is_7d_web_active AS is_7d_web_active_latest,
num_web_sessions_prev_7d,
num_web_sessions_prev_30d,
num_web_sessions_cum AS num_web_sessions_total

FROM {{ref('users_daily')}}

WHERE date = (SELECT MAX(date) FROM {{ ref("users_daily") }})
