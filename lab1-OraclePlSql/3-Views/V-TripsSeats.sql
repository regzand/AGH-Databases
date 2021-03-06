create or replace view V_TRIPS_SEATS as
SELECT
  t.TRIP_ID,
  t.COUNTRY,
  t."DATE",
  t.NAME AS TRIP_NAME,
  t.SEATS_NUMBER,
  t.SEATS_NUMBER - (SELECT COUNT(*) FROM RESERVATIONS r WHERE r.TRIP_ID = t.TRIP_ID and r.STATUS != 'A') AS AVAILABLE_SEATS
FROM TRIPS t
