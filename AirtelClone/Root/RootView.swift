//
//  RootView.swift
//  AirtelClone
//
//  Created by Muktar Aisak on 21/08/2024.
//

import SwiftUI

struct RootView: View {
    init() {
          UITabBar.appearance().backgroundColor = UIColor.white
      }
    
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            AirtelMoney()
                .tabItem {
                    Label("Airtel Money", systemImage: "wallet.pass")
                }
            
            Text("Airtel tv")
                .tabItem {
                    Label("Airtel Tv", systemImage: "play.tv.fill")
                }
            
            Discover()
                .tabItem {
                    Label("Discover", systemImage: "safari")
                }
            
            More()
                .tabItem {
                    Label("More", systemImage: "line.3.horizontal")
                }
        }
        .tint(.red)
    }
}


#Preview {
    RootView()
}
