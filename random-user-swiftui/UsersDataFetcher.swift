//
//  UsersDataFetcher.swift
//  random user swiftui
//
//  Created by 村重司 on 2019/12/26.
//  Copyright © 2019 村重司. All rights reserved.
//

import Foundation

class UsersDataFetcher: ObservableObject {

    // connpass's event search API
    private let urlLink = "https://randomuser.me/api/?results=20&page=0"
    // このプロパティに変更があった際にイベント発行
    @Published var usersData: [UserData] = []

    init() {
        fetchUsersData()
    }

    func fetchUsersData() {
        URLSession.shared.dataTask(with: URL(string: urlLink)!) { (data, response, error) in
            guard let data = data else { return }
            let decoder: JSONDecoder = JSONDecoder()
            do {
                let searchedResultData = try decoder.decode(UsersData.self, from: data)
                dump(searchedResultData)
                DispatchQueue.main.async {
                    self.usersData = searchedResultData.results
                }
            } catch {
                print("json convert failed in JSONDecoder. " + error.localizedDescription)
            }
        }.resume()
    }
}
