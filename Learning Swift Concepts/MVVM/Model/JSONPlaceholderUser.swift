//
//  JSONPlaceholderUser.swift
//  Learning Swift Concepts
//
//  Created by Shashi Gupta on 09/08/24.
//

import Foundation

struct JSONPlaceholderUser:Codable, Identifiable {
    var id, userId : Int
    var title, body: String
}
