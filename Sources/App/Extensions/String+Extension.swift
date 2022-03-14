//
//  File.swift
//  
//
//  Created by hiirari on 10.03.2022.
//


import Fluent
import Vapor
import Foundation
import Network

//расширение для строки, которое преобразует строку в дату
extension String {
    func stringToDate() -> Date?{
        
        //создаем переменную из стандартной библиотеке по работе с форматированием даты
        let dateFormatter = DateFormatter()
        //настраиваем эту переменную на наш формат даты
        dateFormatter.dateFormat = "DD.MM.yyyy"
        //тайм зона
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        //возвращаю результат
        return  dateFormatter.date(from: self)
        
        
}
}

