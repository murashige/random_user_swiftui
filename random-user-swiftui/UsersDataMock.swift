//
//  UsersDataMock.swift
//  random user swiftui
//
//  Created by 村重司 on 2019/12/26.
//  Copyright © 2019 村重司. All rights reserved.
//

import Foundation

let usersDataStr = """
{
    "results": [
        {
            "name": {
                "title": "Mr",
                "first": "Taro",
                "last": "Yamada"
            },
            "email": "taro.yamada@gmail.com",
            "phone": "090-1111-1111",
            "gender": "male",
            "picture": {
                "large": "male"
            },
            "location": {
                "country": "United States",
                "state": "Indiana",
                "city": "Jersey City"
            }
        },
        {
            "name": {
                "title": "Mr",
                "first": "Jiro",
                "last": "Yamada"
            },
            "email": "jiro.yamada@gmail.com",
            "phone": "090-1111-1111",
            "gender": "male",
            "picture": {
                "large": "male"
            },
            "location": {
                "country": "United States",
                "state": "Indiana",
                "city": "Jersey City"
            }
        },
        {
            "name": {
                "title": "Mr",
                "first": "Saburo",
                "last": "Yamada"
            },
            "email": "saburo.yamada@gmail.com",
            "phone": "090-1111-1111",
            "gender": "male",
            "picture": {
                "large": "male"
            },
            "location": {
                "country": "United States",
                "state": "Indiana",
                "city": "Jersey City"
            }
        }
    ]
}
"""

func decodeUsersDataJson(jsonStr: String) -> [UserData] {
    let usersDataJson = jsonStr.data(using: .utf8)
    var usersDataMock: [UserData] = []

    let decoder: JSONDecoder = JSONDecoder()
    do {
        let decodeData: UsersData = try decoder.decode(UsersData.self, from: usersDataJson!)
        usersDataMock = decodeData.results
    } catch {
        print("error:", error.localizedDescription)
    }
    
    return usersDataMock
}

let usersDataMock:[UserData] = decodeUsersDataJson(jsonStr: usersDataStr)
