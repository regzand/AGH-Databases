create or replace view V_UPCOMING_TRIPS as
SELECT
  TRIP_ID, COUNTRY, "DATE", TRIP_NAME, PERSON_ID, NAME, SURNAME, RESERVATION_STATUS
FROM V_TRIPS_PERSONS
WHERE "DATE" > CURRENT_DATE
