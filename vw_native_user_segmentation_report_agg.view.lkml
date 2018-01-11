view: vw_native_user_segmentation_report_agg {
  derived_table: {
    sql:
      SELECT
        *
        FROM native_state.vw_native_user_segmentation_report_agg ;;
    persist_for: "1 hour"
  }

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${user_id}, '  ', ${game_name}, '  ', ${TABLE}.propTsServer,  '  ', ${country_name}, '  ', ${device_os} ) ;;
  }

  dimension_group: time_server {
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
    sql: ${TABLE}.propTsServer ;;
  }

  dimension: game_name {
    type: string
    sql: ${TABLE}.Game_Name ;;
  }


  #  dimension: app_name {
  #  type: string
  #  sql: ${TABLE}.app_Name ;;
  #}

  dimension: country_name {
    type: string
    sql: ${TABLE}.countryName ;;
  }

  dimension: device_os {
    type: string
    sql: ${TABLE}.device_Os ;;
  }

  dimension: device_platform {
    type: string
    sql: ${TABLE}.device_Platform ;;
  }


  dimension: forecasting_region {
    type: string
    sql: ${TABLE}.forecastingRegion ;;
  }


  dimension: location_country {
    type: string
    sql: ${TABLE}.location_Country ;;
  }

  dimension: prop_sku_id {
    type: string
    sql: ${TABLE}.propSkuId ;;
  }

  dimension: prop_transaction_id {
    type: string
    sql: ${TABLE}.propTransactionId ;;
  }

  dimension: spender_tier {
    type: string
    sql: ${TABLE}.spenderTier ;;
  }

  dimension: spender_type {
    type: string
    sql: ${TABLE}.spenderType ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_Id ;;
  }

  dimension: user_type {
    type: string
    sql: ${TABLE}.userType ;;
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

#Here come the measures

  measure: total_purchases {
    type: max
    sql: ${TABLE}.totalPurchases ;;
  }

  measure: total_spend {
    type: max
    sql: ${TABLE}.totalSpend ;;
  }

  #measure: total_purchases_today {
  #  type: max
  #  sql_distinct_key: ${TABLE}.propTsServer
  #    sql: ${TABLE}.purchasesToday ;;
  #}


  measure: spend {
    type: sum
    sql: ${TABLE}.purchaseAmount ;;
  }

  measure: runningspend {
    type: running_total
    sql: ${TABLE}.purchaseAmount ;;
  }

  #measure: spend_today {
  #  type: sum
  #  sql: ${TABLE}.spendToday ;;
  #}

  #sum of active user flags
  measure: active_users {
    type: sum
    sql: ${TABLE}.activeUsers ;;
    drill_fields: [game_name, game_name, country_name]

  }

  #sum of purchase flags
  measure: purchases {
    type: sum
    sql: ${TABLE}.purchases ;;
    drill_fields: [game_name, game_name, country_name]

  }

  #sum of install flags
  measure: installs {
    type: sum
    sql: ${TABLE}.installs ;;
    drill_fields: [game_name, game_name, country_name]

  }

}
