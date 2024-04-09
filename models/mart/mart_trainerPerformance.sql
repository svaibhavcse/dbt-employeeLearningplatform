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
select e.trainer,count(distinct r.user_id),GROUP_CONCAT(DISTINCT e.skill_set ORDER BY e.skill_set) AS trainer_skill_sets from events e join registrations r on e.event_id = r.event_id group by e.trainer
)

SELECT * FROM trainerPerformance