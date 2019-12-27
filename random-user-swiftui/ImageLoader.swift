//
//  RemoteImageURL.swift
//  random-user-swiftui
//
//  Created by 村重司 on 2019/12/27.
//  Copyright © 2019 村重司. All rights reserved.
//

import Foundation
import Combine

class ImageLoader: ObservableObject {    
    @Published var data:Data?

    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}
