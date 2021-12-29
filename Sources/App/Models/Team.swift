//
//  File.swift
//  
//
//  Created by hiirari on 20.12.2021.
//

import Fluent
import Vapor



final class Team: Model {
    static let schema = "team"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
       
    @Enum(key: "sex")
    var sex: Gender
      
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
            sex : Gender,
            createdAt: Date?,
            deletedAt: Date?,
            updatedAt: Date?
            
        ) {
            self.id = id
            self.name = name
            self.sex = sex
            self.createdAt = createdAt
            self.deletedAt = deletedAt
            self.updatedAt = updatedAt
        }
    
    
    
    
}
