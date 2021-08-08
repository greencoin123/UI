//
//  Scroll.swift
//  greencoin
//
//  Created by user on 2021/7/23.
//

import SwiftUI

private let Title = ["hi", "nav1", "nav2", "nav3","nav4","nav5","nav6","nav7","nav8","nav9","nav10"]

struct Scroll: View {
    
    @State private var selectedIndex = 0
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 0){
                classifyTopView
                pageView
            }.navigationBarTitle("",displayMode:  . inline)
            .navigationBarItems(leading: searchBar, trailing: postButton)
        }
        .onAppear{
            UINavigationBar.appearance().barTintColor = .red
        }
    }
}

extension Scroll {
    private var searchBar : some View {
        ZStack{
            Capsule()
                .fill(Color.white)
            
            HStack{
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 14))
                Text("123")
                    .font(.system(size: 13))
                    .lineLimit(1)
                Spacer()
            }.padding(.leading, 12)
        }.frame(width: UIScreen.main.bounds.width - 75, height: 34)
    }
    private var postButton : some View {
        VStack(spacing:4){
            Image(systemName: "camera.fill")
            Text("Yeah")
                .font(.caption2)
                .fontWeight(.bold)
        }.foregroundColor(.white)
    }
}


extension Scroll {
    private var classifyTopView : some View{
        VStack(alignment: .leading, spacing: 0){
            HStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 0){
                        ScrollViewReader{ value in
                            HStack(spacing: 0){
                                ForEach(0..<Title.count){
                                    index in Text(Title[index])
                                        .fontWeight(self.selectedIndex == index ? .bold : nil)
                                        .font(.subheadline)
                                        .foregroundColor(self.selectedIndex == index ? .red : nil)
                                        .frame(width: 50, height: 32)
                                        .overlay(
                                            VStack{
                                                HStack{
                                                    Spacer()
                                                    Circle()
                                                        .fill(Color.red)
                                                        .frame(width: 4, height: 6)
                                                        .padding(.top, 6)
                                                }
                                                Spacer()
                                            }
                                        )
                                        .onTapGesture{
                                            self.selectedIndex = index
                                        }
                                }
                            }.onChange(of: selectedIndex){
                                _ in
                                if Title.count - selectedIndex > 3 {
                                    withAnimation(.default){
                                        value.scrollTo(selectedIndex, anchor: .center)
                                    }
                                }
                            }
                        }
                        HStack{
                            Capsule()
                                .fill(Color.red)
                                .frame(width: 20, height: 2)
                        }.frame(width: 50)
                        .offset(x: CGFloat(selectedIndex * 50))
                        .animation(.default)
                    }.padding(.leading, 10)
                }
//                }.frame(width: UIScreen.main.bounds.width - 44)
//                Image(systemName: "text.justify")
//                    .foregroundColor(.secondary)
//                    .font(.subheadline)
//                    .frame(width: 44, height: 34)
//                background(Color.white)
            }
            .background(Color.white.opacity(0.5))
            Divider()
        }.frame(height: 34)
    }
}

extension Scroll{
    private var pageView : some View {

        TabView(selection: $selectedIndex){
            ForEach(0..<Title.count){
                index in Text(Title[index]).tag(index)
            }
        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct Scroll_Previews: PreviewProvider {
    static var previews: some View {
        Scroll()
    }
}
