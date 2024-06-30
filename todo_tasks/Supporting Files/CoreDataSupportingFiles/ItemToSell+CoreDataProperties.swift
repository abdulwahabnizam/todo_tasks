//
//  ItemToSell+CoreDataProperties.swift
//  todo_tasks
//
//  Created by apple on 30/06/2024.
//
//

import Foundation
import CoreData


extension ItemToSell {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemToSell> {
        return NSFetchRequest<ItemToSell>(entityName: "ItemToSell")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var price: Int32
    @NSManaged public var quantity: Int32
    @NSManaged public var type: Int32

}

extension ItemToSell : Identifiable {

}
