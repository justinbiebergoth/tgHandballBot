
import Fluent
import Vapor


struct EnumMigration: AsyncMigration {
    func prepare(on database: Database) async throws {
        _ =   try await database.enum("gender")
            .case("female")
            .case("male")
            .create()

        _ = try await database.enum("role")
            .case("User")
            .case("Admin")
            .case("Adminishe")
            .create()
        
        _ = try await database.enum("event_type")
            .case("game")
            .case("workout")
            .create()
    }

    func revert(on database: Database)
    async throws {
        try await database.schema("role").delete()
        try await database.schema("event_type").delete()
        try await database.schema("gender").delete()
        
    }
}
