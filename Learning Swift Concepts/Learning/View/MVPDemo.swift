//
//  MVPDemo.swift
//  Learning Swift Concepts
//
//  Created by Shashi Gupta on 09/08/24.
//

import SwiftUI

struct MVPDemo: View {
   
    @State var title = String()
    @State var userName = String()
    @ObservedObject var presenter:Presenter = Presenter()
    
    var body: some View {
        
        VStack{
            Text("Modal View Presenter")
                .font(.system(size: 22, weight: .bold))
                .padding()
            
            Text("\(presenter.userModel?.name ?? "")")
            Spacer()
        }
        .onAppear(){
            presenter.fetchUsers()
        }
        .navigationTitle(title)
    }
}

//#Preview {
//    MVPDemo()
//}
