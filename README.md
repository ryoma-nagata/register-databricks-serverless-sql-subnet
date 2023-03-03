# Databricks Serverless SQL Warehouse のためのサブネット許可設定テンプレート

![](.image/2023-03-03-13-21-20.png)

## 使い方

[サーバレスSQLサブネット](https://learn.microsoft.com/ja-jp/azure/databricks/resources/supported-regions#serverless-sql-subnets)のリストを参考に、パラメータを入力し、deploy Azure ボタンを実行してください。

[サンプルパラメータファイル](./infra/sample_parameters.json)

### 注意

既存のルールを変更しないように、追加専用になっています。すでに登録済みのサブネットを登録することはできないです。

## Deploy to Azure

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fryoma-nagata%2Fregister-databricks-serverless-sql-subnet%2Fmain%2Finfra%2Fmain.json)