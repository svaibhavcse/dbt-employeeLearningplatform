{{
    config(
        tags = ['staging']
    )
}}
 WITH events AS (
    SELECT 
    * 
    FROM 
    {{source('learningPlatformSrc','events') }}
 ),

renaming_and_convertion AS (
    SELECT 
    eventid AS event_id,
    eventName AS event_name,
    eventDescription AS event_description,
    TO_DATE(startDate,'DD-MM-YYYY') AS start_date,
    TO_DATE(endDate,'DD-MM-YYYY') AS end_date,
    startTime AS start_time,
    endTime AS end_time,
    location,
    skillSet AS  skill_set,
    trainer,
    status,
    CAST(capacity AS INT) as available_Seats,
    resource,
    prerequisite
    FROM
        events
 )
 SELECT * FROM  renaming_and_convertion
