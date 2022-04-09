import Fluent
import Vapor

func routes(_ app: Application) throws {
  
    let api = app.grouped("api")
    TeamRouter(api)
    

    try app.register(collection: TodoController())
}
