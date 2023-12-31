
// Розничная цена.
// 
// Параметры:
//  АктуальнаяДата - Дата
//  ЭлементНоменклатуры - СправочникСсылка.Номенклатура
// 
// Возвращаемое значение:
//  Число -  Цена
Функция РозничнаяЦена(АктуальнаяДата, ЭлементНоменклатуры) Экспорт
	
	// Установить отбор по измерению Номенклатура
	Отбор = Новый Структура("Номенклатура", ЭлементНоменклатуры);
	
	// Получить последнюю цену
	ЗначенияРесурсов = РегистрыСведений.Цены.ПолучитьПоследнее(АктуальнаяДата, Отбор);
	
	Возврат ЗначенияРесурсов.Цена;
	
КонецФункции