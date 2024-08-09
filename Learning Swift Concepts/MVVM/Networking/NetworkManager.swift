//
//  NetworkManager.swift
//  Learning Swift Concepts
//
//  Created by Shashi Gupta on 09/08/24.
//

import Foundation
import Alamofire

enum NetworkingError:Error{
    case badURL
    case unknown
    case noData
}

protocol NetworkManagerDelegate{
    func fetchRequest<T:Codable>(type:T.Type, completion:@escaping (Result<T, NetworkingError>) -> Void)
}

class NetworkManager{
    
    var networkManagerDelegate:NetworkManagerDelegate
    
    init(networkManagerDelegate: NetworkManagerDelegate) {
        self.networkManagerDelegate = networkManagerDelegate
    }
    
    func fetchRequest<T:Codable>(type:T.Type, completion:@escaping (Result<T, NetworkingError>) -> Void){
        
        networkManagerDelegate.fetchRequest(type: type, completion: completion)
    }
}

class AlamofireNetworkManager: NetworkManagerDelegate{
    
    func fetchRequest<T:Codable>(type:T.Type, completion:@escaping (Result<T, NetworkingError>) -> Void){
        
        AF.request("https://jsonplaceholder.typicode.com/posts", interceptor: .none).response { response in
            
            guard let data = response.data else{
                completion(.failure(.badURL))
                return
            }
            
            do{
                let users = try JSONDecoder().decode(type, from: data)
                completion(.success(users))
                
            }
            catch let error{
                print(error)
                completion(.failure(.unknown))
            }
        }
    }
}

class URLSessionNetworkManager: NetworkManagerDelegate{
    
    func fetchRequest<T:Codable>(type:T.Type, completion:@escaping (Result<T, NetworkingError>) -> Void){
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else{
            completion(.failure(.badURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.method = .get
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if error != nil{
                completion(.failure(.unknown))
                return
            }
            
            guard let data = data else{
                completion(.failure(.noData))
                return
            }
            
            do{
                let modal = try JSONDecoder().decode(type, from: data)
                completion(.success(modal))
            }
            catch let error{
                print(error)
                completion(.failure(.unknown))
            }
            
        }
        .resume()
    }
}
