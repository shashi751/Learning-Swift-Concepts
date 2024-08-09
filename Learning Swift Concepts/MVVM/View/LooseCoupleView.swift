//
//  LooseCoupleView.swift
//  Learning Swift Concepts
//
//  Created by Shashi Gupta on 09/08/24.
//

import SwiftUI


struct LooseCoupleView: View {
    
    @ObservedObject var looseCoupleViewModel = LooseCoupleViewModel()
    @State var title = String()
    
    var looseCoupleText = """

In SwiftUI, the LooseCoupleView is designed to use a LooseCoupleViewModel to handle its business logic. The LooseCoupleViewModel interacts with the UserRepository class through an interface, UserRepositoryDelegate, rather than directly depending on it. This approach ensures that the view model does not have a direct dependency on the UserRepository class.

Similarly, the UserRepository communicates with the NetworkManager class through the NetworkManagerDelegate protocol. This means that the UserRepository does not directly depend on the NetworkManager, maintaining a clean separation of concerns.

By using protocols to define these interactions, we achieve loose coupling between components. This design pattern enhances modularity and testability, as each component can be tested and replaced independently without affecting others.

In summary, this approach demonstrates the benefits of using protocols in Swift to decouple components and avoid tight coupling, leading to a more maintainable and flexible codebase.

Key Points:
    1. Loose Coupling: Components are decoupled through protocols, making the code more modular and easier to test.
    2. Protocols for Abstraction: The UserRepositoryDelegate and NetworkManagerDelegate protocols abstract the dependencies, allowing different implementations to be swapped in and out.
    3. Modular Design: The LooseCoupleViewModel handles business logic without directly depending on the UserRepository, which in turn does not directly depend on the NetworkManager.
    This revised explanation should more accurately reflect the principles of loose coupling and protocol-based communication in Swift.

"""
    
    var body: some View {
        VStack{
            
            if !looseCoupleViewModel.errorMessage.isEmpty{
                Text(looseCoupleViewModel.errorMessage)
                    .padding()
            }
            else{
                
                VStack{
                    
                    List(looseCoupleViewModel.users, id: \.id) { user in
                        Text(user.name.capitalized)
                            .fontWeight(.bold)
                            .foregroundStyle(.brown)
                    }
                    .navigationTitle(Text(title))
                    .listStyle(PlainListStyle())
                    .navigationBarTitleDisplayMode(.inline)
                    
                    
                    HStack{
                        InfoButton(content: looseCoupleText)
                        Text("Check code for more details of concept.")
                    }
                }
                
            }
            
        }
        .onAppear(){
            looseCoupleViewModel.fetchUsers()
        }
    }
}

#Preview {
    LooseCoupleView()
}
