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
 ),
 renaming_and_convertion AS (
    SELECT
        userid AS USER_ID,
        username as USER_NAME,
        email,
        role
    FROM
        users
 )
 SELECT * FROM renaming_and_convertion