//
//  Presenter.swift
//  Learning Swift Concepts
//
//  Created by Shashi Gupta on 09/08/24.
//

import Foundation

class Presenter:ObservableObject{
    
    @Published var userModel : UserModel?
    
    let userRepository:UserReositoryDelegate
    init(userRepository: UserReositoryDelegate = UserReository()) {
        self.userRepository = userRepository
    }
    
    func fetchUsers(){
        
        userRepository.fetchJSONUsersUsers(type: [ResponseElement].self) {[weak self] result in
            
            switch result{
            case .success(let model):
                print(model)
                if let user = self?.convertListInUserModel(list: model).first{
                    self?.userModel = user
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func convertListInUserModel(list:[ResponseElement]) -> [UserModel]{
        var users = [UserModel]()
        for item in list{
            users.append(UserModel(id: item.id, name: item.name))
        }
        return users
    }
}


