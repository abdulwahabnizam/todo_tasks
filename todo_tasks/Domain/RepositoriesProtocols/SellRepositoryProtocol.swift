//
//  SellRepository.swift
//  todo_tasks
//
//  Created by apple on 29/06/2024.
//

import Foundation

protocol SellRepositoryProtocol {
    func createSellList();
    func fetchSellList(completion: @escaping (Result<[ItemToSell], Error>) -> Void);
}
