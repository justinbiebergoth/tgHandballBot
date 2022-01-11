

import Fluent
import Vapor

struct PlayerMigration: AsyncMigration {
    func prepare(on database: Database) async throws {
        let gender = try await database.enum("gender").read()
        let role =  try await database.enum("role").read()
        
        try await database.schema("players")
            .id()
            .field("tg_name", .string, .required)
            .field("sex", gender, .required)
            .field("role", role, .required)
            .field("player_name", .string, .required )
            .field("date_of_b", .string)
            .field("team_id", .uuid, .required, .references("teams", "id"))
            .field("created_at", .datetime )
            .field("updated_at", .datetime)
            .field("deleted_at", .datetime)
            .create()
        
        

        
    }
    func revert(on database: Database)
    async throws {
       return try await database.schema("players").delete()

        
    }
}
