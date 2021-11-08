//
//  User.swift
//  Messenger
//
//  Created by Леонид Попов on 31.05.2021.
//

import Foundation

class User: Decodable {
    var id: UUID;
    var creationDate: Date;
    var login: String;
    var password: String;
    var displayName: String?;
    var phone: String?;
}
