//
//  File.swift
//  
//
//  Created by hiirari on 12.04.2022.
//
import Foundation
import Vapor
import Fluent


struct PlayerUpdate: Content {
    var sex: Gender?
    var playerName: String?
    var dateOfB: String?
    var team: Team.IDValue?
    var tgName: String?
    var tgId: Int64?
    var role: Role?
    
    enum CodingKeys: String, CodingKey {
        case tgId = "tg_id"
        case tgName = "tg_name"
        case playerName = "player_name"
        case dateOfB = "date_of_b"
        case role = "role"
        case team = "team"
        case sex = "sex"
    }
}


