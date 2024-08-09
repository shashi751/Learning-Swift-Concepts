//
//  SwiftConceptsViewModel.swift
//  Learning Swift Concepts
//
//  Created by Shashi Gupta on 08/08/24.
//

import Foundation

enum SwiftConceptsEnum:String, Codable {
    case weakVsUnOwned = "Weak vs Unowned vs Strong"
    case solidPrinciple = "Solid Principles"
    case deferKeyword = "Defer in iOS"
    case clouser = "Escaping & Non Escaping Clouser"
    case frameVsBounds = "Frame Vs Bounds"
    case jsonParsing = "JSON Data parsing"
    case kVOAndKVC = "KVO and KVC"
    case initializers = "Designated || Convience || Failable || Required Initializer"
    case interviewProgrammingProblums = "Interview Programming Problum"
    case looseCoupling = "Loose vs Tight Coupling"
    
}

class SwiftConceptsViewModel:ObservableObject{
    
    @Published var concepts : [SwiftConceptsModel] = [SwiftConceptsModel]()
    
    func getConcepts(){
        var concepts = [SwiftConceptsModel]()
        concepts.append(SwiftConceptsModel(id: "0", name: SwiftConceptsEnum.interviewProgrammingProblums.rawValue, identifier: .interviewProgrammingProblums))
        concepts.append(SwiftConceptsModel(id: "1", name: SwiftConceptsEnum.weakVsUnOwned.rawValue, identifier: .weakVsUnOwned))
        concepts.append(SwiftConceptsModel(id: "2", name: SwiftConceptsEnum.solidPrinciple.rawValue, identifier: .solidPrinciple))
        concepts.append(SwiftConceptsModel(id: "3", name: SwiftConceptsEnum.clouser.rawValue, identifier: .clouser))
        concepts.append(SwiftConceptsModel(id: "4", name: SwiftConceptsEnum.frameVsBounds.rawValue, identifier: .frameVsBounds))
        concepts.append(SwiftConceptsModel(id: "5", name: SwiftConceptsEnum.jsonParsing.rawValue, identifier: .jsonParsing))
        concepts.append(SwiftConceptsModel(id: "6", name: SwiftConceptsEnum.kVOAndKVC.rawValue, identifier: .kVOAndKVC))
        concepts.append(SwiftConceptsModel(id: "7", name: SwiftConceptsEnum.initializers.rawValue, identifier: .initializers))
        concepts.append(SwiftConceptsModel(id: "8", name: SwiftConceptsEnum.looseCoupling.rawValue, identifier: .looseCoupling))
        concepts.append(SwiftConceptsModel(id: "9", name: SwiftConceptsEnum.deferKeyword.rawValue, identifier: .deferKeyword))
        
        self.concepts = concepts
    }
}
