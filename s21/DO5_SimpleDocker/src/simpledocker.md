## Part 1. Готовый докер


* Выкачиваем официальный Docker-образ с Nginx

	`cranbero@un-i4 ~ % docker pull nginx`

	![docker_pull_nginx](img/Screenshot 2024-09-02 at 10.50.09.png)

* Проверяем наличие Docker-образа

	`cranbero@un-i4 ~ % docker images`

	![docker_images](img/Screenshot 2024-09-02 at 10.50.57.png)

* Запускаем Docker-образ

	`cranbero@un-i4 ~ % docker run -d nginx`

	или используя image_id:

	`cranbero@un-i4 ~ % docker run -d 5ef79149e0ec`

	![docker_run_-d_5ef79149e0ec](img/Screenshot 2024-09-02 at 10.54.51.png)

* Проверяем, что образ запустился

	`cranbero@un-i4 ~ % docker ps`

	![docker_ps](img/Screenshot 2024-09-02 at 10.56.05.png)

* Смотрим информацию о контейнере

	`cranbero@un-i4 ~ % docker inspect 793c3c52645d`

	или по имени контейнера:

	`cranbero@un-i4 ~ % docker inspect festive_ride`

	![docker_inspect_793c3c52645d](img/Screenshot 2024-09-02 at 10.58.47.png)

	![docker_inspect_793c3c52645d](img/Screenshot 2024-09-02 at 10.58.59.png)

	![docker_inspect_793c3c52645d](img/Screenshot 2024-09-02 at 10.59.09.png)

	![docker_inspect_793c3c52645d](img/Screenshot 2024-09-02 at 10.59.15.png)

	![docker_inspect_793c3c52645d](img/Screenshot 2024-09-02 at 10.59.27.png)

* Извлекаем из вывода информацию и помещаем в отчёт:

	Размер контейнера: 1.09kB (virtual 188MB)

	`cranbero@un-i4 ~ % docker ps -s`

	![docker_ps_-s](img/Screenshot 2024-09-02 at 11.02.19.png)

	Список замапленных портов: в секции NetworkSettings -> Ports: `"80/tcp": null`

	IP контейнера: в секции NetworkSettings -> IPAddress: `"IPAddress": "172.17.0.2",,,`

* Останавливаем Docker-контейнер

	`cranbero@un-i4 ~ % docker stop 793c3c52645d`

	или по имени контейнера:
	
	`cranbero@un-i4 ~ % docker stop festive_ride`

	![docker_stop_793c3c52645d](img/Screenshot 2024-09-02 at 11.03.57.png)

* Проверяем, что контейнер остановился

	`cranbero@un-i4 ~ % docker ps`

	(Проверяем, что контейнер отсутствует в списке запущенных контейнеров.)

	![docker_ps](img/Screenshot 2024-09-02 at 11.05.29.png)

* Запускаем Docker-контейнер с портами 80 и 443

	`cranbero@un-i4 ~ % docker run -d -p 80:80 -p 443:443 5ef79149e0ec`

	![docker_run_-d_-p_80:80_-p_443:443_5ef79149e0ec](img/Screenshot 2024-09-02 at 11.06.43.png)

* Проверяем доступность стартовой страницы Nginx

	Открываем браузер и переходим по адресу:

	`http://localhost:80`

	![localhost:80](img/Screenshot 2024-09-02 at 11.07.42.png)

* Перезапускаем Docker-контейнер

	`cranbero@un-i4 ~ % docker restart 3f0a664479f8`

	или по имени контейнера:

	`cranbero@un-i4 ~ % docker restart laughing_newton`

	![docker_restart_3f0a664479f8](img/Screenshot 2024-09-02 at 11.09.56.png)

* Проверяем, что контейнер запустился

	`cranbero@un-i4 ~ % docker ps`

	или открываем браузер по адресу `http://localhost:80`, чтобы убедиться, что страница доступна.

	![docker_ps](img/Screenshot 2024-09-02 at 11.10.54.png)


## Part 2. Операции с контейнером

`exec` в контексте Docker — это команда, которая позволяет выполнять команды внутри уже запущенного контейнера. Это полезно, когда вам нужно взаимодействовать с контейнером после его запуска, например, для отладки, настройки или выполнения административных задач.

* Читаем конфигурационный файл nginx.conf внутри Docker-контейнера

	`cranbero@un-i4 ~ % docker exec -it 3f0a664479f8 cat /etc/nginx/nginx.conf`

	![docker_exec](img/Screenshot 2024-09-02 at 11.13.03.png)

* Создаем на локальной машине файл nginx.conf

	![nginx.conf](img/Screenshot 2024-09-02 at 11.18.39.png)

* Скопируем файл nginx.conf внутрь Docker-контейнера

	`cranbero@un-i4 ~ % docker cp ./nginx.conf 3f0a664479f8:/etc/nginx/nginx.conf`

	![nginx.conf](img/Screenshot 2024-09-02 at 11.21.05.png)

* Перезапускаем Nginx внутри Docker-контейнера

	`cranbero@un-i4 ~ % docker exec -it 3f0a664479f8 nginx -s reload`

	![nginx_-s_reload](img/Screenshot 2024-09-02 at 11.21.53.png)

*  Проверяем доступность страницы со статусом по адресу  `http://localhost:80/status`

	![localhost:80/status](img/Screenshot 2024-09-02 at 11.22.24.png)

* Экспортируем контейнер в файл container.tar

	`cranbero@un-i4 ~ % docker export 3f0a664479f8 -o container.tar`

	![container.tar](img/Screenshot 2024-09-02 at 11.49.48.png)

*  Останавливаем контейнер

	`cranbero@un-i4 ~ % docker stop 3f0a664479f8`

	![container.tar](img/Screenshot 2024-09-02 at 11.50.50.png)
	
*  Удаляем образ Docker, не удаляя контейнеры

	`cranbero@un-i4 ~ % docker rmi 5ef79149e0ec`

	или

	`cranbero@un-i4 src % docker rmi -f 5ef79149e0ec`


	![docker_rmi_5ef79149e0ec](img/Screenshot 2024-09-02 at 11.51.54.png)

* Удаляем остановленный контейнер

	`cranbero@un-i4 src % docker rm 3f0a664479f8`

	![docker_rm_3f0a664479f8](img/Screenshot 2024-09-02 at 11.53.46.png)

* Импортируем контейнер обратно через команду import

	`cranbero@un-i4 src % cat container.tar | docker import - imported_nginx`

	![docker_import](img/Screenshot 2024-09-02 at 11.55.10.png)

* Запускаем импортированный контейнер

	`cranbero@un-i4 src % docker run -d -p 80:80 imported_nginx`

	или

	`cranbero@un-i4 src % docker run -d -p 80:80 imported_nginx nginx -g 'daemon off;'`

	![docker_run](img/Screenshot 2024-09-02 at 11.56.26.png)

* Проверяем доступность страницы /status на импортированном контейнере

	`http://localhost:80/status`

	![localhost:80/status](img/Screenshot 2024-09-02 at 11.57.46.png)