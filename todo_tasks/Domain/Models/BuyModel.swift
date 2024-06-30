//
//  BuyModel.swift
//  todo_tasks
//
//  Created by apple on 29/06/2024.
//

import Foundation

struct BuyModel: Decodable {
    var id: Int?
    var name: String?
    var price: Int?
    var quantity: Int?
    var type: Int?
    
    enum CodingKeys: String, CodingKey {
      case id
      case name
      case price
      case quantity
      case type
    }
}
