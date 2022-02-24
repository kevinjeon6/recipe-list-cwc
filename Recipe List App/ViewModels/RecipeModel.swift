//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Kevin Mattocks on 2/15/22.
//

import Foundation


class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init(){
        //Create an instance of data service and get the data
       
        self.recipes = DataService.getLocalData()
    }
    
    
    static func getPortion(ingredient: Ingredient, recipeServings: Int, targetServings: Int) -> String {
        
        //Single serving size calculation
        
        
        //Selected Serving size calculation
        
        
        //Reduce franction by greatest common divisor
        
        
        //Whole portion if num > dem
        
        
        //Express the remainder as a fraction
        
        return String(targetServings)
        
    }
}
