//
//  PostData.swift
//  HackerNews
//
//  Created by Gautham C on 6/20/24.
//

import Foundation

struct PostData : Decodable {
    let hits : [Posts]
}

struct Posts : Decodable, Identifiable {
    var id : String {
        return objectID
    }
    let objectID : String
    let url : String?
    let points : Int
    let title : String
}
