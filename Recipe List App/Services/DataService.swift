//
//  DataService.swift
//  Recipe List App
//
//  Created by Kevin Mattocks on 2/15/22.
//

import Foundation


class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        let pathString = Bundle.main
            .path(forResource: "recipes", ofType: "json")
        
        
        //check if path string is not nil, otherwise.....
        guard pathString != nil else {
            return [Recipe]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                for r in recipeData {
                    r.id = UUID()
                }
                return recipeData
            } catch {
                print(error)
            }
            
           
            
            
        } catch {
            print(error)
        }
        return [Recipe]()
    }
  
}
