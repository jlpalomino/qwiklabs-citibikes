view: ny_citibike_stations {
  sql_table_name: `bigquery_public_data_looker.ny_citibike_stations`
    ;;

  dimension: capacity {
    type: number
    sql: ${TABLE}.capacity ;;
  }

  dimension: eightd_has_available_keys {
    type: yesno
    sql: ${TABLE}.eightd_has_available_keys ;;
  }

  dimension: eightd_has_key_dispenser {
    type: yesno
    sql: ${TABLE}.eightd_has_key_dispenser ;;
  }

  dimension: is_installed {
    type: yesno
    sql: ${TABLE}.is_installed ;;
  }

  dimension: is_renting {
    type: yesno
    sql: ${TABLE}.is_renting ;;
  }

  dimension: is_returning {
    type: yesno
    sql: ${TABLE}.is_returning ;;
  }

  dimension_group: last_reported {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_reported ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: map_location {
    type: location
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: num_bikes_available {
    type: number
    sql: ${TABLE}.num_bikes_available ;;
  }

  dimension: num_bikes_disabled {
    type: number
    sql: ${TABLE}.num_bikes_disabled ;;
  }

  dimension: num_docks_available {
    type: number
    sql: ${TABLE}.num_docks_available ;;
  }

  dimension: num_docks_disabled {
    type: number
    sql: ${TABLE}.num_docks_disabled ;;
  }

  dimension: region_id {
    type: number
    sql: ${TABLE}.region_id ;;
  }

  dimension: rental_methods {
    type: string
    sql: ${TABLE}.rental_methods ;;
  }

  dimension: short_name {
    type: string
    sql: ${TABLE}.short_name ;;
  }

  dimension: station_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.station_id ;;
  }

  measure: count {
    type: count
    drill_fields: [name, short_name]
  }
}
