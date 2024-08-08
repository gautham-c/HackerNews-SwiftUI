//
//  ContentView.swift
//  HackerNews
//
//  Created by Gautham C on 6/20/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var network = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(network.posts, rowContent: { post in
                NavigationLink {
                    DetailView(url: post.url ?? "www.google.com")
                } label: {
                    HStack{
                        Text(post.title)
                        Spacer()
                        HStack{
                            Image(systemName: "arrow.up")
                            Text(String(post.points))
                        }
                    }
                }

            })
            .navigationTitle("TechPulse")
            .onAppear{
                print(network.posts)
                network.fetchData()
            }
        }
    }
}

#Preview {
    ContentView()
}
