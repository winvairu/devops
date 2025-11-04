## Part 1. Настройка gitlab-runner

* Поднимаем виртуальную машину Ubuntu Server 22.04 LTS

	`cranbero@winvairu:~$ cat /etc/issue.net`

	![MacDown Screenshot](img/screenshot_2024_09_07_at_12_36_01.png)

* Убедимся, что все пакеты обновлены

	`cranbero@winvairu:~$ sudo apt update && sudo apt upgrade -y`

	![MacDown Screenshot](img/screenshot_2024_09_07_at_12_59_51.png)

*  Скачаем и установим на виртуальную машину gitlab-runner

	`cranbero@winvairu:~$ curl -LJO "https://s3.dualstack.us-east-1.amazonaws.com/`
	`gitlab-runner-downloads/latest/deb/gitlab-runner_amd64.deb"`

	`cranbero@winvairu:~$ sudo dpkg -i gitlab-runner_amd64.deb`

	![MacDown Screenshot](img/screenshot_2024_09_07_at_13_31_49.png)

* Запускаем gitlab-runner и зарегистрируем его для использования в текущем проекте (DO6_CICD)

	`cranbero@winvairu:~$ sudo gitlab-runner start`

	`cranbero@winvairu:~$ sudo systemctl status gitlab-runner`

	![MacDown Screenshot](img/screenshot_2024_09_07_at_13_35_31.png)

	`cranbero@winvairu:~$ sudo gitlab-runner register`

	![MacDown Screenshot](img/screenshot_2024_09_07_at_13_40_03.png)


## Part 2. Сборка

* создадим файл `gitlab-ci.yml` с этапом `build`

	![MacDown Screenshot](img/screenshot_2024_09_07_at_15_33_06.png)

	Pipeline #522238

	![MacDown Screenshot](img/screenshot_2024_09_07_at_15_31_23.png)


## Part 3. Тест кодстайла

* Напишем этап для CI, который запускает скрипт кодстайла (clang-format)

	![MacDown Screenshot](img/screenshot_2024_09_07_at_18_06_30.png)

	Pipeline #522398, имеется ошибка в стиле кода

	![MacDown Screenshot](img/screenshot_2024_09_07_at_17_55_32.png)

	![MacDown Screenshot](img/screenshot_2024_09_07_at_17_54_55.png)

	Pipeline #522407, после исправления

	![MacDown Screenshot](img/screenshot_2024_09_07_at_18_02_23.png)

	![MacDown Screenshot](img/screenshot_2024_09_07_at_18_02_49.png)


## Part 4. Интеграционные тесты

* Напишем этап для CI, который запускает скрипы тестов

	Pipeline #522436

	![MacDown Screenshot](img/screenshot_2024_09_07_at_18_34_47.png)

	![MacDown Screenshot](img/screenshot_2024_09_07_at_18_37_45.png)

	![MacDown Screenshot](img/screenshot_2024_09_07_at_18_38_03.png)

	![MacDown Screenshot](img/screenshot_2024_09_07_at_18_38_17.png)


## Part 5. Этап деплоя

* Настроим сеть между двумя машинами "cranbero" и "cranbero2" с использованием второго сетевого интерфейса (enp0s8)

	![MacDown Screenshot](img/screenshot_2024_09_08_at_18_55_08.png)

	![MacDown Screenshot](img/screenshot_2024_09_08_at_18_55_15.png)
	
	![MacDown Screenshot](/Volumes/winvairu/cranbero/DO6_CICD-1/src/img/screenshot_2024_09_08_at_21_27_45.png)
	
* Возникла проблема с копированием в /usr/local/bin

	![MacDown Screenshot](img/screenshot_2024_09_08_at_22_11_46.png)
	
	Решилось командой `sudo chmod 777 /usr/local/bin` на второй машине

	![MacDown Screenshot](img/screenshot_2024_09_08_at_22_12_43.png)


## Part 6. Дополнительно. Уведомления

* Создадим бота через `@BotFather`

	![MacDown Screenshot](img/screenshot_2024_09_09_at_14_10_08.png)

* Получим `chat_id` через `@getmyid_bot`

	![MacDown Screenshot](img/screenshot_2024_09_09_at_14_16_00.png)

* Проверяем уведомления

	![MacDown Screenshot](img/screenshot_2024_09_09_at_18_28_46.png)

	![MacDown Screenshot](img/screenshot_2024_09_09_at_18_28_28.png)