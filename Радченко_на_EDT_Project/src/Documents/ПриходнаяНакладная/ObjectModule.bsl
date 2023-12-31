
#Область ОбработчикиСобытий
Процедура ОбработкаПроведения(Отказ, Режим)

	// регистр ОстаткиМатериалов Приход
	Движения.ОстаткиМатериалов.Записывать = Истина;
	// регистр СтоимостьМатериалов Приход
	Движения.СтоимостьМатериалов.Записывать =Истина;
	// регистр Управленческий
	Движения.Управленческий.Записывать = Истина;
	
	Для Каждого ТекСтрокаМатериалы Из Материалы Цикл
		
		// регистр ОстаткиМатериалов Приход
		Движение = Движения.ОстаткиМатериалов.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Материал = ТекСтрокаМатериалы.Материал;
		Движение.НаборСвойств = ТекСтрокаМатериалы.НаборСвойств;
		Движение.Склад = Склад;
		Движение.Количество = ТекСтрокаМатериалы.Количество;
		
		// регистр СтоимостьМатериалов Приход
		Движение = Движения.СтоимостьМатериалов.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Материал = ТекСтрокаМатериалы.Материал;
		Движение.Стоимость = ТекСтрокаМатериалы.Сумма;
		
		// регистр Управленческий
		Движение = Движения.Управленческий.Добавить();
		Движение.СчетДт = ПланыСчетов.Основной.Товары;
		Движение.СчетКт = ПланыСчетов.Основной.РасчетыСПоставщиками;
		Движение.Период = Дата;
		Движение.Сумма = ТекСтрокаМатериалы.Сумма;
		Движение.КоличествоДт = ТекСтрокаМатериалы.Количество;
		Движение.СубконтоДт[ПланыВидовХарактеристик.ВидыСубконто.Материалы] = ТекСтрокаМатериалы.Материал;
		
	КонецЦикла;

КонецПроцедуры

Процедура ПриУстановкеНовогоНомера(СтандартнаяОбработка, Префикс)
	
	Префикс = Обмен.ПолучитьПрефиксНомера();

КонецПроцедуры

#КонецОбласти


