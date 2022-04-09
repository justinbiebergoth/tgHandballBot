//
//  File.swift
//  
//
//  Created by hiirari on 07.04.2022.
//

import Foundation
import Fluent
import Vapor



class TeamController {

    func getTeam(_ req: Request) async throws -> Team {
        let id = req.parameters.get("id")!
       guard let uuid = UUID(uuidString: id)
        else {
           throw Abort(.badRequest)
       }
       guard let team =  try await Team.query(on: req.db)
            .filter(\.$id == uuid).first()
        else {
           throw Abort(.notFound)
           
       }
        
        return team
 }
    func getAllTeam(_ req: Request) async throws -> [Team] {
        try await Team.query(on: req.db).all()
 }
    func updateTeam(_ req: Request) async throws -> HTTPStatus {
        let id = req.parameters.get("id")!
       guard let uuid = UUID(uuidString: id)
        else {
           throw Abort(.badRequest)
       }
        guard let team =  try await Team.query(on: req.db)
             .filter(\.$id == uuid).first()
         else {
            throw Abort(.notFound)
            
        }
        let input = try req.content.decode(TeamUpdate.self)
        if let gender = input.gender {
            team.sex = gender
        }
        if let name = input.teamName {
            team.teamName = name
        }
        
        try await team.save(on: req.db)
        
        return .ok
        
        
        
 }
    func createTeam(_ req: Request) async throws -> HTTPStatus {
        let input = try req.content.decode(TeamInput.self)
        let team = Team(Input: input)
        try await team.save(on: req.db)
        
        return .ok
        
        
 }
    func deleteTeam(_ req: Request) async throws -> HTTPStatus {
        let id = req.parameters.get("id")!
       guard let uuid = UUID(uuidString: id)
        else {
           throw Abort(.badRequest)
       }
      let _ =  try await Team.query(on: req.db)
            .filter(\.$id == uuid).delete()
        return .noContent
 }

}
