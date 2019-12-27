//
//  UserDetail.swift
//  random user swiftui
//
//  Created by 村重司 on 2019/12/26.
//  Copyright © 2019 村重司. All rights reserved.
//

import SwiftUI

struct UserDetailView: View {
    var user: UserData
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                ImageView(withURL: user.picture.large, width: 150, height: 150)
            }
            .frame(width: 300, alignment: .center)
            .padding(.vertical, 20)

            Text(user.name.fullName)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)

            definitionList(label: "性別", text: user.gender)
            definitionList(label: "メール", text: user.email)
            definitionList(label: "電話", text: user.phone)
            definitionList(label: "国", text: user.location.country)
            definitionList(label: "州", text: user.location.state)
            definitionList(label: "町", text: user.location.city)
            Spacer()
        }
        .navigationBarTitle(Text(verbatim: user.name.fullName), displayMode: .inline)
    }

    func definitionList(label:String, text:String) -> some View {
            VStack(alignment: .leading) {
                Text(label)
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.bottom, 8)
                Text(text)
                    .padding(.bottom, 16)
            }
    }
}

struct UserDetail_Previews: PreviewProvider {
    static var previews: some View {
        return UserDetailView(user: usersDataMock[0])
    }
}
