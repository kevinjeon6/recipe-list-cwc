//
//  Ingredient.swift
//  Recipe List App
//
//  Created by Kevin Mattocks on 2/21/22.
//

import Foundation

class Ingredient: Identifiable, Decodable {
    
    var id: UUID?
    var name: String
    var num: Int?
    var denom: Int?
    var unit: String?
    
}

//Represents a new ingredient since the ingredient contains JSON Objects and not a string of arrary. Matches the data from json
