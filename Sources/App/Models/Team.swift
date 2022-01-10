

import Fluent
import Vapor



final class Team: Model {
    static let schema = "teams"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "team_name")
    var teamName: String
       
    @Enum(key: "sex")
    var sex: Gender
      
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?


    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    @Timestamp(key: "deleted_at", on: .delete)
    var deletedAt: Date?
    
    init() { }
    
    init(
            id: UUID?,
            teamName: String,
            sex : Gender,
            createdAt: Date?,
            deletedAt: Date?,
            updatedAt: Date?
            
        ) {
            self.id = id
            self.teamName = teamName
            self.sex = sex
            self.createdAt = createdAt
            self.deletedAt = deletedAt
            self.updatedAt = updatedAt
        }
    
    
    
    
}
