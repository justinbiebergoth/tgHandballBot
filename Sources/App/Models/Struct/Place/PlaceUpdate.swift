//
//  File.swift
//  
//
//  Created by hiirari on 13.04.2022.
//

import Foundation
import Vapor
import Fluent

struct PlaceUpdate: Content{
    
    var name: String?
    var address: String?
    var longitude: Double?
    var latitude: Double?
    
    
}
