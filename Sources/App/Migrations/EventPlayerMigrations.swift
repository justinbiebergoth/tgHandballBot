

import Fluent
import Vapor

struct EventPlayerMigration: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("events_players")
        
            .id()
            .field(.player, .uuid, .required, .references("players", "id"))
            .field(.event, .uuid, .required, .references("events", "id"))
            .field(.isGoing, .bool)
            .create()
        
    }
    func revert(on database: Database) async throws {
        return try await database.schema("events_players").delete()
    }
}
