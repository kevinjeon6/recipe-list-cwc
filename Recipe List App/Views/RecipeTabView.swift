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
           FeaturedView()
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
        .environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
