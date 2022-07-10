//
//  BreedManager.swift
//  TheDogApp
//
//  Created by Joao Barros on 10/07/22.
//

//import Foundation
//
//struct BreedManager {
//
//    func fetchBreed(){
//        let urlString = "https://api.thedogapi.com/v1/breeds?api_key=890279e4-5446-4738-9f75-2388912d70f7&order=ASC"
//        performRequest(urlString: urlString)
//    }
//
//    func performRequest(urlString: String){
//        if let url = URL(string: urlString){
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { (data, response, error) in
//                if error != nil{ // Usar aqui o modo offline, recuperando dados do CoreData por exemplo
//                    print(error!)
//                    return
//                }
//                if let safeData = data {
//                    self.parseJSON(breedData: safeData)
//                }
//            }
//            task.resume()
//        }
//
//    }
//    func parseJSON(breedData: Data) {
//        do {
//            if let decodedData: [[String:Any]] = try? JSONSerialization.jsonObject(with: breedData, options: .fragmentsAllowed) as? [[String:Any]] {
//                print(decodedData.count)
//                print("SUCESOO DEU CERTO \(decodedData[0]) ")
//            }
//        } catch  {
//            print("Deu PAU \(error)")
//        }
//    }
//}
//
//
//
