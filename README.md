# Digital Ichiba (Infra)

これはShuのポートフォリオの、Digital Ichibaのインフラのリポジトリです。  
Fargateで手動デプロイしたものを、terraform importで、取り込みました。

## 概要
Digital Ichibaは、ハンドメイド作家や衣料品、雑貨、生活用品などの小規模セレクトショップのオーナー向けに、  
SNSと直結して5分でオンラインショップを開設できるECプラットフォームです。  
シングルページアプリケーション（SPA）によるスムーズな操作性と、Stripeによる信頼性の高い決済機能を搭載。  
在庫管理やモバイル最適化も完備し、日常の投稿からそのまま販売につなげられます。  
誰でもスムーズに販路を広げ、ブランドの魅力を最大限に発信できる環境を提供します。  

## 構成図

![AWSアーキテクチャ](docs/digital-ichiba-aws-architecture.webp)

## バージョン情報
このリポジトリのバージョン情報です。  
Terraform 1.14.0 / AWS Provider 6.25  

## 管理している主なリソース（抜粋）
- **Network**: VPC / Subnet / Route Table / IGW / Security Group
- **ALB**: HTTPS Listener / Target Group
- **ECS**: Cluster / Service（タスク定義まわり）
- **ECR**: コンテナイメージの格納
- **RDS**: PostgreSQL
- **S3**: 画像等のストレージ用途
- **Route53 / ACM**: ドメイン / 証明書
- **IAM**: ECS実行ロール / タスクロール / GitHub Actions OIDC

## セットアップ（Terraform）

### 前提
- AWSアカウント
- Terraformが実行できる環境（`terraform` コマンド）

### 使い方

```bash
terraform init
terraform plan
terraform apply
```

### 変数
- `terraform.tfvars` に環境に応じた値を設定します。


