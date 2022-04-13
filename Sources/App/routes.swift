import Fluent
import Vapor

func routes(_ app: Application) throws {
  
    let api = app.grouped("api")
    TeamRouter(api)
    PlayerRouter(api)
    PlaceRouter(api)
    

    try app.register(collection: TodoController())
}
