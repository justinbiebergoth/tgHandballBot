

import Fluent
import Vapor



final class Team: Model, Content {
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
    
  
    
    init() { }
    
    init(
            teamName: String,
            sex : Gender
            
        ) {
            self.teamName = teamName
            self.sex = sex
        }
    
    
    init(input:TeamInput) {
        self.teamName = input.teamName
        self.sex = input.gender
    }
    
}
