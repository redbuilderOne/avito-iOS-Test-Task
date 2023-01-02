# avito-iOS-Test-Task
Тестовое задание от Avito

![Simulator Screen Shot - iPhone 13 mini - 2022-08-28 at 18 10 27](https://user-images.githubusercontent.com/95698427/187081228-1f916bf4-4202-4e02-ba6a-3197a692a39f.png)
![20 20 Simulator Screen Shot - iPhone 13 mini - 2022-08-28 at 18 10 34](https://user-images.githubusercontent.com/95698427/187081185-6047f400-4bfa-4ee3-8ee9-9256d94f0627.jpg)


Описание задания

# Задание для стажера на платформу iOS

### Общее описание задания
Написать приложение для iOS. Приложение должно состоять из одного экрана со списком. Список данных в формате JSON приложение загружает из интернета по [ссылке](https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c), необходимо распарсить эти данные и отобразить их в списке. 

[Пример](https://github.com/avito-tech/ios-trainee-problem-2021/blob/main/response_example.json) возвращаемых данных.

### Требование к реализации:
- Приложение работает на iOS 13 и выше;
- Реализована поддержка iPhone и iPad;
- Список отсортирован по алфавиту;
- \* Кэширование ответа на 1 час;
- \* Обработаны случаи потери сети / отсутствия соединения.

Внешний вид приложения - по-возможности лаконичный, но, в целом, на усмотрение кандидата.

### Требования к коду:
 - Приложение написано на языке Swift;
 - Пользовательский интерфейс приложения настроен в InterfaceBuilder (в Storiboard или Xib файлы) или кодом без использования SwiftUI;
 - Для отображения списка используется UITableView, либо UICollectionView;
 - Для запроса данных используется URLSession.

### Требования к передаче результатов:
- Код должен быть выложен в git-репозиторий на [github.com](http://github.com/) или его альтернативах с предоставленным доступом.