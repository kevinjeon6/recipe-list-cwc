//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Kevin Mattocks on 2/18/22.
//

import SwiftUI

struct RecipeTabView: View {
    
    @State var selectedTab = Constants.featuredTab
    
    var body: some View {
     
        TabView(selection: $selectedTab){
           FeaturedView()
                .tabItem {
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
                .tag(Constants.featuredTab)
            
            RecipeCategoryView(selectedTab: $selectedTab)
                .tabItem {
                    VStack{
                        Image(systemName: "square.gride.2x2")
                        Text("Categories")
                    }
                }
                .tag(Constants.categoriesTab)
            
            RecipeListView()
                .tabItem {
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
                .tag(Constants.listTab)
        }
        .environmentObject(RecipeModel())
        //new RecipeModel instance. How do we get the instance into the RecipeListView and FeatureView?
        //Create a property var model: RecipeModel. Here we need to specify the data type of it and a property wrapper of @EnvironmentObject. RecipeModel is the data type is a class creates a new data type
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
