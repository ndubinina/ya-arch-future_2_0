# VM Terraform Module

Модуль terraform/modules/vm:

- создает виртуальную машину
- подключение к указанной подсети
- SSH-доступ (предварительно надо сгенерировать ключи, см ниже)

## Входные параметры

| Параметр     | Тип    | Описание                   |
|--------------|--------|----------------------------|
| vm_name      | string | Имя vm                     |
| cores        | number | Количество ядер            |
| memory       | number | RAM (в Гб)                 |
| disk_size    | number | Размер диска (в Гб)        |
| disk_type    | string | Тип диска                  |
| subnet_id    | string | id подсети                 |
| image_family | string | Имя для образа ос          |
| ssh_user     | string | Пользоваль для подключения |
| ssh_key      | string | ssh публичный ключ         |

## Outputs

| Output      | Описание      |
|-------------|---------------|
| vm_id       | id vm         |
| vm_name     | имя vm        |
| internal_ip | внутренний ip |
| external_ip | внешний ip    |
| disk_id     | ip диска      |


## Настройка ssh-соединения

#### 1) генерация ssh ключа

```bash
ssh-keygen -t rsa -b 4096
```

будут созданы два файла:

* `~/.ssh/id_rsa` — приватный ключ 
* `~/.ssh/id_rsa.pub` — публичный ключ

#### 2) настройка в Terraform

публичный ключ передаётся в переменную `ssh_key`


## Запуск

Для запуска надо получить токен и локально его настроить
- создать сервисный аккаунт terraform_sa в папке default в облаке (с ролью admin)
- на сервисном аккаунте добавить ключ доступа (авторизации) и сохранить ключи локально в файл ~/key.json
- нужно получить ключи доступа:
  - yc config set service-account-key ~/key.json
  - yc iam access-key create --service-account-name terraform-sa --folder-id <folder_id>


### Dev

- актуализировать значения переменных в dev.tfvars
- terraform apply -var-file=dev.tfvars

### Stage

- актуализировать значения переменных в stage.tfvars
- terraform apply -var-file=stage.tfvars

### Prod

- актуализировать значения переменных в prod.tfvars
- terraform apply -var-file=prod.tfvars
