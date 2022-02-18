//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Kevin Mattocks on 2/17/22.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    
    var body: some View {
        
 
            ScrollView{
                VStack(alignment: .leading){
                    Image(recipe.image)
                        .resizable()
                        .scaledToFit()
                    
                    
                    VStack(alignment: .leading) {
                        Text("Ingredients")
                            .font(.headline)
                            .padding(.vertical, 5)
                        ForEach(recipe.ingredients, id: \.self) {
                            item in
                            Text("• " + item)
                            
                        }
                    }
                    .padding(.horizontal, 5)
                    
                    //MARK: - Directions
                    Divider()
                    VStack(alignment: .leading){
                        Text("Directions")
                            .font(.headline)
                            .padding(.vertical, 5)
                        ForEach(0..<recipe.directions.count, id: \.self) { index in
                            
                            Text(String(index + 1) + ". " + recipe.directions[index])
                                .padding(.bottom, 5)
                        }
                    }
                    .padding(.horizontal, 5)
                    
                }
                
            }
            .navigationBarTitle(recipe.name)
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //create dummy recipe and pass it into the detail view so that we can see a preview
        
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
