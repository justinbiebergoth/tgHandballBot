import Fluent
import Vapor


enum Gender: String, Codable {
    case female, male
}

enum EventType: String, Codable {
    case game, workout
}

enum Role : String , Codable {
    case User, Admin, Adminishe
}
