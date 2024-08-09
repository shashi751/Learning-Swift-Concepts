//
//  SwiftConceptsModel.swift
//  Learning Swift Concepts
//
//  Created by Shashi Gupta on 08/08/24.
//

import Foundation

struct SwiftConceptsModel:Identifiable, Codable{
    var id:String = UUID().uuidString
    var name:String
    var identifier:SwiftConceptsEnum
}
