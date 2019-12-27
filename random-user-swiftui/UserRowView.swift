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
            ImageView(withURL: user.picture.large, width: 80, height: 80)
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
