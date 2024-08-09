//
//  LooseCoupleViewModel.swift
//  Learning Swift Concepts
//
//  Created by Shashi Gupta on 09/08/24.
//

import Foundation


class LooseCoupleViewModel: ObservableObject{
    
    @Published var users = [UserModel]()
    @Published var errorMessage = String()
    
    let userRepository : UserReositoryDelegate
    
    init(userRepository: UserReositoryDelegate=UserReository()) {
        self.userRepository = userRepository
    }
    
    func fetchUsers(){
        fetchJSONUsers()
//        fetchGitHubUSers()
    }
    
    private func fetchJSONUsers(){
        userRepository.fetchJSONUsersUsers(type: [ResponseElement].self) {[weak self] result in
            
            switch result{
            case .success(let users):
                DispatchQueue.main.async {
                    self?.users = self?.convertResponseElementToUserModel(input: users) ?? []
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.errorMessage = error.localizedDescription
                }
                print(error)
            }
        }
    }
    
    private func fetchGitHubUSers(){
        
        userRepository.fetchGitHUbUsers(type: [GitHubUser].self) {[weak self] result in
            
            switch result{
            case .success(let users):
                DispatchQueue.main.async {
                    self?.users = self?.convertResponseElementToUserModel(input: users) ?? []
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.errorMessage = error.localizedDescription
                }
                print(error)
            }
        }
    }
    
    private func convertResponseElementToUserModel(input:[ResponseElement]) -> [UserModel]{
        var users = [UserModel]()
        for item in input{
            users.append(UserModel(id: item.id, name: item.name))
        }
        return users
    }
    
    private func convertResponseElementToUserModel(input:[GitHubUser]) -> [UserModel]{
        var users = [UserModel]()
        for item in input{
            users.append(UserModel(id: item.id, name: item.login))
        }
        return users
    }
}
