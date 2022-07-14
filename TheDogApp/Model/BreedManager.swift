//
//  BreedManager.swift
//  TheDogApp
//
//  Created by Joao Barros on 10/07/22.
//

import Foundation

struct BreedManager {
    
    func fetchBreed() {
        let url = URL(string: "https://api.thedogapi.com/v1/breeds?api_key=890279e4-5446-4738-9f75-2388912d70f7&order=ASC")!
        let urlRequest = NSMutableURLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest as URLRequest) { data, response, error in
            if let data = data {
                
                var name : [String] = []
                var breed_group : [String] = []
                var origin : [String] = []
                var bred_for : [String] = []
                var temperament : [String] = []
                var image : [String] = []
                var id : [Int] = []
                
                do {
                    let dogBreedsResponse = try JSONDecoder().decode([BreedDataModel].self, from: data)
                    
                    print("DADOS ATUALIZADOSS")
                    for i in 0..<dogBreedsResponse.count {
                        name.append(dogBreedsResponse[i].name)
                        UserDefaults.standard.set(name, forKey: "nameKey")
                    }
                    for i in 0..<dogBreedsResponse.count {
                        image.append(dogBreedsResponse[i].image.url)
                        UserDefaults.standard.set(image, forKey: "imageKey")
                    }
                    for i in 0..<dogBreedsResponse.count {
                        if dogBreedsResponse[i].breed_group == nil {
                            breed_group.append("Unknown")
                        }else {
                            breed_group.append(dogBreedsResponse[i].breed_group!)
                            UserDefaults.standard.set(breed_group, forKey: "groupKey")
                        }
                    }
                    for i in 0..<dogBreedsResponse.count {
                        if dogBreedsResponse[i].origin == nil {
                            origin.append("Unknown")
                        }else {
                            origin.append(dogBreedsResponse[i].origin!)
                            UserDefaults.standard.set(origin, forKey: "originKey")
                        }

                    }
                    for i in 0..<dogBreedsResponse.count {
                        if dogBreedsResponse[i].bred_for == nil {
                            bred_for.append("Undefined")
                        }else {
                            bred_for.append(dogBreedsResponse[i].bred_for!)
                            UserDefaults.standard.set(bred_for, forKey: "forKey")
                        }
                    }
                    for i in 0..<dogBreedsResponse.count {
                        if dogBreedsResponse[i].temperament == nil {
                            temperament.append(".")
                        }else {
                            temperament.append(dogBreedsResponse[i].temperament!)
                            UserDefaults.standard.set(temperament, forKey: "tempKey")
                        }
                    }
                    for i in 0..<dogBreedsResponse.count {
                        id.append(i)
                        UserDefaults.standard.set(id, forKey: "idKey")
                    }
                } catch  {
                    print("ERRO ATUALIZANDO DADOS \(error)")
                }
            }
        }.resume()
    }
}
