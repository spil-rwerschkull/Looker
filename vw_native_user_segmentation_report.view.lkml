view: vw_native_user_segmentation_report {
  derived_table: {
    sql:
      SELECT
        *
        FROM native_state.vw_native_user_segmentation_report ;;
    persist_for: "1 hour"
  }


  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${TABLE}.user_id, '  ', ${TABLE}.app_name, '  ', ${TABLE}.prop_ts_server, '  ', ${TABLE}.purchase_flag, '  ', ${TABLE}.location_Country, '  ', ${TABLE}.device_Os ) ;;
  }

  dimension: app_name {
    type: string
    sql: ${TABLE}.app_Name ;;
  }

  dimension: game_name {
    type: string
    sql: ${TABLE}.Game_Name ;;
  }

  dimension: location_country {
    type: string
    sql: ${TABLE}.location_Country ;;
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}.countryName ;;
  }

  dimension: forecasting_region {
    type: string
    sql: ${TABLE}.forecastingRegion ;;
  }

  dimension: device_os {
    type: string
    sql: ${TABLE}.device_Os ;;
  }

  dimension: device_platform {
    type: string
    sql: ${TABLE}.device_Platform ;;
  }

  dimension: exchange_rate {
    type: number
    sql: ${TABLE}.exchange_rate ;;
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

  dimension: payer_flag {
    type: number
    sql: ${TABLE}.payerFlag ;;
  }

  dimension: sku_id {
    type: string
    sql: ${TABLE}.propSkuId ;;
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}.propTransactionId ;;
  }

  dimension_group: time_server {
    type: time
    timeframes: [
      raw,
      time,
      minute,
      minute5,
      hour,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.propTsServer ;;
  }

  measure: purchase_amount {
    type: sum
    sql: ${TABLE}.purchaseAmount ;;
  }

  dimension: purchase_flag {
    type: number
    sql: ${TABLE}.purchaseFlag ;;
  }

  dimension: heartbeat_flag {
    type: number
    sql: ${TABLE}.heartbeatFlag ;;
  }

  dimension: returner_flag {
    type: number
    sql: ${TABLE}.returnerFlag ;;
  }

  dimension: spender_type {
    type: string
    sql: ${TABLE}.spenderType ;;
  }

  dimension: purchases_today {
    type: number
    sql: ${TABLE}.purchasesToday ;;
  }

  dimension: total_purchases {
    type: number
    sql: ${TABLE}.totalPurchases ;;
  }

  dimension: minutes_active_today {
    type: number
    sql: ${TABLE}.minutesActiveToday ;;
  }

  dimension: total_minutes_active {
    type: number
    sql: ${TABLE}.totalMinutesActive ;;
  }

  dimension: total_spend {
    type: number
    sql: ${TABLE}.totalSpend ;;
  }

  dimension: spend_today {
    type: number
    sql: ${TABLE}.spendToday ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_Id ;;
  }

  dimension: user_type {
    type: string
    sql: ${TABLE}.userType ;;
  }

  measure: count {
    type: count
    drill_fields: [device_platform,country_name]
  }

  measure: unique_user_count {
    type: count_distinct
    sql: ${TABLE}.user_Id
    drill_fields: [device_platform,country_name]
    ;;
  }

  measure: timeslice_count {
    type: count_distinct
    sql: ${TABLE}.propTsServer ;;
  }

  measure: timeslice_countnew {
    type: count_distinct
    sql: ${time_server_minute};;
  }


}
