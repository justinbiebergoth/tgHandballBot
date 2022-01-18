

import Fluent
import Vapor

struct EventMigration: AsyncMigration {
    func prepare(on database: Database) async throws {
        let gender = try await database.enum("gender").read()
        
        try await database.schema("events")
        
            .id()
            .field("sex", gender, .required)
            .field("place_id", .uuid, .required, .references("places", "id"))
            .field("event_date", .datetime)
            .field("updated_at", .datetime)
            .field("deleted_at", .datetime)
            .create()
    }
    func revert(on database: Database) async throws {
        return try await database.schema("events").delete()
    }
}
