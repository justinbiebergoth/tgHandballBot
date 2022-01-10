import Fluent
import Vapor



final class EventPlayer: Model {
    static let schema = "events_players"
    
    @ID(key: .id)
       var id: UUID?
    
    @Parent(key: "player_id")
       var player: Player

    @Parent(key: "event_id")
       var event: Event
    
    @Field(key: "is_going")
    var isGoing : Bool
    
    
    init() { }
    
    init(id: UUID? = nil, player: Player, event: Event) throws {
            self.id = id
            self.$player.id = try player.requireID()
            self.$event.id = try event.requireID()
            self.isGoing = isGoing
        }
}

