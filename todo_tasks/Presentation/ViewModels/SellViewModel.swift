//
//  SellViewModel.swift
//  todo_tasks
//
//  Created by apple on 29/06/2024.
//

import Foundation

class SellViewModel: ObservableObject {
    @Published var sell: [ItemToSell] = []
    @Published var errorMessage: String?
    private var sellRepository: SellRepositoryProtocol?

    init(sellRepository: SellRepositoryProtocol) {
        self.sellRepository = sellRepository
    }
    
    func fetchSell() {
        sellRepository?.fetchSellList() { [weak self] result in
            switch result {
            case .success(let items):
                self?.sell = items
            case .failure(let error):
                print("Error fetching items: \(error)")
            }
        }
    }
    func createSell() {
        self.sellRepository?.createSellList()
    }
}
