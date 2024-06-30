//
//  SellRepository.swift
//  todo_tasks
//
//  Created by apple on 29/06/2024.
//

import Foundation

class SellRepository: SellRepositoryProtocol {
    func fetchSellList(completion: @escaping (Result<[ItemToSell], Error>) -> Void) {
        do {
            guard let result = try PersistantStorage.shared.context.fetch(ItemToSell.fetchRequest()) as? [ItemToSell] else {
                completion(.failure(NSError(domain: "No data found!", code: -1, userInfo: nil)))
            }
            completion(.success(result))
        } catch let error {
            completion(.failure(NSError(domain: error.localizedDescription, code: -1, userInfo: nil)))
        }
    }
    
    func createSellList() {
        let context = PersistantStorage.shared.context
        
        let itemsData = [
            ("Table", 12000, 1, 2),
            ("TV", 38000, 2, 2),
            ("iPhoneX", 150000, 1, 2)
        ]
        
        var itemsToSell: [ItemToSell] = []
        
        for itemData in itemsData {
            let itemToSell = ItemToSell(context: context)
            itemToSell.name = itemData.0
            itemToSell.price = Int32(itemData.1)
            itemToSell.quantity = Int32(itemData.2)
            itemToSell.type = Int32(itemData.3)
            itemsToSell.append(itemToSell)
        }
        
        do {
            try context.save()
            print("Items successfully saved.")
        } catch {
            print("Failed to save items: \(error)")
        }
    }
}
