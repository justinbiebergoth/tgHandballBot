//
//  File.swift
//  
//
//  Created by hiirari on 13.04.2022.
//
import Foundation
import Fluent
import Vapor

struct PlaceRouter  {
    @discardableResult
    init(_ routes: RoutesBuilder) {
    let placeController = PlaceController()
    let places = routes.grouped("places")
    places.post("", use: placeController.createPlace)
    places.get("", use: placeController.getAllPlace)
    places.get(":id", use: placeController.getPlace)
    places.delete(":id", use: placeController.deletePlace)
    places.patch(":id", use: placeController.updatePlace)
}
}
