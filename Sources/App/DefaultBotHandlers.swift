//
//  File.swift
//  
//
//  Created by hiirari on 18.12.2021.
//

import Foundation
import Vapor
import telegram_vapor_bot

final class DefaultBotHandlers {

    static func addHandlers(app: Vapor.Application, bot: TGBotPrtcl) {
        defaultHandler(app: app, bot: bot)
        commandStartHandler(app: app, bot: bot)
        commandAddAdmin(app: app, bot: bot)
        commandShowButtonsHandler(app: app, bot: bot)
        buttonsActionHandler(app: app, bot: bot)
    }
    
    //add handler to

    /// add handler for all messages unless command "/ping"
    private static func defaultHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGMessageHandler(filters: (.all && !.command.names(["/start"])) && !.command.names(["/addAdmin"])) { update, bot in
            let params: TGSendMessageParams = .init(chatId: .chat(update.message!.chat.id), text: "Success")
            try bot.sendMessage(params: params)
        }
        bot.connection.dispatcher.add(handler)
    }

    /// add handler for command "/ping"
    private static func commandStartHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let  handler = TGCommandHandler(commands: ["/start"]) { update, bot in
            //переменная с айди телеги
            let senderId =  update.message?.from?.id
            //создаю переменную в которой обращаюсь к базе с игроками, фильтрую по полю айди, сравниваю сколько таких совпадений
            let checkExistUser = try await Players.query(on: database).filter(\.$tgId == senderId ).count()
           if checkExistUser == 1 { try update.message?.reply(text: "u in",  bot: bot)
           }
                else {
                    update.message?.reply(text: "go fuck urself imposter",  bot: bot)
                }
            }
           
                
                
        bot.connection.dispatcher.add(handler)
    }
    
    private static func commandAddAdmin (app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler (commands: ["/addAdmin"]) { update, bot in
                try update.message?.reply(text: "admin was added", bot: bot)
        }
            bot.connection.dispatcher.add(handler)
    
    }
    
    /// add handler for command "/show_buttons" - show message with buttons
    private static func commandShowButtonsHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/show_buttons"]) { update, bot in
            guard let userId = update.message?.from?.id else { fatalError("user id not found") }
            let buttons: [[TGInlineKeyboardButton]] = [
                [.init(text: "Button 1", callbackData: "press 1"), .init(text: "Button 2", callbackData: "press 2")]
            ]
            let keyboard: TGInlineKeyboardMarkup = .init(inlineKeyboard: buttons)
            let params: TGSendMessageParams = .init(chatId: .chat(userId),
                                                    text: "Keyboard activ",
                                                    replyMarkup: .inlineKeyboardMarkup(keyboard))
            try bot.sendMessage(params: params)
        }
        bot.connection.dispatcher.add(handler)
    }
    
    /// add two handlers for callbacks buttons
    private static func buttonsActionHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCallbackQueryHandler(pattern: "press 1") { update, bot in
            let params: TGAnswerCallbackQueryParams = .init(callbackQueryId: update.callbackQuery?.id ?? "0",
                                                            text: update.callbackQuery?.data  ?? "data not exist",
                                                            showAlert: nil,
                                                            url: nil,
                                                            cacheTime: nil)
            try bot.answerCallbackQuery(params: params)
        }

        let handler2 = TGCallbackQueryHandler(pattern: "press 2") { update, bot in
            let params: TGAnswerCallbackQueryParams = .init(callbackQueryId: update.callbackQuery?.id ?? "0",
                                                            text: update.callbackQuery?.data  ?? "data not exist",
                                                            showAlert: nil,
                                                            url: nil,
                                                            cacheTime: nil)
            try bot.answerCallbackQuery(params: params)
        }

        bot.connection.dispatcher.add(handler)
        bot.connection.dispatcher.add(handler2)
    }
}
