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
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
       
            numerator *= targetServings
            denominator *= recipeServings
            
            //Reduce franction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            //Whole portion if num > dem
            if numerator >= denominator {
                wholePortions = numerator / denominator
                //calculated remainder
                numerator = numerator % denominator
                
                portion += String(wholePortions)
            }
            
            //Express the remainder as a fraction
            if numerator > 0 {
                portion += wholePortions > 0 ? " " : ""
                 portion += "\(numerator)/\(denominator)"
            }
        }
        
        if var unit = ingredient.unit {
            
           
            //calculate appropriate suffix
            
            if wholePortions > 1 {
                
                if unit.suffix(2) == "ch" {
                  unit += "es"
                } else if unit.suffix(1) == "f" {
                        unit = String(unit.dropLast())
                        unit += "ves"
                        
                } else {
                    unit += "s"
                }
                }
                
           
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            return portion + unit
        }
        
     
        return portion
        
    }
}
