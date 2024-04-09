{{
    config(
        tags = ['mart']
    )
}}
WITH completeData AS (
    SELECT * FROM {{ ref('mart_completeData')}}
),
domainCount AS (
    SELECT 
        skill_set,
        count(distinct user_id) AS TRAINED_EMPLOYEES
    FROM 
        completeData
    WHERE
        status = 'Completed'
    GROUP BY
        skill_set
    ORDER BY 
        TRAINED_EMPLOYEES DESC
    
)

SELECT * FROM domainCount