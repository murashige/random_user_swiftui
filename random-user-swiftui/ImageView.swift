//
//  ImageView.swift
//  random-user-swiftui
//
//  Created by 村重司 on 2019/12/27.
//  Copyright © 2019 村重司. All rights reserved.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    var width:CGFloat
    var height:CGFloat

    init(withURL url:String, width:CGFloat, height:CGFloat) {
        imageLoader = ImageLoader(urlString:url)
        self.width = width
        self.height = height
    }

    var body: some View {
        VStack {
            Image(uiImage: imageLoader.data != nil ? UIImage(data:imageLoader.data!)! : UIImage())
                .resizable()
                .frame(width: width, height: width)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(withURL: usersDataMock[0].picture.large, width: 80, height: 80)
    }
}
