connection: "looker_bigquery"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: user_activity_before_today {}

explore: vw_native_user_segmentation_report {}

explore: vw_user_activity_before_today {}

explore: vw_user_activity_today {}
