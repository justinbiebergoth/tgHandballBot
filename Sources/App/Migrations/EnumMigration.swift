
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
    }

    func revert(on database: Database)
    async throws {
        return try await database.schema("Role").delete()
    }
}
