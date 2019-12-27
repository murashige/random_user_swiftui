//
//  UsersData.swift
//  random user swiftui
//
//  Created by 村重司 on 2019/12/26.
//  Copyright © 2019 村重司. All rights reserved.
//

import Foundation

struct Name: Codable {
    let title: String
    let first: String
    let last: String
    var fullName: String {
        "\(title). \(first) \(last)"
    }
}

struct Picture: Codable {
    let large: String
}

struct Location: Codable {
    let country: String
    let state: String
    let city: String
}

struct UserData: Codable {
    let name: Name
    let email: String
    let phone: String
    let gender: String
    let picture: Picture
    let location: Location
}

struct UsersData: Codable {
    let results: [UserData]
}
