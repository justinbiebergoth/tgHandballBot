

import Fluent
import Vapor

struct PlayerMigration: AsyncMigration {
    func prepare(on database: Database) async throws {
        let gender = try await database.enum("gender").read()
        let role =  try await database.enum("role").read()
        
        try await database.schema("players")
        
            .id()
            .field(.tgName, .string, .required )
            .field(.tgId, .int64, .required ).unique(on: .tgId)
            .field(.sex, gender, .required)
            .field(.role, role, .required)
            .field(.playerName, .string, .required )
            .field(.dateOfB, .string)
            .field(.team, .uuid, .references(Team.schema, .id))
            .field(.createdAt, .datetime)
            .field(.updatedAt, .datetime)
            .create()
                
        

        
    }
    func revert(on database: Database)
    async throws {
       return try await database.schema("players").delete()

        
    }
}
