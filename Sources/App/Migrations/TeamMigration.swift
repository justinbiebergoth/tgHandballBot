

import Fluent
import Vapor



struct TeamMigration: AsyncMigration {
    func prepare(on database: Database) async throws {
        let gender = try await database.enum("gender").read()
        
        try await database.schema("teams")
        .id()
        .field(.teamName, .string, .required).unique(on: .sex, .teamName)
        .field(.sex, gender, .required)
        .field(.updatedAt, .datetime)
        .field(.deletedAt, .datetime)
        .create()
    }

    func revert(on database: Database) async throws {
        return try await
            database.schema("teams").delete()
    }
}

