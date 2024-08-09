//
//  ConceptRowView.swift
//  Learning Swift Concepts
//
//  Created by Shashi Gupta on 08/08/24.
//

import SwiftUI

struct ConceptRowView: View {
    
    var concept:SwiftConceptsModel
    
    var body: some View {
        HStack(alignment:.center){
            Text(concept.name)
        }
        
    }
}

//#Preview {
//    ConceptRowView(concept: SwiftConceptsModel(id: "1", name: "Loose Coupling", identifier: .looseCoupling))
//}
