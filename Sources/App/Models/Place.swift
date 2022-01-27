import Fluent
import Vapor

final class Place: Model {
    static let schema = "places"
    
    
    @Children(for: \.$place)
    var events: [Event]
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: .name)
    var name : String
    
    @Field(key: .address)
    var address : String
    
    @OptionalField(key: .longitude)
    var longitude : Double?
    
    @OptionalField(key: .latitude)
    var latitude : Double?
    
    
    @Timestamp(key: .createdAt, on: .create)
    var createdAt: Date?


    @Timestamp(key: .updatedAt, on: .update)
    var updatedAt: Date?
    
    @Timestamp(key: .deletedAt, on: .delete)
    var deletedAt: Date?
    
    
    
    init() { }
    
    init(
            name: String,
            address: String,
            longitude: Double?,
            latitude: Double?
            
        ) {
            self.name = name
            self.address = address
            self.latitude = latitude
            self.longitude = longitude
        }
        
}
