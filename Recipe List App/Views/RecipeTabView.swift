//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Kevin Mattocks on 2/18/22.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView{
            Text("Featured View")
                .tabItem {
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            
            RecipeListView()
                .tabItem {
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
