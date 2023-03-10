//
//  Registration.swift
//  Hotel App
//
//  Created by Tolga Sarikaya on 13.01.23.
//

import Foundation

struct Registration {
    var firstName: String
    var lastName: String
    var emailAddress: String
    
    var checkInDate: Date
    var checkOutDate: Date
    
    var numberOfAdults: Int
    var numberOfChildren: Int
    
    var roomType: RoomType
    var wifi: Bool
    
    // MARK: - Functions
    func fullName() -> String {
        return firstName + " " + lastName
    }
}
