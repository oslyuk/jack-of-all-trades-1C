

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если Параметры.Отбор.Свойство("Мастер") Тогда

		ПрограммныйОтбор = Истина;
		ПолеОтбора = Новый ПолеКомпоновкиДанных("Мастер");
		Параметры.Отбор.Свойство("Мастер", ЗначениеОтбора);

	КонецЕсли
	
КонецПроцедуры



&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	Если ПрограммныйОтбор = Истина Тогда
		ПрограммныеНастройки = Список.КомпоновщикНастроек.ФиксированныеНастройки;
		Для Каждого ЭлементНастроек Из ПрограммныеНастройки.Отбор.Элементы Цикл
			Если ЭлементНастроек.ЛевоеЗначение = ПолеОтбора Тогда
				ПрограммныеНастройки.Отбор.Элементы.Удалить(ЭлементНастроек);
			КонецЕсли;
		КонецЦикла;
		
		Настройки = Список.КомпоновщикНастроек.Настройки;
		ЭлементОтбора = Настройки.Отбор.Элементы.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
		ЭлементОтбора.ЛевоеЗначение  = ПолеОтбора;
		ЭлементОтбора.ВидСравнения   = ВидСравненияКомпоновкиДанных.Равно;
		ЭлементОтбора.ПравоеЗначение = ЗначениеОтбора;
		
		Список.КомпоновщикНастроек.ЗагрузитьНастройки(Настройки);

	КонецЕсли;
	
КонецПроцедуры



&НаКлиенте
Процедура ПриЗакрытии(ЗавершениеРаботы)
		
	Если ПрограммныйОтбор = Истина Тогда
		Настройки = Список.КомпоновщикНастроек.Настройки;
		
		Для Каждого ЭлементНастроек Из Настройки.Отбор.Элементы Цикл
			Если ЭлементНастроек.ЛевоеЗначение = ПолеОтбора Тогда
				Настройки.Отбор.Элементы.Удалить(ЭлементНастроек);
			КонецЕсли;
		КонецЦикла;
		
		Список.КомпоновщикНастроек.ЗагрузитьНастройки(Настройки);
	
	КонецЕсли;
	
КонецПроцедуры

