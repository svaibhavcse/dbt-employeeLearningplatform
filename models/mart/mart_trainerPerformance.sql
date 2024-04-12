{{
    config(
        tags = ['mart']
    )
}}

WITH registrations AS(
    SELECT *  FROM {{ ref('stg_registrations')}}
),
events AS (
    SELECT * FROM {{ ref('stg_events')}}
),
trainerPerformance AS (
    SELECT
        e.trainer,
        COUNT(DISTINCT r.user_id) AS num_registered_users,
        LISTAGG(DISTINCT e.skill_set, ',')  AS trainer_skill_sets
    FROM
        events e
    JOIN
        registrations r ON e.event_id = r.event_id
    GROUP BY
        e.trainer
    ORDER BY 
        num_registered_users DESC
)

SELECT * FROM trainerPerformance