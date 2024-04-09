{{
    config(
        tags = ['mart']
    )
}}
WITH interests AS (
    SELECT 
        * 
    FROM  {{ ref('stg_interests')}}
),
events AS (
    SELECT 
        * 
    FROM {{ref('stg_events')}}
),
interests_and_no_seats AS (
   SELECT 
        e.event_name,
        e.skill_set,
        e.trainer,
        COUNT(DISTINCT i.user_id) AS interested_users
    FROM 
        events e
    JOIN 
        interests i 
    ON 
        e.event_id = i.event_id
    WHERE 
        e.available_seats = 0 
        AND e.status != 'Completed'
    GROUP BY 
        e.event_name,
        e.skill_set,
        e.trainer

)
select * from interests_and_no_seats