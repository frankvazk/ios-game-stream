//
//  EditUserProfileViewModel.swift
//  GameStream
//
//  Created by Francisco Vazquez on 23/02/22.
//

import Foundation

class EditUserProfileViewModel {
    func save(_ user: User) -> Bool {
        print("Dentro de la función guardar datos obtuve: \(user.username) + \(user.password) +  \(user.email)")
        if let encodedData = try? JSONEncoder().encode(user){
            UserDefaults.standard.set(encodedData, forKey: "userData")
                    
            return true
        }
            
        return false
    }
    
    func getUserData() -> User? {
        if let userData = UserDefaults.standard.object(forKey: "userData") as? Data {
            if let decodedData:User = try? JSONDecoder().decode(User.self, from: userData){
                print("Correo: \(decodedData.email)")
                
                return decodedData
            }
        }
        print("No se recuperaron datos")
        return nil
    }
}
