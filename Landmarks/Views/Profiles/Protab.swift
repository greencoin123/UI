//
//  Protab.swift
//  greencoin
//
//  Created by user on 2021/7/19.
//

import SwiftUI

struct Protab: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView{
//            List{
//                Toggle(isOn: $showingProfile{}
//            }
            Button(action: { showingProfile.toggle() }) {
                Image(systemName: "person.crop.circle")
                    .accessibilityLabel("User Profile")
            }
        }
        .sheet(isPresented: $showingProfile) {
            ProfileHost()
                .environmentObject(modelData)
        }
    }
}

struct Protab_Previews: PreviewProvider {
    static var previews: some View {
        Protab()
            .environmentObject(ModelData())
    }
}
