CREATE OR REPLACE MODEL bqml_demo.taxi_fare_model
OPTIONS
  (model_type='linear_reg', labels=['total_fare'], l2_reg=0.1) AS
SELECT
  (tolls_amount + fare_amount) AS total_fare,
  EXTRACT(DAYOFWEEK FROM pickup_datetime) AS dayofweek,
  EXTRACT(HOUR FROM pickup_datetime) AS hourofday,
  SQRT(POW((pickup_longitude - dropoff_longitude),2) + POW(( pickup_latitude - dropoff_latitude), 2)) as dist, -- 乗車と降車の間のユークリッド距離
  SQRT(POW((pickup_longitude - dropoff_longitude),2)) as longitude, -- 乗車と降車の間のユークリッド距離（経度）
  SQRT(POW((pickup_latitude - dropoff_latitude), 2)) as latitude, -- 乗車と降車の間のユークリッド距離（緯度）
  passenger_count AS passengers
FROM
  `nyc-tlc.yellow.trips`
WHERE trip_distance > 0 AND fare_amount BETWEEN 6 and 200
  AND pickup_longitude > -75 -- タクシーの移動距離の制限
  AND pickup_longitude < -73
  AND dropoff_longitude > -75
  AND dropoff_longitude < -73
  AND pickup_latitude > 40
  AND pickup_latitude < 42
  AND dropoff_latitude > 40
  AND dropoff_latitude < 42
  AND MOD(ABS(FARM_FINGERPRINT(CAST(pickup_datetime AS STRING))),1000) = 1 -- 一部のデータを訓練データとして扱う
