//
//  File.swift
//  
//
//  Created by hiirari on 19.03.2022.
//

import Foundation
import Vapor
import telegram_vapor_bot
import Fluent

final class TeamHandlers {
  
    
    //addin handlers
    static func addHandlers(app: Vapor.Application, bot: TGBotPrtcl) {
        //list of handlers
        buttonsAddTeamHandler(app: app, bot: bot)
        commandAddTeamHandler(app: app, bot: bot)
    }
    
    //global variable
   static var userId :Int64?
  static var sex: Gender?
    

    
    private static func commandAddTeamHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/addTeam"]) { update, bot in
            guard let userId = update.message?.from?.id else  { fatalError("user id not found") }
            let buttons: [[TGInlineKeyboardButton]] = [
                [.init(text: "женская", callbackData: "female"), .init(text: "мужская", callbackData: "male")]
            ]
            
            let keyboard: TGInlineKeyboardMarkup = .init(inlineKeyboard: buttons)
            let params: TGSendMessageParams = .init(chatId: .chat(userId),
                                                    text: "какая команда?",
                                                    replyMarkup: .inlineKeyboardMarkup(keyboard))
            try bot.sendMessage(params: params)
            
          
            let params1: TGSendMessageParams = .init(chatId: .chat(userId),
                                                     text: "имя команды?")
            
            try bot.sendMessage(params: params1)
       
       
            
            
            
               //        let team = Team(teamName: <#T##String#>, sex: (buttonsAddTeamHandler(app: <#T##Application#>, bot: <#T##TGBotPrtcl#>)))
            
        }
        bot.connection.dispatcher.add(handler)
    }
    

    
    /// add two handlers for callbacks buttons
    private static func buttonsAddTeamHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        
    
       
        let handler = TGCallbackQueryHandler(pattern: "female") { update, bot in
        
         
         let  sex = Gender.female
            let params: TGAnswerCallbackQueryParams = .init(callbackQueryId: update.callbackQuery?.id ?? "0",
                                                            text: update.callbackQuery?.data  ?? "data not exist",
                                                            showAlert: nil,
                                                            url: nil,
                                                            cacheTime: nil)
            try bot.answerCallbackQuery(params: params)
          
           
        }

        let handler2 = TGCallbackQueryHandler(pattern: "male") { update, bot in
            
          
            let params: TGAnswerCallbackQueryParams = .init(callbackQueryId: update.callbackQuery?.id ?? "0",
                                                            text: update.callbackQuery?.data  ?? "data not exist",
                                                            showAlert: nil,
                                                            url: nil,
                                                            cacheTime: nil)
            
            try bot.answerCallbackQuery(params: params)
            let sex = Gender.male
        }
       
        
      
       
        bot.connection.dispatcher.add(handler)
        bot.connection.dispatcher.add(handler2)
    }

}

    

