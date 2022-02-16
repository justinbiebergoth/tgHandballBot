

import Fluent
import Vapor

struct EventMigration: AsyncMigration {
    func prepare(on database: Database) async throws {
        let gender = try await database.enum("gender").read()
        
        try await database.schema("events")
        
            .id()
            .field( .sex, gender, .required)
        
            .field(.eventDate, .datetime)
            .field(.place, .uuid, .required, .references(Place.schema, .id))
            .field(.createdAt, .datetime)
            .field(.updatedAt, .datetime)
            .field(.deletedAt, .datetime)
            .create()
    }
    func revert(on database: Database) async throws {
        return try await database.schema("events").delete()
    }
}
