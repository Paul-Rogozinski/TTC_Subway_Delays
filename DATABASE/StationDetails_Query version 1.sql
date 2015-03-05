CREATE PROCEDURE get_stationdetails ()
BEGIN
  SELECT Station_Name, Station_Address FROM station_details
    WHERE Station_ID = 'station_id';
END;
