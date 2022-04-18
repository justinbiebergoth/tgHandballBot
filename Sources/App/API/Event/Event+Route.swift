//
//  File.swift
//  
//
//  Created by hiirari on 14.04.2022.
//

import Foundation
import Fluent
import Vapor

struct EventRouter  {
    @discardableResult
    init(_ routes: RoutesBuilder) {
    let eventController = EventController()
    let events = routes.grouped("events")
    events.post("", use: eventController.createEvent)
    events.get("", use: eventController.getAllEvent)
//    places.get(":id", use: placeController.getPlace)
//    places.delete(":id", use: placeController.deletePlace)
//    places.patch(":id", use: placeController.updatePlace)
}
}
