
## Скрипты

- [pipeline](.gitlab-ci.yml)
- [пример раскатки dev](terraform/envs/dev)

## Используемый модуль

Используется переиспользуемый модуль VM, разработанный в рамках Task1Advanced:
```bash
module "vm" {
    source = "../../../Task1Advanced/modules/vm"
    ...
}
```

## Настроить backet в S3 в Yandex Cloud:
Создать приватный бакет future20-tfstate в s3 в Yandex Cloud для хранения состояния tfstate

## Настроить CI/CD Variables в GitLab:

Чтобы pipeline заработал нужно настроить переменные (переменные надо пометить Masked чтобы не логировать их в Pipeline):

| Переменная               | Назначение                                               |
|--------------------------|----------------------------------------------------------|
| `YC_SERVICE_ACCOUNT_KEY` | JSON ключ сервисного аккаунта для доступа к Yandex Cloud |
| `YC_CLOUD_ID`            | ID облака                                                |
| `YC_FOLDER_ID`           | ID каталога                                              |
| `YC_ZONE`                | Зона размещения ресурсов                                 |
| `AWS_ACCESS_KEY_ID`      | Access key для доступа к Object Storage для tfstate      |
| `AWS_SECRET_ACCESS_KEY`  | Secret key для доступа к Object Storage для tfstate      |
