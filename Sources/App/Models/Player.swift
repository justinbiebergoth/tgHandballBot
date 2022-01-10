import Fluent
import Vapor





final class Player: Model {
    static let schema = "player"
    
    @ID(key: .id)
    var id: UUID?
    
    
    @Field(key: "tg_name")
    var name: String
    
    @Enum(key: "sex")
    var sex : Gender
    
    @Enum(key: "role")
    var role: Role
    
    @Field(key: "name")
    var playerName : String
    
    @Field(key: "date_of_b")
    var dateOfB: Date?
    
    @Parent(key: "teams_id")
    var team: Team

    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
   
    @Timestamp(key: "deleted_at", on: .delete)
    var deletedAt: Date?
    
    @Siblings(through: EventPlayer.self, from: \.$playersId, to: \.$eventId)
        public var tags: [Event]
    
    init() { }
    init(
            id: UUID?,
            name: String,
            sex : Gender,
            role: Role,
            playerName : String,
            dateOfB: Date?,
            team: Team,
            createdAt: Date?,
            deletedAt: Date?,
            updatedAt: Date?
            
        ) {
            self.id = id
            self.name = name
            self.sex = sex
            self.role = role
            self.playerName = playerName
            self.dateOfB = dateOfB
            self.team = team
            self.createdAt = createdAt
            self.deletedAt = deletedAt
            self.updatedAt = updatedAt
        }
    
}

