

import Fluent
import Vapor



struct TeamMigration: AsyncMigration {
    func prepare(on database: Database) async throws {
        let gender = try await database.enum("gender").read()
        
        try await database.schema("teams")
        .id()
        .field("team_name", .string, .required)
        .field("sex", gender, .required)
        .field("created_at", .datetime )
        .field("updated_at", .datetime)
        .field("deleted_at", .datetime)
        .create()
    }

    func revert(on database: Database) async throws {
        return try await
            database.schema("teams").delete()
    }
}

