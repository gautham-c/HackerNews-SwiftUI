//
//  DetailView.swift
//  HackerNews
//
//  Created by Gautham C on 6/20/24.
//

import SwiftUI

struct DetailView: View {
    
    var url : String
    
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "www.google.com")
}
