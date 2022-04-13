//
//  File.swift
//  
//
//  Created by hiirari on 13.04.2022.
//
import Foundation
import Vapor
import Fluent

struct PlaceInput: Content{
    
    var name: String
    var address: String
    var longitude: Double?
    var latitude: Double?
    
    
    
//    enum CodingKeys: String, CodingKey {
//        
//        case name = "name"
//        case address = "address"
//        case longitude = "longitude"
//        case latiitude = "latiitude"
//    }
}
