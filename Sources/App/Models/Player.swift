import Fluent
import Vapor





final class Player: Model {
    static let schema = "players"
    
    @ID(key: .id)
    var id: UUID?
    
    
    @Field(key: "tg_name")
    var tgName: String
    
    @Enum(key: "sex")
    var sex : Gender
    
    @Enum(key: "role")
    var role: Role
    
    @Field(key: "player_name")
    var playerName : String
    
    @OptionalField(key: "date_of_b")
    var dateOfB: Date?
    
    @Parent(key: "team_id")
    var team: Team

    
    @Timestteamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
   
    @Timestamp(key: "deleted_at", on: .delete)
    var deletedAt: Date?
    
    @Siblings(through: EventPlayer.self, from: \.$player, to: \.$event)
        public var events: [Event]
    
    init() { }
    init(
            id: UUID?,
            tgName: String,
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
            self.tgName = tgName
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

