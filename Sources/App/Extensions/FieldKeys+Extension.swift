

import Fluent
import Vapor
import Foundation
import Network

extension FieldKey {
    //place
    static var address: Self { "address" }
    static var name: Self { "name" }
    static var longitude: Self { "longitude" }
    static var latitude: Self { "latitude" }
    
    //all
    
    static var createdAt: Self { "created_at" }
    static var updatedAt: Self { "updated_at" }
    static var deletedAt: Self { "deleted_at" }
    static var sex: Self { "sex" }
    
    //team
    static var teamName: Self { "team_name" }
        
    //player
    static var tgName: Self { "tg_name" }
    static var tgId: Self {"tg_id"}
    static var role: Self { "role" }
    static var playerName: Self { "player_name" }
    static var dateOfB: Self { "date_of_b" }
    static var team: Self { "team_id" }
        
    //event
    static var place: Self { "place_id" }
    static var eventDate: Self { "event_date" }
        
    //eventplayer
    static var player: Self { "player_id" }
    static var event: Self { "event_id" }
    static var isGoing: Self { "is_going" }
        

}
