//
//  CallsModel.swift
//  todo_tasks
//
//  Created by apple on 29/06/2024.
//

import Foundation

struct CallsModel: Decodable {
    var id: Int?
    var name: String?
    var number: String?
    
     enum CodingKeys: String, CodingKey {
       case id
       case name
       case number
     }
}
