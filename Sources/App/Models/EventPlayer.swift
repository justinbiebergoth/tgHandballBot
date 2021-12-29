import Fluent
import Vapor



final class EventPlayer: Model {
    static let schema = "EventPlayer"
    
    @ID(key: .id)
       var id: UUID?
    
    @Parent(key: "players_id")
       var playersId: Player

    @Parent(key: "event_id")
       var eventId: Event
    
    @Field(key: "is_going")
    var isGoing : Bool
    
    
    init() { }
    
    init(id: UUID? = nil, playersId: Player, eventId: Event) throws {
            self.id = id
            self.$playersId.id = try playersId.requireID()
            self.$eventId.id = try eventId.requireID()
        }
}

