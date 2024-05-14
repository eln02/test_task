# Тестовое задание

- [ТЗ](https://docs.google.com/document/d/1tYGg7V9z6BGrKD_uq7M22wh2k8YggD4uc3q2NiYyr_0/edit?usp=sharing)
- [Макет](https://www.figma.com/file/Mpk2ewCODAz5wmr95vXn38/Untitled?type=design&mode=design&t=qLDb6uv5pkFoP5zD-0.)

## Стек:
- provider
- retrofit
- shared_preferences

## Превью:

https://github.com/eln02/test_task/assets/99683487/f951fe1d-8b4b-4bca-813f-77d649aac1f7

## Если не работает API:
### Вариант 1: Есть mock сервер

1. В файле `lib/shared/config/api_config/config.dart` обновить mock ссылки на актуальные
   ```dart
   const String baseUrl = 'https://run.mocky.io/v3';
   const String offersPath = '/первый путь';
   const String ticketsOffersPath = '/второй путь';
   const String ticketsPath = '/третий путь';
    ```
   
3. Запустить команду 

   ```echo
   flutter pub run build_runner build
   ``` 

### Вариант2: Запустить локальный mock сервер

1. Запустить flask сервер
   
   [Репозиторий](https://github.com/eln02/mock_server.git)
   ```echo
   flask run --host=<свой хост> --port=<cвой порт>
   ``` 
   
3. В файле `lib/shared/config/api_config/config.dart` изменить код

    Вставить свой хост и порт
 
   ```dart
   const String host = '';
   const String port = '';
   const String baseUrl = 'http://$host:$port';
   const String ticketsPath = '/tickets';
   const String offersPath = '/offers';
   const String ticketsOffersPath = '/tickets_offers';
   ```

4. Запустить команду 
   ```echo
   flutter pub run build_runner build
   ```    
   
   


