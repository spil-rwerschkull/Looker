view: vw_user_activity_today {
  sql_table_name: native_state.vw_user_activity_today ;;

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${TABLE}.user_id, '  ', ${TABLE}.app_name, '  ', ${TABLE}.prop_ts_server, '  ', ${TABLE}.is_purchase, '  ', ${TABLE}.location_Country, '  ', ${TABLE}.device_Os ) ;;
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

  dimension: is_purchase {
    type: number
    sql: ${TABLE}.IsPurchase ;;
  }

  dimension: location_country {
    type: string
    sql: ${TABLE}.location_Country ;;
  }

  dimension: prop_local_currency {
    type: string
    sql: ${TABLE}.propLocalCurrency ;;
  }

  dimension: prop_local_price {
    type: number
    sql: ${TABLE}.propLocalPrice ;;
  }

  dimension: prop_sku_id {
    type: string
    sql: ${TABLE}.propSkuId ;;
  }

  dimension: prop_transaction_id {
    type: string
    sql: ${TABLE}.propTransactionId ;;
  }

  dimension_group: prop_ts_server {
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

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_Id ;;
  }

  measure: count {
    type: count
    drill_fields: [app_name]
  }
}
