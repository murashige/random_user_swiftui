//
//  ContentView.swift
//  random user swiftui
//
//  Created by 村重司 on 2019/12/26.
//  Copyright © 2019 村重司. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    @ObservedObject var fetcher = UsersDataFetcher()
    
    var body: some View {
        NavigationView {
            List(0 ..< usersDataMock.count) { index in
                NavigationLink(destination: UserDetailView(user: usersDataMock[index])) {
                    UserRowView(user: usersDataMock[index])
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
