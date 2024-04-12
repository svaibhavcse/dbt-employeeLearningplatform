{{
    config(
        tags = ['mart','completeData']
    )
}}
WITH users AS (
    SELECT * FROM {{ ref('stg_users')}}
),
events AS (
    SELECT * FROM {{ref('stg_events')}}
),
registrations AS (
    SELECT * FROM {{ref('stg_registrations')}}
),
joined AS (
        SELECT 
               r.registration_id,
               e.event_id,
               u.user_id,
               r.registered_at,
               e.event_name,
               e.EVENT_DESCRIPTION,
               e.start_date,
               e.end_date,
               e.start_time,
               e.end_time,
               e.location,
               e.skill_set,
               e.trainer,
               e.STATUS,
               e.AVAILABLE_SEATS,
               e.RESOURCE,
               e.PREREQUISITE,
               u.user_name,
               u.email,
               u.role,
               u.experience,
               u.skill as User_skill
        FROM 
            events as e
        JOIN 
            registrations AS r
        ON 
            e.event_id = r.event_id
        JOIN 
            users AS u
        ON 
            r.user_id = u.user_id
)

SELECT * FROM joined