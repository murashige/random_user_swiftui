//
//  UserRowView.swift
//  random user swiftui
//
//  Created by 村重司 on 2019/12/26.
//  Copyright © 2019 村重司. All rights reserved.
//

import SwiftUI

struct UserRowView: View {
    var user: UserData
    
    var body: some View {
        HStack {
            Image(user.picture.large)
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            Text(user.name.fullName)
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.leading, 10.0)

            Spacer()
        }
        .padding(.vertical, 5.0)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: usersDataMock[0])
            .previewLayout(.fixed(width: 300, height: 90))
    }
}
