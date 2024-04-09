{{
    config(
        tags = ['staging']
    )
}}
 WITH interests AS (
    SELECT 
    * 
    FROM 
    {{source('learningPlatformSrc','interests')}}
 ),

 renaming_and_convertion AS (
    SELECT 
        eventId as EVENT_ID,
        interestId AS INTEREST_ID,
        userId AS USER_ID
    FROM 
        interests
 )

 SELECT * FROM renaming_and_convertion