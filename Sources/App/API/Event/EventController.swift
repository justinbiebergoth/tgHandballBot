//
//  File.swift
//  
//
//  Created by hiirari on 14.04.2022.
//
import Foundation
import Fluent
import Vapor

class EventController {
    func createEvent(_ req: Request) async throws -> HTTPStatus {
        let input = try req.content.decode(EventInput.self)
        let event = Event(input: input)
        try await event.save(on: req.db)
        
        return .ok
        
    }
    func getAllEvent(_ req: Request) async throws -> [Event] {
        try await Event.query(on: req.db).all()
    }
}
