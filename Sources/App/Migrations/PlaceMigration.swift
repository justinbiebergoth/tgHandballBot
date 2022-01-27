

import Fluent
import Vapor



struct PlaceMigration: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("places")
        .id()
        .field(.name, .string, .required)
        .field(.address, .string, .required)
        .field(.longitude, .double)
        .field(.latitude, .double)
        .field(.createdAt, .datetime )
        .field(.updatedAt, .datetime)
        .field(.deletedAt, .datetime)
        .create()
    }

    func revert(on database: Database) async throws {
        return try await database.schema("places").delete()
    }
}

