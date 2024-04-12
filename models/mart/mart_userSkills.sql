{{
    config(
        tags = ['mart']
    )
}}
WITH completeData AS (
    SELECT * FROM {{ ref('mart_completeData')}}
),
users AS (
    SELECT * FROM {{ref('stg_users')}}
),
userSkills AS (
    SELECT 
     u.user_name,
     agg.SKILLS,
     ARRAY_SIZE(SPLIT(agg.skills,',')) AS SKILL_COUNT
    FROM
     users u
    JOIN (
    SELECT 
        user_id,
        LISTAGG(DISTINCT skill_set,',') AS SKILLS
    FROM 
        completeData
    GROUP BY
        user_id ) AS agg
    ON u.user_id = agg.user_id
    ORDER BY 
        SKILL_COUNT DESC
)

SELECT * FROM userSkills