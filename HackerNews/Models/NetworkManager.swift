//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Gautham C on 6/20/24.
//

import Foundation

class NetworkManager : ObservableObject {
    
    @Published var posts = [Posts]()
    
    func fetchData(){
        let urlString = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page")!
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: urlString) { data, response, error in
            if (error == nil){
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                        let results = try decoder.decode(PostData.self, from: safeData)
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }
                    } catch {
                        print(error)
                    }
                }
            }
        }
        task.resume()
    }
    
}
