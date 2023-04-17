SELECT
*
FROM
  ML.PREDICT(MODEL bqml_demo.taxi_fare_model_transform,
    (
    SELECT -- 必要な列を指定するだけ（最悪*でも実行可能）
      pickup_latitude,
      pickup_longitude,
      dropoff_latitude,
      dropoff_longitude,
      passenger_count,
      pickup_datetime,
    FROM
      `nyc-tlc.yellow.trips`
    WHERE
      trip_distance > 0 AND fare_amount BETWEEN 6 and 200
      AND pickup_longitude > -75 -- タクシーの移動距離の制限
      AND pickup_longitude < -73
      AND dropoff_longitude > -75
      AND dropoff_longitude < -73
      AND pickup_latitude > 40
      AND pickup_latitude < 42
      AND dropoff_latitude > 40
      AND dropoff_latitude < 42
      AND MOD(ABS(FARM_FINGERPRINT(CAST(pickup_datetime AS STRING))),1000) = 2)　); -- 一部のデータを予測データとして扱う
