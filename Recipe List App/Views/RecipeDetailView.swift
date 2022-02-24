//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Kevin Mattocks on 2/17/22.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    @State var selectedServingSize = 2
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading){
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                
                //MARK: - Serving size picker
                VStack(alignment: .leading){
                    Text("Select your serving size:")
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical, 5)
                    ForEach(recipe.ingredients){
                        item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                        
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
