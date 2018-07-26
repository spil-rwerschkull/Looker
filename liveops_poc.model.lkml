connection: "looker_bigquery"

# include all the views
include: "*.view"

# include all the dashboards


explore: vw_native_user_segmentation_report {}

explore: vw_native_user_segmentation_report_agg {}
