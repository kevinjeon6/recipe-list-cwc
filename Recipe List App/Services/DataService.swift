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
        
        //Create a URL object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            //Create a data object with the data at the url
            let data = try Data(contentsOf: url)
            //Pase the data with JSONDecoder
            let decoder = JSONDecoder()
            
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                //You indicate which model classes/structs you are trying to parse that data to.
                
                //JSON parsing is converting JSON data into instances of your model or class
                
                //To pass in a data type as a parameter to a method. Need to write .self
                
                
                //Set unique IDs for each instance
                //Assign the data to the published property
                
                for r in recipeData {
                    //Set a unique ID for each recipe in the recipeData array
                    r.id = UUID()
                    
                    //Add unique IDs to recipe ingredients arrary. For each i in the ingredients array set its ID
                    for i in r.ingredients {
                        i.id = UUID()
                    }
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
