//
//  BuyRepository.swift
//  todo_tasks
//
//  Created by apple on 29/06/2024.
//

import Foundation

protocol BuyRepositoryProtocol {
    func fetchBuyList(url: String?,completion: @escaping (Result<[BuyModel], Error>) -> Void);
}
