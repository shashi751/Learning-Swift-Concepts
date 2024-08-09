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
    
    var body: some View {
        VStack{
            
            if !looseCoupleViewModel.errorMessage.isEmpty{
                Text(looseCoupleViewModel.errorMessage)
                    .padding()
            }
            else{
                List(looseCoupleViewModel.users) { user in
                    Text(user.title)
                }
                .navigationTitle(Text(title))
                .listStyle(PlainListStyle())
                .navigationBarTitleDisplayMode(.inline)
                
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
