//
//  FeaturedView.swift
//  Recipe List App
//
//  Created by Kevin Mattocks on 2/21/22.
//

import SwiftUI

struct FeaturedView: View {
    
    @EnvironmentObject var model: RecipeModel
    @State var isDetailViewPresent = false
    @State var tabSelectedIndex = 0
    
  

    var body: some View {

        
        VStack(alignment: .leading, spacing: 0) {
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
            
            GeometryReader { geo in
                TabView (selection: $tabSelectedIndex) {
                    
                    ForEach(0..<model.recipes.count) { index in
                        
                        //Loop through recipe that only shows to be featured
                        if model.recipes[index].featured {
                            
                            Button(action: {
                                self.isDetailViewPresent = true
                            }, label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    VStack(spacing: 0){
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                        
                                    }
                                }
                            })
                            .tag(index)
                            .sheet(isPresented: $isDetailViewPresent){
                                    RecipeDetailView(recipe: model.recipes[index])
                                }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        }
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            VStack (alignment: .leading, spacing: 10){
                Text("Preparation Time:")
                    .font(.headline)
                Text(model.recipes[tabSelectedIndex].prepTime)
                Text("Highlights")
                    .font(.headline)
                RecipeHighlightsView(highlights: model.recipes[index].highlights)
            }
            .padding([.leading, .bottom])
        }
        .onAppear (perform: {
            setFeaturedRecipeIndex()
        })
    }
    
    
    func setFeaturedRecipeIndex(){
    
        var index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        tabSelectedIndex = index ?? 0
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        
        FeaturedView()
            .environmentObject(RecipeModel())
    }
}
