//
//  File.swift
//  
//
//  Created by hiirari on 13.04.2022.
//
import Foundation
import Fluent
import Vapor

class PlaceController {
    
    func createPlace (_ req: Request) async throws -> HTTPStatus {
        let input = try req.content.decode(PlaceInput.self)
        let place = Place(input: input)
        try await place.save(on: req.db)
        
        return .ok
        
    }
    func getAllPlace(_ req: Request) async throws -> [Place] {
        try await Place.query(on: req.db).all()
    }
    
    func getPlace(_ req: Request) async throws -> Place {
        let id = req.parameters.get("id")!
       guard let uuid = UUID(uuidString: id)
        else {
           throw Abort(.badRequest)
       }
        guard let place =  try await Place.query(on: req.db)
    
            .filter(\.$id == uuid).first()
        else {
           throw Abort(.notFound)

       }
        
        return place
    }
    func deletePlace(_ req: Request) async throws -> HTTPStatus {
        let id = req.parameters.get("id")!
       guard let uuid = UUID(uuidString: id)
        else {
           throw Abort(.badRequest)
       }
      let _ =  try await Place.query(on: req.db)
            .filter(\.$id == uuid).delete()
        return .noContent
    }
    
    func updatePlace(_ req: Request) async throws -> HTTPStatus {
        let id = req.parameters.get("id")!
       guard let uuid = UUID(uuidString: id)
        else {
           throw Abort(.badRequest)
       }
        guard let place =  try await Place.query(on: req.db)
             .filter(\.$id == uuid).first()
         else {
            throw Abort(.notFound)
            
        }
        
        let input = try req.content.decode(PlaceUpdate.self)
        
        if let name = input.name {
            place.name = name
        }
        if let address = input.address {
            place.address = address
        }
        if let latitude = input.latitude {
            place.latitude = latitude
        }
        if let longitude = input.longitude {
            place.longitude = longitude
        }
        
        
        try await place.save(on: req.db)
        return .ok
}
}
