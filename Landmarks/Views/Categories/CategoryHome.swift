/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view showing featured landmarks above a list of landmarks grouped by category.
 */

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView {
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationBarTitle("Green Coin", displayMode: .inline)
            .navigationBarItems(
                leading:HStack{
                    Button(action:{}){
                        Image(systemName: "magnifyingglass" )
                    }
                },trailing: HStack{
                    Button(action:{}) {
                        Image(systemName: "cart" )
                    }
                }
            )
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
