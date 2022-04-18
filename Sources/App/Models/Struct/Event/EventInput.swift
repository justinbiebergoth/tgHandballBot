//
//  File.swift
//  
//
//  Created by hiirari on 14.04.2022.
//

import Foundation
import Vapor
import Fluent

struct EventInput: Content{
        
    var sex: Gender
    var place : Place.IDValue
    var eventDate : Date?
    
}

