import Fluent
import Vapor



final class Event: Model {
    static let schema = "events"
    
    @ID(key: .id)
    var id: UUID?
    
    
    @Enum(key: "type")
    var sex : type
    
    @Parent(key: "place_id")
    var place : Place
    
    

    @Field(key: "event_date")
    var eventDate : Date?
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
   
    @Timestamp(key: "deleted_at", on: .delete)
    var deletedAt: Date?

    
    @Siblings(through: EventPlayer.self, from: \.$event, to: \.$player)
        public var players: [Player]
    
    init() { }
    init(
            id: UUID?,
            sex: type,
            createdAt: Date?,
            updatedAt: Date?,
            deletedAt: Date?,
            place : Place,
            eventDate : Date?
        ) {
            self.id = id
            self.sex = sex
            self.createdAt = createdAt
            self.deletedAt = deletedAt
            self.$place.id  = try place.requireID()
            self.eventDate = eventDate
        }
}
