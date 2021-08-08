//
//  HelloApp.swift
//  Hello
//
//  Created by user on 2021/6/18.
//

import SwiftUI

@main
struct HelloApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
    }
}
