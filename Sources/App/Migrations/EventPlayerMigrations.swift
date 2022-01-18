

import Fluent
import Vapor

struct EventPlayerMigration: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("events_players")
        
            .id()
            .field("player_id", .uuid, .required, .references("players", "id"))
            .field("event_id", .uuid, .required, .references("events", "id"))
            .field("is_going", .bool)
            .create()
        
    }
    func revert(on database: Database) async throws {
        return try await database.schema("events_players").delete()
    }
}
