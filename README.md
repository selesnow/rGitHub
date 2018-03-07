<head>
<link rel="shortcut icon" type="image/x-icon" href="as.ico">
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-114798296-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'UA-114798296-1');
</script>
</head>

<p align="center">
<a href="https://selesnow.github.io/"><img src="https://alexeyseleznev.files.wordpress.com/2017/03/as.png" height="80"></a>
</p>

# rGitHub - Пакет rGitHub предназначен для получения статистики по репозиториям на GitHub на языке R.

Все функции пакета предназначены для работы с API v3 GitHub.

## Содержание ReadMe

+ [Установка пакета rGitHub.](https://github.com/selesnow/rGitHub/blob/master/README.md#Установка-пакета-rgithub)
+ [Как получить токен для доступа к API GitHub.](https://github.com/selesnow/rGitHub/blob/master/README.md#Получение-токена-доступа-к-api-github)
+ [Как получить список своих репозиториев на GitHub с их основными параметрами.](https://github.com/selesnow/rGitHub/blob/master/README.md#Получаем-список-репозиториев-с-github)
+ [Как получить статистику по количеству показов и уникальных показов по репозиторию на GitHub по датам.](https://github.com/selesnow/rGitHub/blob/master/README.md#Получаем-основную-статистику-по-показам-и-уникальным-показам-по-репозиторию)
+ [Как получить статистику по количеству показов и уникальных показов по репозиторию на GitHub по рефераллам.](https://github.com/selesnow/rGitHub/blob/master/README.md#Получаем-статистику-по-показам-и-уникальным-показам-в-разрезе-реферралов)
+ [Как получить статистику по количеству показов и уникальных показов по репозиторию на GitHub по страницам репозитория.](https://github.com/selesnow/rGitHub/blob/master/README.md#Получаем-статистику-по-показам-и-уникальным-показам-в-разрезе-страниц-репозитория)

## Установка пакета rGitHub.

Установка пакета осуществляется из репозитория GitHub, для этого сначала требуется установить и подключить пакет devtools.

`install.packages("devtools")`

`library(devtools)`

После чего можно устанавливать пакет ryandexdirect.

`install_github('selesnow/rGitHub')`

`library('rGitHub')`

## Получение токена доступа к API GitHub.

Для отправки запросов к API GitHub вам необходимо получить токен доступа, для этого достаточно перейти по этой [ссылке](https://github.com/settings/tokens), и нажать кнопку Generate New Token, далее требуется заполнить небольшую форму и сгенерировать токен.

## Получаем список репозиториев с GitHub

Для того, что бы получить список репозиториев с их основными параметрами в пакете rGitHub есть функция `ghGetRepositories`.

### Аргументы функции ghGetRepositories

+ user - Ваш логин на GitHub
+ token - Ваш токен доступа к API GitHub.

### Результирующий дата фрейм возвращаемый функцией ghGetRepositories

+ id	- ID репозитория
+ name - Название репозиория
+ full_name	- Полное название репозитория, включает в себя логин владельца и название репозитория
+ language	- Программный язык репозитория
+ owner_login	- Логин владельца репозитория на GitHub
+ owner_url	- Ссылка на профиль владельца на GitHub
+ private	- Является ли репозиторий приватным
+ html_url	- URL репозитория
+ description	- Описание репозитория
+ created_at	- Дата создания репозитория
+ updated_at	- Дата последнего обновления репозитория
+ stargazers_count	- Количество звёзд в репозитории
+ watchers_count	- Количество подписчиков репозитория
+ forks_count	- Количество клонирований репозитория
+ open_issues_count	- Количество открытых тикетов в репозитории

### Пример использования функции ghGetRepositories

`git_repos <- ghGetRepositories(user = "selesnow",  token = "abcde12345") `
  
## Получаем основную статистику по показам и уникальным показам по репозиторию

Для того, что бы получить количество показов и количество уникальных показов в разрезе дат за последние 14 дней есть функция `ghGetView`.

### Аргументы функции ghGetView

+ user - Ваш логин на GitHub
+ repos - Название репозитория
+ token - Ваш токен доступа к API GitHub

### Результирующий дата фрейм возвращаемый функцией ghGetView

+ timestamp - Дата за которую приведена статистика
+ views - Общее количество показов
+ uniques - Коничество уникальных показов

### Пример использования функции ghGetView

`github_stat <- ghGetView(user = "selesnow", repos = "ryandexdirect",  token = "abcde12345")`

## Получаем статистику по показам и уникальным показам в разрезе реферралов.

Для того что бы получить статистику по реферралам в пакете rGitHub есть функция `ghGetReferrers`.

### Аргументы функции ghGetReferrers

+ user - Ваш логин на GitHub
+ repos - Название репозитория
+ token - Ваш токен доступа к API GitHub

### Результирующий дата фрейм возвращаемый функцией ghGetReferrers

+ referrer - Название реферрала
+ views - Общее количество показов
+ uniques - Коничество уникальных показов

### Пример использования функции ghGetReferrers

`git_reffer <- ghGetReferrers(user = "selesnow", repos = "ryandexdirect",  token = "abcde12345")`

## Получаем статистику по показам и уникальным показам в разрезе страниц репозитория.

Что бы получить статистику показов в разрезе страниц репозитория необходимо воспользоваться функцией `ghGetPopularPath`.

### Аргументы функции ghGetPopularPath

+ user - Ваш логин на GitHub
+ repos - Название репозитория
+ token - Ваш токен доступа к API GitHub

### Результирующий дата фрейм возвращаемый функцией ghGetPopularPath

+ path - URL адрес страницы репозитория
+ title - Название страницы репозитория
+ views - Общее количество показов
+ uniques - Коничество уникальных показов

## *Автор пакета: Алексей Селезнёв, Head of Analytics Dept. at Netpeak*
 <p align="center">
<img src="https://lh3.googleusercontent.com/R-0jgJSxIIhpag2L6YCIhJVIcIWx6-Jt5UCTRJjWzJewo47u2QBnik5CRF2dNB79jmsN_BFRjVOAYfvCqFcn3UNS_thGbbxF-99c9lwBWWlFI7JCWE43K5Yk9HnIW8i8YpTDx3l28IuYswaI-qc9QosHT1lPCsVilTfXTyV2empF4S74daOJ6x5QHYRWumT_2MhUS0hPqUsKVtOoveqDnGf3cF_VsN-RfOAwG9uCeGOgNRgv_fhSr41rw4LBND4gf05nO8zMp4TZMrrcUjKvvx6qNgYDor5LFOHiRmfKISYRVkWYe4wLyGO1FgkgTDjg0300lcur2t3txVwZUgROLZdaxOLx4owa8Rc8B8VKwd3vHxjov_aVfNPT4xf9jSFBBEOI-mfYpa55ejKDw-rqTQ6miFRFWpp_hjrk9KbGyB-Z6iZvYL-2dZ6mzgpUfs2I0tEAGsV07yTzboJ0RNCByC2-U-ZVjWdp2_9Au3FFoUcdQUAmPYOVqOv4r3oLbkkJKLj2A5jp7vf4IAoExLIfJuqEf7XN7fFcv4geib029qJjBt28wnqSO6TKEwB2fesR3uPHvGB6_6NHD70UDH-aCRCK4UBeoajtU0Y8Ks8Vwxo0oZBwmoEu8gudTFBF6mDT7GjLoGLDeNxE-TG7OtWUdxsJk7yzXGW3hE-VxsMD9g=s351-no?w=300" data-canonical-src="https://alexeyseleznev.files.wordpress.com/2017/03/as.png?w=300" style="max-width:100%;">
</p>

### Контакты:
<nav class="jetpack-social-navigation jetpack-social-navigation-svg">
<div class="menu-%d1%81%d0%be%d1%86%d0%b8%d0%b0%d0%bb%d1%8c%d0%bd%d1%8b%d0%b5-%d1%81%d0%b5%d1%82%d0%b8-container">
<ul id="menu-%d1%81%d0%be%d1%86%d0%b8%d0%b0%d0%bb%d1%8c%d0%bd%d1%8b%d0%b5-%d1%81%d0%b5%d1%82%d0%b8" class="menu">
<li id="menu-item-13" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-13"><a href="http://www.facebook.com/selesnow" target="_blank"><span class="screen-reader-text">Facebook</span></a></li>
<li id="menu-item-14" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14"><a href="https://www.linkedin.com/in/selesnow/" target="_blank"><span class="screen-reader-text">LinkedIn</span></a></li>
<li id="menu-item-15" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-15"><a href="http://www.vk.com/selesnow" target="_blank"><span class="screen-reader-text">Vkontakte</span></a></li>
<li id="menu-item-16" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-16"><a href="https://github.com/selesnow"><span class="screen-reader-text">GitHub</span></a></li>
<li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-16"><a href="https://alexeyseleznev.wordpress.com/">Blog</a></li>
</ul>
</div>
</nav>
  
<p align="center">
<img src="https://alexeyseleznev.files.wordpress.com/2017/03/as.png?w=300" data-canonical-src="https://alexeyseleznev.files.wordpress.com/2017/03/as.png?w=300" style="max-width:100%;">
</p>

