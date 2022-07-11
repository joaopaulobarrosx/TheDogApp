//
//  BreedDataModel.swift
//  TheDogApp
//
//  Created by Joao Barros on 10/07/22.
//

import Foundation

struct BreedDataModel: Codable {
    
    let name : String //Breed name
    let breed_group : String? // Breed group
    let origin : String? // Breed origin
    let bred_for: String? // Breed Category
    let temperament : String? // Breed Temperament
    let image: Image // Breed picture

}
struct Image: Codable {

    let url : String // Breed picture

}
