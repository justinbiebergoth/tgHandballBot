import Fluent
import Vapor





final class Player: Model, Content  {
    static let schema = "players"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: .tgId)
    var tgId: Int64
    
    
    @OptionalField(key: .tgName)
    var tgName: String?
    
    @Enum(key: .sex)
    var sex : Gender
    
    @Enum(key: .role)
    var role: Role
    
    @Field(key: .playerName)
    var playerName : String
    
    @OptionalField(key: .dateOfB)
    var dateOfB: Date?
    
    @OptionalParent(key: .team)
    var team: Team?

    
    @Timestamp(key: .createdAt, on: .create)
    var createdAt: Date?


    @Timestamp(key: .updatedAt, on: .update)
    var updatedAt: Date?
    
    
    
    @Siblings(through: EventPlayer.self, from: \.$player, to: \.$event)
        public var events: [Event]
    
    init() { }
    init(
            tgName: String,
            tgId: Int64,
            sex : Gender,
            role: Role,
            playerName : String,
            dateOfB: Date?,
            team: Team.IDValue?
            
            ) {
            self.tgName = tgName
            self.tgId = tgId
            self.sex = sex
            self.role = role
            self.playerName = playerName
            self.dateOfB = dateOfB
            self.$team.id = team
        }
    init(input:PlayerInput) {
        self.tgName = input.tgName
                self.tgId = input.tgId
                self.sex = input.sex
                self.role = input.role
                self.playerName = input.playerName
                self.dateOfB = input.dateOfB.stringToDate()
        print(input.dateOfB)
        print(input.dateOfB.stringToDate())
                self.$team.id = input.team
    }
    
    
}

