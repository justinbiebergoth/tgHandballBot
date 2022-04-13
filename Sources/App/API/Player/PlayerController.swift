//
//  File.swift
//  
//
//  Created by hiirari on 12.04.2022.
//
import Foundation
import Fluent
import Vapor

class PlayerController {
    
    func getPlayer(_ req: Request) async throws -> Player {
        let id = req.parameters.get("id")!
       guard let uuid = UUID(uuidString: id)
        else {
           throw Abort(.badRequest)
       }
        guard let player =  try await Player.query(on: req.db).with(\.$team)
    
            .filter(\.$id == uuid).first()
        else {
           throw Abort(.notFound)

       }
        
        return player
    }
    
    func createPlayer(_ req: Request) async throws -> HTTPStatus {
        let input = try req.content.decode(PlayerInput.self)
        let player = Player(input: input)
        try await player.save(on: req.db)
        
        return .ok
        
    }
    func getAllPlayer(_ req: Request) async throws -> [Player] {
        try await Player.query(on: req.db).with(\.$team).all()
    }
    func deletePlayer(_ req: Request) async throws -> HTTPStatus {
        let id = req.parameters.get("id")!
       guard let uuid = UUID(uuidString: id)
        else {
           throw Abort(.badRequest)
       }
      let _ =  try await Player.query(on: req.db)
            .filter(\.$id == uuid).delete()
        return .noContent
    }
        
        func updatePlayer(_ req: Request) async throws -> HTTPStatus {
            let id = req.parameters.get("id")!
           guard let uuid = UUID(uuidString: id)
            else {
               throw Abort(.badRequest)
           }
            guard let player =  try await Player.query(on: req.db)
                 .filter(\.$id == uuid).first()
             else {
                throw Abort(.notFound)
                
            }
            let input = try req.content.decode(PlayerUpdate.self)
            
            if let gender = input.sex {
                player.sex = gender
            }
            if let name = input.playerName {
                player.playerName = name
            }
            if let tgName = input.tgName {
                player.tgName = tgName
            }
            if let tgName = input.tgName {
                player.tgName = tgName
            }
            if let dateOfB = input.dateOfB {
                player.dateOfB = dateOfB.stringToDate()
            }
            if let team = input.team {
                player.$team.id = team
            }
            if let role = input.role {
                player.role = role
            }
            try await player.save(on: req.db)
            return .ok
        }
 }

