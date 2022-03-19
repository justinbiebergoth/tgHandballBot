//
//  File.swift
//  
//
//  Created by hiirari on 18.12.2021.
//

import Foundation
import Vapor
import telegram_vapor_bot
import Fluent

final class DefaultBotHandlers {

    static func addHandlers(app: Vapor.Application, bot: TGBotPrtcl) {
        defaultHandler(app: app, bot: bot)
        commandStartHandler(app: app, bot: bot)
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

    
    private static func commandStartHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let  handler = TGCommandHandler(commands: ["/start"]) { update, bot in
            Task { //переменная с айди телеги
            let senderId =  update.message?.from?.id
                let playerName = update.message?.from?.firstName

            //создаю переменную в которой обращаюсь к базе с игроками, фильтрую по полю айди, сравниваю сколько таких совпадений
                let checkExistUser = try await Player.query(on: app.db).filter(\.$tgId == senderId! ).count()
                if checkExistUser == 1 { try update.message?.reply(text: ("привет, \(playerName!)"),  bot: bot)
                    
           }
                else {
                    try update.message?.reply(text: "go fuck urself imposter",  bot: bot)
                }
            }
        }
           bot.connection.dispatcher.add(handler)
    }
}
