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
    @State var selectedGender = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Picker(selection: $selectedGender, label: Text("性別で絞り込む")) {
                    Text("すべて").tag("")
                    Text("男性").tag("male")
                    Text("女性").tag("female")
                }
                .pickerStyle(SegmentedPickerStyle())
                .onTapGesture {
                    self.fetcher.updateGender(gender: self.selectedGender)
                }
                
                if(fetcher.isLoading) {
                    VStack {
                        Spacer()
                        ActivityIndicator(isAnimating: $fetcher.isLoading, style: .medium)
                        Spacer()
                    }
                } else {
                    List(fetcher.usersData) { user in
                        NavigationLink(destination: UserDetailView(user: user)) {
                            UserRowView(user: user)
                        }
                    }
                    .padding()
                        
                    
                    Button(action: {
                       self.fetcher.fetchNextPage(gender: self.selectedGender)
                    }) {
                        if(fetcher.isLoadingNextPage) {
                            ActivityIndicator(isAnimating: $fetcher.isLoadingNextPage, style: .medium)
                        } else {
                            Text("さらにユーザーを表示")
                               .font(.headline)
                        }
                    }
                    .frame(width: 280, height: 40, alignment: .center)
                    .foregroundColor(Color.gray)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 3)
                    )
                }
            }
            .navigationBarTitle(Text("ユーザーリスト"), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
