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
                .navigationBarTitleDisplayMode(.inline)
                .listStyle(PlainListStyle())
                .navigationTitle("Swift Concepts")
            })
        }
        .onAppear(){
            viewModel.getConcepts()
        }
        .padding()
    }
}

func destinationView(concept: SwiftConceptsModel) -> some View {
    
    switch concept.identifier {
    case .looseCoupling:
        return AnyView(LooseCoupleView(title: concept.name))

    case .solidPrinciple,
         .deferKeyword,
         .clouser,
         .frameVsBounds,
         .jsonParsing,
         .kVOAndKVC,
         .initializers,
         .interviewProgrammingProblums,
         .weakVsUnOwned:
        return AnyView(EmptyView())
    }
}


//#Preview {
//    ContentView()
//}
