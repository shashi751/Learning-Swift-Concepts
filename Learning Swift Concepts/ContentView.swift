//
//  ContentView.swift
//  Learning Swift Concepts
//
//  Created by Shashi Gupta on 08/08/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = SwiftConceptsViewModel()
    
    var body: some View {
        VStack {
            NavigationView(content: {
                List(self.viewModel.concepts) { concept in
                    NavigationLink(destination: destinationView(concept: concept)) {
                        ConceptRowView(concept: concept)
                    }
                }
                
                .navigationTitle("Swift Concepts")
            })
        }
        .onAppear(){
            viewModel.getConcepts()
        }
        .padding()
    }
}

func destinationView(concept:SwiftConceptsModel) -> some View{
    
    switch concept.identifier {
        
    case .weakVsUnOwned:
        LooseCoupleView()
        
    case .solidPrinciple:
        LooseCoupleView()
        
    case .deferKeyword:
        LooseCoupleView()
        
    case .clouser:
        LooseCoupleView()
        
    case .frameVsBounds:
        LooseCoupleView()
        
    case .jsonParsing:
        LooseCoupleView()
        
    case .kVOAndKVC:
        LooseCoupleView()
        
    case .initializers:
        LooseCoupleView()
        
    case .interviewProgrammingProblums:
        LooseCoupleView()
        
    case .looseCoupling:
        LooseCoupleView()
    }
}

//#Preview {
//    ContentView()
//}
