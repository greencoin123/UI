//
//  ContentView.swift
//  UI
//
//  Created by user on 2021/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
        case Protab
    }
    
    var body: some View {
        TabView(selection: $selection){
            CategoryHome()
                .tabItem{
                    Label("Store", systemImage: "dollarsign.circle")
                }
                .tag(Tab.featured)
            LandmarkList()
                .tabItem{
                    Label("Notification", systemImage: "bell")
                }
                .tag(Tab.list)
            Protab()
                .tabItem{
                    Label("Profile", systemImage:"person")
                }
                .tag(Tab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}
