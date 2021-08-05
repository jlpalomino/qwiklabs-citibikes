connection: "bigquery_public_data_looker"

# include all the views
include: "/views/**/*.view"

datagroup: citi_bikes_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: citi_bikes_default_datagroup


label: "NYC Citi Bike"

explore: ny_citibike_trips {
  join: nyc_citibike_start_station {
    from: ny_citibike_stations
    type: left_outer
    sql_on: ${ny_citibike_trips.start_station_id} = ${nyc_citibike_start_station.station_id} ;;
    relationship: many_to_one
  }
  join: nyc_citibike_end_station {
    from: ny_citibike_stations
    type: left_outer
    sql_on: ${ny_citibike_trips.end_station_id} = ${nyc_citibike_end_station.station_id} ;;
    relationship: many_to_one
  }
  }
