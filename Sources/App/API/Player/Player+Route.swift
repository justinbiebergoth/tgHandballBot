//
//  File.swift
//  
//
//  Created by hiirari on 12.04.2022.
//
import Foundation
import Fluent
import Vapor

struct PlayerRouter {
    @discardableResult
    init(_ routes: RoutesBuilder) {
        let playerController = PlayerController()
        let players = routes.grouped("players")
        players.get("", use: playerController.getAllPlayer)
        players.get(":id", use: playerController.getPlayer)
        players.post("", use: playerController.createPlayer)
        players.delete(":id", use: playerController.deletePlayer)
        players.patch(":id", use: playerController.updatePlayer)
        
    }
}
