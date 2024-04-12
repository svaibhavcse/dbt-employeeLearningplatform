{{
    config(
        tags = ['mart']
    )
}}

WITH events AS (
    SELECT * FROM {{ref('stg_events')}}
),
domainAndTrainers AS (
    SELECT
        skill_set,
        LISTAGG(DISTINCT trainer,',') AS TRAINERS,
        COUNT(DISTINCT trainer) AS Count
    FROM 
        events
    GROUP BY 
        skill_set
    ORDER BY 
     Count
)

SELECT * FROM domainAndTrainers