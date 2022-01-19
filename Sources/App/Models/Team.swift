

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
            teamName: String,
            sex : Gender
            
        ) {
            self.teamName = teamName
            self.sex = sex
        }
    
    
    
    
}
