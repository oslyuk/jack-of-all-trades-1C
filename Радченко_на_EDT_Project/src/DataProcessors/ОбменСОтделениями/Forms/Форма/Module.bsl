
&НаКлиенте
Асинх Процедура СоздатьНачальныйОбраз(Команда)
	
	Диалог = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.ВыборКаталога);
	Диалог.Заголовок = "Укажите каталог информационной базы:";
	
	Если Ждать Диалог.ВыбратьАсинх() <> Неопределено Тогда
		
		СоздатьНачальныйОбразНаСервере(Отделение, Диалог.Каталог);
		
		Сообщение = Новый СообщениеПользователю();
		Сообщение.Текст = "Создание начального образа узла завершено.";
		Сообщение.Сообщить();
		
	КонецЕсли;
	
КонецПроцедуры

&НаСервереБезКонтекста
Процедура СоздатьНачальныйОбразНаСервере(Узел, КаталогСоединения)
	
	ПланыОбмена.СоздатьНачальныйОбраз(Узел, "File=""" + КаталогСоединения + """");
	
КонецПроцедуры

&НаКлиенте
Асинх Процедура ЗаписатьИзменения(Команда)
	
	Диалог = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Сохранение);
	Диалог.Заголовок = "Укажите файл обмена:";
	
	Если Ждать Диалог.ВыбратьАсинх() <> Неопределено Тогда
		
		ЗаписатьИзмененияНаСервере(Отделение, Диалог.ПолноеИмяФайла);
		
		Сообщение = Новый СообщениеПользователю();
		Сообщение.Текст = "Запись изменений завершена.";
		Сообщение.Сообщить();
		
	КонецЕсли;
	
КонецПроцедуры

&НаСервереБезКонтекста
Процедура ЗаписатьИзмененияНаСервере(Узел, ИмяФайла)
	
	// Создать и проинициализировать объект ЗаписьXML.
	ЗаписьXML = Новый ЗаписьXML();
	ЗаписьXML.ОткрытьФайл(ИмяФайла);
	
	// Создать объект ЗаписьСообщенияОбмена и начать запись сообщения.
	ЗаписьСообщения = ПланыОбмена.СоздатьЗаписьСообщения();
	ЗаписьСообщения.НачатьЗапись(ЗаписьXML, Узел); 
	
	// Записать содержимое тела сообщения обмена данными распределенной ИБ.
	ПланыОбмена.ЗаписатьИзменения(ЗаписьСообщения);
	
	// Закончить запись сообщения и запись XML.
	ЗаписьСообщения.ЗакончитьЗапись();
	ЗаписьXML.Закрыть();
	
КонецПроцедуры

&НаКлиенте
Асинх Процедура ПрочитатьИзменения(Команда)
	
	Диалог = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Сохранение);
	Диалог.Заголовок = "Укажите файл обмена:";
	
	Если Ждать Диалог.ВыбратьАсинх() <> Неопределено Тогда
		
		ПрочитатьИзмененияНаСервере(Диалог.ПолноеИмяФайла);
		
		Сообщение = Новый СообщениеПользователю();
		Сообщение.Текст = "Чтение изменений завершено.";
		Сообщение.Сообщить();
		
	КонецЕсли;
	
КонецПроцедуры

&НаСервереБезКонтекста
Процедура ПрочитатьИзмененияНаСервере(ИмяФайла)
	
	// Создать и проинициализировать объект ЧтениеXML. 
	ЧтениеXML = Новый ЧтениеXML();
	ЧтениеXML.ОткрытьФайл(ИмяФайла);
	
	// Создать объект ЧтениеСообщенияОбмена и начать чтение сообщения.
	ЧтениеСообщения = ПланыОбмена.СоздатьЧтениеСообщения();
	ЧтениеСообщения.НачатьЧтение(ЧтениеXML);
	
	// Прочитать содержимое тела сообщения.
	ПланыОбмена.ПрочитатьИзменения(ЧтениеСообщения);
	
	// Закончить чтение сообщения и чтение XML.
	ЧтениеСообщения.ЗакончитьЧтение();
	ЧтениеXML.Закрыть();
	
КонецПроцедуры

&НаСервереБезКонтекста
Функция ПредопределенныйУзел(Узел)
	
	Возврат Узел = ПланыОбмена.Отделения.ЭтотУзел();
	
КонецФункции

&НаКлиенте
Процедура ОтделениеОбработкаВыбора(Элемент, ВыбранноеЗначение, СтандартнаяОбработка)
	
	Если ПредопределенныйУзел(ВыбранноеЗначение) Тогда
		Элементы.СоздатьНачальныйОбраз.Доступность = Ложь;
	Иначе
		Элементы.СоздатьНачальныйОбраз.Доступность = Истина;
	КонецЕсли;
	
КонецПроцедуры
