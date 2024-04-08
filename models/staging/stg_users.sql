{{
    config(
        tags = ['staging']
    )
}}
 WITH users AS (
    SELECT 
    * 
    FROM 
    {{source('learningPlatformSrc','users') }}
 )
 SELECT * FROM users