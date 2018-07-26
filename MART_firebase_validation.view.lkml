view: firebase_data {
 derived_table: {
  sql: WITH base_data AS
(SELECT
  CASE
   WHEN eventParams.key = 'level_name'
   THEN eventParams.value.string_value
   END AS levelName
 , CASE
   WHEN eventParams.key = 'spil_user_id'
   THEN eventParams.value.string_value
   END AS spilUid
 , user_pseudo_id AS FirebaseUserId
 , device.advertising_id AS advertisingId
 , SPLIT(app_info.version, '.') AS splitAppVersion
 , COUNT(*) AS noEvents
FROM
 `uphill-rush-23678890.analytics_152567440.events_20180724`
, UNNEST(event_params) AS eventParams
WHERE
 event_name IN ('UR_levelRestart', 'UR_levelStart')
 AND eventParams.key IN ('level_name', 'spil_user_id')
GROUP BY
 1
 , 2
 , 3
 , 4
 , app_info.version)

, level_data AS
(SELECT
  levelName
 , FirebaseUserId
 , advertisingId
 , safe_CAST (splitAppVersion [ SAFE_OFFSET (0)] AS int64 ) <<16 |
    safe_CAST (splitAppVersion [ SAFE_OFFSET (1)] AS int64 ) << 8 |
    safe_CAST (splitAppVersion [ SAFE_OFFSET (2)] AS int64 ) As app_version_comp
 , SUM(noEvents) AS noEvents
FROM
 base_data
GROUP BY
 1
 , 2
 , 3
 , 4)

, user_data AS
(SELECT
  spilUid
 , FirebaseUserId
 , advertisingId
 , safe_CAST (splitAppVersion [ SAFE_OFFSET (0)] AS int64 ) <<16 |
    safe_CAST (splitAppVersion [ SAFE_OFFSET (1)] AS int64 ) << 8 |
    safe_CAST (splitAppVersion [ SAFE_OFFSET (2)] AS int64 ) As app_version_comp
 , SUM(noEvents) AS noEvents
FROM
 base_data
GROUP BY
 1
 , 2
 , 3
 , 4)

SELECT
 levelName
 , MIN(l.app_version_comp) AS minAppVersion
 , MAX(l.app_version_comp) AS maxAppVersion
 , COUNT(DISTINCT u.SpilUid) AS noUniqueSpilUsers
 , COUNT(DISTINCT l.FirebaseUserId) AS noUniqueFirebaseUsers
 , COUNT(DISTINCT l.advertisingId) AS noUniqueDeviceIds
 , SUM(l.noEvents) AS noEvents
FROM
 level_data l
JOIN
 user_data u
ON
 (l.FirebaseUserId = u.FirebaseUserId
  AND l.advertisingId = u.advertisingId
  AND l.app_version_comp = u.app_version_comp)
GROUP BY
 1
ORDER BY
 1;;
}
}


view: mart_firebase_validation {
 }
