//
//  UsersDataFetcher.swift
//  random user swiftui
//
//  Created by 村重司 on 2019/12/26.
//  Copyright © 2019 村重司. All rights reserved.
//

import Foundation

class UsersDataFetcher: ObservableObject {

    private let urlLink = "https://randomuser.me/api/"
    // このプロパティに変更があった際にイベント発行
    @Published var usersData: [UserData] = []
    @Published var isLoading: Bool = true
    @Published var isLoadingNextPage: Bool = false
    var CurrentPage = 0

    init() {
        fetchUsersData(gender: "", page: 0) { results in
            self.usersData = results
            self.isLoading = false
        }
    }
    
    func updateGender(gender:String) {
        self.isLoading = true
        
        fetchUsersData(gender: gender, page: 0) { results in
            self.usersData = results
            self.isLoading = false
        }
        
        self.CurrentPage = 0
    }
    
    func fetchNextPage(gender:String) {
        self.CurrentPage += 1
        self.isLoadingNextPage = true
        
        fetchUsersData(gender: gender, page: self.CurrentPage) { results in
            self.usersData += results
            self.isLoadingNextPage = false
        }
    }

    func fetchUsersData(gender:String, page:Int, callback:@escaping ([UserData]) -> Void) {
        print("\(urlLink)?results=20&page=\(page)&gender=\(gender)")
        URLSession.shared.dataTask(with: URL(string: "\(urlLink)?results=20&page=\(page)&gender=\(gender)")!) { (data, response, error) in
            guard let data = data else { return }
            let decoder: JSONDecoder = JSONDecoder()
            do {
                let decodeData = try decoder.decode(UsersData.self, from: data)
                DispatchQueue.main.async {
                    callback(decodeData.results)
                }
            } catch {
                print("json convert failed in JSONDecoder. " + error.localizedDescription)
            }
        }.resume()
    }
}
