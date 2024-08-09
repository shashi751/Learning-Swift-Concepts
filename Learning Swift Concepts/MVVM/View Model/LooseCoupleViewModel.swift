//
//  LooseCoupleViewModel.swift
//  Learning Swift Concepts
//
//  Created by Shashi Gupta on 09/08/24.
//

import Foundation


class LooseCoupleViewModel: ObservableObject{
    
    @Published var users = [JSONPlaceholderUser]()
    @Published var errorMessage = String()
    
    let networkmanager : NetworkManagerDelegate
    
    init(networkmanager: NetworkManagerDelegate=URLSessionNetworkManager()) {
        self.networkmanager = networkmanager
    }
    
    func fetchUsers(){
        
        networkmanager.fetchRequest(type: [JSONPlaceholderUser].self) { result in
            
            switch result{
            case .success(let users):
                DispatchQueue.main.async {
                    self.users = users
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
                print(error)
            }
        }
    }
}
