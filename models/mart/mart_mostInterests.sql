{{
    config(
        tags = ['mart']
    )
}}

WITH interests AS (
    SELECT * FROM {{ref('stg_interests')}}
),
events AS (
    SELECT * FROM {{ref('stg_events')}}
),
mostInterests AS (
    SELECT 
        e.event_name,
        e.skill_set,
        agg.interested_users
    FROM 
        events e
    JOIN (
    SELECT 
        e.event_id,
        COUNT(DISTINCT i.user_id) AS interested_users
    FROM 
        interests i
    JOIN 
        events e
    ON 
        i.event_id = e.event_id
    GROUP BY    
        e.event_id
     ) AS agg
    ON e.event_id = agg.event_id
    ORDER BY
        interested_users DESC
)

SELECT * FROM mostInterests