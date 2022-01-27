

import Fluent
import Vapor



final class Team: Model {
    static let schema = "teams"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: .teamName)
    var teamName: String
       
    @Enum(key: .sex)
    var sex: Gender
      
    @Timestamp(key: .createdAt, on: .create)
    var createdAt: Date?


    @Timestamp(key: .updatedAt, on: .update)
    var updatedAt: Date?
    
    @Timestamp(key: .deletedAt, on: .delete)
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
