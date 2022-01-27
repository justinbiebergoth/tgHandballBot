import Fluent
import Vapor



final class Event: Model {
    static let schema = "events"
    
    @ID(key: .id)
    var id: UUID?
    
    
    @Enum(key: .sex)
    var sex : Gender
    
    @Parent(key: .place)
    var place : Place
    
    

    @OptionalField(key: .eventDate)
    var eventDate : Date?
    
    
    @Timestamp(key: .createdAt, on: .create)
    var createdAt: Date?


    @Timestamp(key: .updatedAt, on: .update)
    var updatedAt: Date?
    
    @Timestamp(key: .deletedAt, on: .delete)
    var deletedAt: Date?

    
    @Siblings(through: EventPlayer.self, from: \.$event, to: \.$player)
        public var players: [Player]
    
    init() { }
    init(
            sex: Gender,
            place : Place,
            eventDate : Date?
        ) throws {
            self.sex = sex
            self.$place.id  = try place.requireID()
            self.eventDate = eventDate
        }
}
