# Practice4

# Учебный проект №4
  
В этом репозитории представлено **четвертое** учебное домашнее задание.

## Краткое описание

````bash
- Реализует подгрузку данных из двух источников новостей - newsapi.org и thenewsapi.com
- Первый уровень - список источников новостей. Без пейджинга.
- Из источника новостей мы проваливаемся в список новостей. С пейджингом.
- Из списка новостей проваливаемся в детализацию новости.
- Итого - три уровня вложенности на custom navigation stack.
- Модели данных, слой запросов - сгенерированы при помощи Swagger
````
````bash
- Реализован MVVM
- Для взаимодействия с сетевым слоем использован Combine
- Реализован ServiceLocator. В него перенесен сервис сетевых запросов и управление страницами
- Инжектинг переменных в инстансе классов
- Сервис сетевых запросов вынесен в отдельный пакет, который подключается через SwiftPM.
````

