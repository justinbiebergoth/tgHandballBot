import Fluent
import Vapor



final class Event: Model {
    static let schema = "event"
    
    @ID(key: .id)
    var id: UUID?
    
    
    @Enum(key: "type")
    var sex : type
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
   
    @Timestamp(key: "deleted_at", on: .delete)
    var deletedAt: Date?
    
    @Field(key: "place_id")
    var placeId : Int
    
    @Field(key: "players_id")
    var playersId : Int
    
    @Field(key: "event_date")
    var eventDate : Date?
    
    @Siblings(through: EventPlayer.self, from: \.$eventId, to: \.$playersId)
        public var tags: [Player]
    
    init() { }
    init(
            id: UUID?,
            sex: type,
            createdAt: Date?,
            updatedAt: Date?,
            deletedAt: Date?,
            placeId : Int,
            eventDate : Date?
        ) {
            self.id = id
            self.sex = sex
            self.createdAt = createdAt
            self.deletedAt = deletedAt
            self.placeId = placeId
            self.playersId = playersId
            self.eventDate = eventDate
        }
}
