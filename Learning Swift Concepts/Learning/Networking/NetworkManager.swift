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
    case decodingError
}

protocol NetworkManagerDelegate{
    func fetchRequest<T:Codable>(type:T.Type, url:String, completion:@escaping (Result<T, NetworkingError>) -> Void)
}

class NetworkManager{
    
    var networkManagerDelegate:NetworkManagerDelegate
    
    init(networkManagerDelegate: NetworkManagerDelegate) {
        self.networkManagerDelegate = networkManagerDelegate
    }
    
    func fetchRequest<T:Codable>(type:T.Type, url:String, completion:@escaping (Result<T, NetworkingError>) -> Void){
        
        networkManagerDelegate.fetchRequest(type: type, url:url, completion: completion)
    }
}

class AlamofireNetworkManager: NetworkManagerDelegate{
    
    var responseHandler:ResponseHandlerDelegate
    
    init(responseHandler: ResponseHandlerDelegate = ResponseHandler()) {
        self.responseHandler = responseHandler
    }
    
    
    func fetchRequest<T:Codable>(type:T.Type, url:String, completion:@escaping (Result<T, NetworkingError>) -> Void){
        
        AF.request(url, interceptor: .none).response { response in
            
            guard let data = response.data else{
                completion(.failure(.badURL))
                return
            }
            
            self.responseHandler.getModelFromResponse(data: data, type: type) { result in
                
                switch result{
                case .success(let model):
                    completion(.success(model))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}

class URLSessionNetworkManager: NetworkManagerDelegate{
    
    var responseHandler:ResponseHandlerDelegate
    
    init(responseHandler: ResponseHandlerDelegate = ResponseHandler()) {
        self.responseHandler = responseHandler
    }
    
    func fetchRequest<T:Codable>(type:T.Type, url:String, completion:@escaping (Result<T, NetworkingError>) -> Void){
        
        guard let url = URL(string: url) else{
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
            
            self.responseHandler.getModelFromResponse(data: data, type: type) { result in
                
                switch result{
                case .success(let model):
                    completion(.success(model))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
            
        }
        .resume()
    }
}

/// Create interface for Response Handler
protocol ResponseHandlerDelegate{
    
    func getModelFromResponse<T:Codable>(data:Data, type:T.Type, completion:@escaping(Result<T, NetworkingError>) -> Void)
}

class ResponseHandler:ResponseHandlerDelegate{
    
    func getModelFromResponse<T:Codable>(data: Data, type: T.Type, completion: @escaping (Result<T, NetworkingError>) -> Void){
        
        do{
            let model = try JSONDecoder().decode(type, from: data)
            completion(.success(model))
        }
        catch{
            completion(.failure(NetworkingError.decodingError))
        }
        
    }
    
}
