view: user_activity_before_today {
  sql_table_name: native_state.user_activity_before_today ;;

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${TABLE}.user_id, '  ', ${TABLE}.app_name, '  ', ${TABLE}.location_country) ;;
  }

  dimension: app_name {
    type: string
    sql: ${TABLE}.app_Name ;;
  }

  dimension: device_os {
    type: string
    sql: ${TABLE}.device_Os ;;
  }

  dimension: device_platform {
    type: string
    sql: ${TABLE}.device_Platform ;;
  }

  dimension_group: first_time_activity {
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
    sql: ${TABLE}.firstTimeActivity ;;
  }

  dimension_group: first_time_purchased {
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
    sql: ${TABLE}.firstTimePurchased ;;
  }

  dimension_group: last_time_activity {
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
    sql: ${TABLE}.lastTimeActivity ;;
  }

  dimension_group: last_time_purchased {
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
    sql: ${TABLE}.lastTimePurchased ;;
  }

  dimension: location_country {
    type: string
    sql: ${TABLE}.location_Country ;;
  }

  dimension: total_purchases {
    type: number
    sql: ${TABLE}.totalPurchases ;;
  }

  dimension: total_spend {
    type: number
    sql: ${TABLE}.totalSpend ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_Id ;;
  }

  measure: count {
    type: count
    drill_fields: [app_name]
  }
}
