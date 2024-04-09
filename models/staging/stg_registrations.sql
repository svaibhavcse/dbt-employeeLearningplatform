{{
    config(
        tags = ['staging']
    )
}}

WITH registrations AS (
    SELECT 
    * 
    FROM 
    {{source('learningPlatformSrc','registrations') }}
 ),
 renaming_and_convertion AS (
    SELECT
        registrationId AS REGISTRATION_ID,  
        eventId AS EVENT_ID,
        userId AS USER_ID,
        TO_TIMESTAMP(registeredAt,'DD-MM-YYYY HH24:MI') AS REGISTERED_AT
    FROM    
        registrations 
 )
SELECT * FROM renaming_and_convertion