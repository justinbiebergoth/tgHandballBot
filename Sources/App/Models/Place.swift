import Fluent
import Vapor

final class Place: Model {
    static let schema = "places"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name : String
    
    @Field(key: "address")
    var address : String
    
    @Field(key: "longitude")
    var longitude : Double?
    
    @Field(key: "latitude")
    var latitude : Double?
    
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
   
    @Timestamp(key: "deleted_at", on: .delete)
    var deletedAt: Date?
    
    
    
    init() { }
    
    init(
            id: UUID?,
            name: String,
            address: String,
            longitude: Double,
            latitude: Double
        ) {
            self.id = id
            self.name = name
            self.address = address
            self.latitude = latitude
            self.longitude = longitude
        }
}
