# BigQuery ML demo
## 概要
タクシーの運賃料金を予測する BigQuery ML の機械学習モデルを作成し、モデルの評価とタクシー運賃の予測を行います。
また、BigQuery ML のTRANSFORM句がある場合とない場合の2パターンを用意しています。
TRANSFORM句がある場合は、suffixに「_transform」をつけていますので、このファイルのクエリ句を参照してください。


## フォルダ構成
sqlフォルダ内の構成は以下のようになっています。

|ファイル名|説明|
|---|---|
|model_training.sql | モデル作成のためのクエリ句。 |
|model_evaluate.sql | モデル評価のためのクエリ句。モデル作成のあとに実行する。 |
|model_prediction.sql | モデル予測のためのクエリ句。モデル作成のあとに実行する。 |
|model_training_transform.sql | モデル作成（TRANSFORM句あり）のためのクエリ句。 |
|model_evaluate_transform.sql | モデル作成のためのクエリ句。モデル作成（TRANSFORM句あり）のあとに実行する。 |
|model_prediction_transform.sql | モデル作成のためのクエリ句。モデル作成（TRANSFORM句あり）のあとに実行する。 |


## 実行方法
以下の手順でモデルの作成から予測まで実行することができます。　

1. データセットを作成する。データセット名は「bqml_demo」とする。リージョンは任意で作成する。
2. モデル作成のクエリ句をBigQuery上で実行する。
3. モデル予測 or 評価のクエリ句をBigQuery上で実行し、予測結果もしくは評価結果を得る。


## 参考
- [BigQuery ML 予測モデルによるタクシー運賃の予測](https://www.cloudskillsboost.google/focuses/1797?locale=ja&parent=catalog)

