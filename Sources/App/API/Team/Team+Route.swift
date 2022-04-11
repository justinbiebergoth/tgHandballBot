//
//  File.swift
//  
//
//  Created by hiirari on 07.04.2022.
//

import Foundation
import Fluent
import Vapor


struct TeamRouter {
    @discardableResult
    init(_ routes: RoutesBuilder) {
        let teamController = TeamController()
        let teams = routes.grouped("teams")
        teams.get(":id", use: teamController.getTeam)
        teams.get("", use: teamController.getAllTeam)
        teams.post("", use: teamController.createTeam)
        teams.patch(":id", use: teamController.updateTeam)
        teams.delete(":id", use: teamController.deleteTeam)
    }
    
    
}
