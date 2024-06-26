//
//  ContentView.swift
//  H4CK3R
//
//  Created by Mert Ziya on 18.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                HStack{
                    Text(String(post.points))
                    Text(post.title)
                    
                }
                
            }
        }
        .onAppear {self.networkManager.fetchData()}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


