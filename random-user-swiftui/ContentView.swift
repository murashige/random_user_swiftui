//
//  ContentView.swift
//  random user swiftui
//
//  Created by 村重司 on 2019/12/26.
//  Copyright © 2019 村重司. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var fetcher = UsersDataFetcher()
    
    var body: some View {
        NavigationView {
            List(fetcher.usersData) { user in
                NavigationLink(destination: UserDetailView(user: user)) {
                    UserRowView(user: user)
                }
            }
            .padding()
            .navigationBarTitle(Text("ユーザーリスト"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
