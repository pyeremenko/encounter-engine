#language: ru
Функционал: Скрытие игр с пометкой "Черновик"
  Как игрок
  Я не хочу видеть в списке текущих и предстоящих игр игры с пометкой "Черновик"
  Чтобы не заходить в игру с пометкой "Черновик"

Сценарий: Скрытие игры с пометкой "Черновик"
  Допустим я залогинен как Gamer1
  И иду по ссылке "Создать игру >>"
  И ввожу "Game 1" в поле "Название"
  И ввожу "Тестовая игра 1" в поле "Описание"
  И ввожу "2011-07-15 15:11" в поле "Начало игры"
  И ввожу "2011-07-15 15:11" в поле "Крайний срок регистрации"
  И отмечаю галочку "Ограничить"
  И ввожу "5" в поле "количество команд"
  И отмечаю галочку "Черновик?"
  И нажимаю "Создать игру"
  Если иду по ссылке "Личный кабинет"
  То не должен в блоке "coming" видеть "Предстоит игра Game 1"
  И должен в блоке "mygames" увидеть "Game 1"

Сценарий: Показ игры без пометки "Черновик"
  Допустим я залогинен как Gamer2
  И иду по ссылке "Создать игру >>"
  И ввожу "Game 2" в поле "Название"
  И ввожу "Тестовая игра 2" в поле "Описание"
  И ввожу "2011-07-15 15:11" в поле "Начало игры"
  И ввожу "2011-07-15 15:11" в поле "Крайний срок регистрации"
  И отмечаю галочку "Ограничить"
  И ввожу "5" в поле "количество команд"
  И снимаю галочку "Черновик?"
  И нажимаю "Создать игру"
  Если иду по ссылке "Личный кабинет"
  То должен в блоке "coming" увидеть "Предстоит игра Game 2"
  И должен в блоке "mygames" увидеть "Game 2"