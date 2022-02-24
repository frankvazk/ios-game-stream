//
//  EditUserProfileViewModel.swift
//  GameStream
//
//  Created by Francisco Vazquez on 23/02/22.
//

import Foundation

class EditUserProfileViewModel {
    func save(_ user: User) -> Bool {
        if let encodedData = try? JSONEncoder().encode(user){
            UserDefaults.standard.set(encodedData, forKey: "userData")
                    
            return true
        }
            
        return false
    }
    
    func getUserData() -> User? {
        if let userData = UserDefaults.standard.object(forKey: "userData") as? Data {
            if let decodedData:User = try? JSONDecoder().decode(User.self, from: userData){                
                return decodedData
            }
        }
        print("No se recuperaron datos")
        return nil
    }
    
    func login(_ user : User ) -> Bool? {
        if let savedUser = self.getUserData() {
            if savedUser.email == user.email && savedUser.password == user.password{
                return true
            }
            else{
                return false
                
            }
        }
        
        return nil
    }
}
