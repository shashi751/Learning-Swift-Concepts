//
//  UserReository.swift
//  Learning Swift Concepts
//
//  Created by Shashi Gupta on 09/08/24.
//

import Foundation

protocol UserReositoryDelegate{
    func fetchJSONUsersUsers<T:Codable>(type:T.Type, completion:@escaping (Result<T, NetworkingError>) -> Void)
    func fetchGitHUbUsers<T:Codable>(type:T.Type, completion:@escaping (Result<T, NetworkingError>) -> Void)
    
}

class UserReository:UserReositoryDelegate{
   
    
    let networkManager:NetworkManagerDelegate
    
    init(networkManager: NetworkManagerDelegate = AlamofireNetworkManager()) {
        self.networkManager = networkManager
    }
    
    
    func fetchJSONUsersUsers<T>(type: T.Type, completion: @escaping (Result<T, NetworkingError>) -> Void) where T : Decodable, T : Encodable {
        networkManager.fetchRequest(type: type, url: "https://jsonplaceholder.typicode.com/users", completion: completion)
    }
    
    func fetchGitHUbUsers<T>(type: T.Type, completion: @escaping (Result<T, NetworkingError>) -> Void) where T : Decodable, T : Encodable {
        networkManager.fetchRequest(type: type, url: "https://api.github.com/users", completion: completion)
    }
    
}
