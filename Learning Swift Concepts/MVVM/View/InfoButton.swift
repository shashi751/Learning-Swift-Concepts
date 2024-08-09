//
//  InfoButton.swift
//  Learning Swift Concepts
//
//  Created by Shashi Gupta on 09/08/24.
//

import SwiftUI

struct InfoButton: View {
    
    var content = ""
    @State var showAlert = false
    
    var body: some View {
        
        // Info Button
        Button {
            showAlert.toggle()
        } label: {
            HStack {
                Image(systemName: "info.circle.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.blue)
            .clipShape(Capsule())
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Information"),
                message: Text(content),
                dismissButton: .default(Text("OK"))
            )
        }
        
    }
}

//#Preview {
//    InfoButton(buttonAction: {
//
//    }, buttonText: "Test")
//}
