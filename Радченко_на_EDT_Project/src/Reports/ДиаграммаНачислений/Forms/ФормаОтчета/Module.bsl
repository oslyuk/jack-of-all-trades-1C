
&НаКлиенте
Процедура Сформировать(Команда)
	СформироватьНаСервере(ДиаграммаГанта);
КонецПроцедуры

&НаСервереБезКонтекста
Процедура СформироватьНаСервере(Диаграмма)
	
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ
		|	НачисленияФактическийПериодДействия.Сотрудник,
		|	НачисленияФактическийПериодДействия.ВидРасчета,
		|	НачисленияФактическийПериодДействия.ПериодДействияНачало,
		|	НачисленияФактическийПериодДействия.ПериодДействияКонец,
		|	НачисленияФактическийПериодДействия.Результат,
		|	НачисленияФактическийПериодДействия.Регистратор,
		|	НачисленияФактическийПериодДействия.Регистратор.Представление
		|ИЗ
		|	РегистрРасчета.Начисления.ФактическийПериодДействия КАК НачисленияФактическийПериодДействия";
	
	ВыборкаРезультата = Запрос.Выполнить().Выбрать();
	
	// Запретить обновление диаграммы.
	Диаграмма.Обновление = Ложь;
	
	Диаграмма.Очистить();
	
	Пока ВыборкаРезультата.Следующий() Цикл
		
		ТекущаяСерия = Диаграмма.УстановитьСерию(ВыборкаРезультата.ВидРасчета);
		ТекущаяТочка = Диаграмма.УстановитьТочку(ВыборкаРезультата.Сотрудник);
		ТекущееЗначение = Диаграмма.ПолучитьЗначение(ТекущаяТочка, ТекущаяСерия);
		
		ТекущийИнтервал = ТекущееЗначение.Добавить();
		ТекущийИнтервал.Начало = ВыборкаРезультата.ПериодДействияНачало;
		ТекущийИнтервал.Конец = ВыборкаРезультата.ПериодДействияКонец;
		ТекущийИнтервал.Текст = ВыборкаРезультата.РегистраторПредставление;
		ТекущийИнтервал.Расшифровка = ВыборкаРезультата.Регистратор;		
		
	КонецЦикла;
	
	// Раскрасить серии своими цветами.
	Для Каждого Серия Из Диаграмма.Серии Цикл
		
		Если Серия.Значение = ПланыВидовРасчета.ОсновныеНачисления.Оклад Тогда
			Серия.Цвет = WebЦвета.Желтый;
		ИначеЕсли Серия.Значение = ПланыВидовРасчета.ОсновныеНачисления.Премия Тогда
			Серия.Цвет = WebЦвета.Зеленый;
		ИначеЕсли Серия.Значение = ПланыВидовРасчета.ОсновныеНачисления.Невыход Тогда
			Серия.Цвет = WebЦвета.Красный;
		КонецЕсли;
		
	КонецЦикла;
	
	Диаграмма.Обновление = Истина;
	
КонецПроцедуры
