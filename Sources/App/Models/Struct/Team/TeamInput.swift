//
//  File.swift
//  
//
//  Created by hiirari on 08.04.2022.
//

import Foundation
import Vapor
import Fluent

struct TeamInput: Content{
    
    var teamName: String
    var gender: Gender
    
    
    enum CodingKeys: String, CodingKey {
      case teamName = "team_name"
      case gender = "sex"
    }
}
