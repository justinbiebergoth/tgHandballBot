import Fluent
import Vapor



final class EventPlayer: Model {
    static let schema = "events_players"
    
    @ID(key: .id)
       var id: UUID?
    
    @Parent(key: .player)
       var player: Player

    @Parent(key: .event)
       var event: Event
    
    @Field(key: .isGoing)
    var isGoing : Bool
    
    
    init() { }
    
    init(player: Player, event: Event, isGoing : Bool) throws {
            self.$player.id = try player.requireID()
            self.$event.id = try event.requireID()
            self.isGoing = isGoing
        }
}

