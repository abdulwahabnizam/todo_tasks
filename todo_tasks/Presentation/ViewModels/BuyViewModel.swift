//
//  BuyViewModel.swift
//  todo_tasks
//
//  Created by apple on 29/06/2024.
//

import Foundation
import Combine

class BuyViewModel: ObservableObject {
    @Published var buy: [BuyModel] = []
    @Published var errorMessage: String?
    private var buyRepository: BuyRepositoryProtocol?

    init(buyRepository: BuyRepositoryProtocol) {
        self.buyRepository = buyRepository
    }
    
    func fetchBuy(from urlString: String) {
        buyRepository?.fetchBuyList(url: urlString) { [weak self] result in
            switch result {
                case .success(let buy):
                    self?.buy = buy
                    print("Fetched buy list:", buy)
                case .failure(let error):
                    print("Error fetching buy list:", error.localizedDescription)
                    let error = self?.handleError(error)
                    print(error)
            }
        }
    }
    private func handleError(_ error: Error) -> String {
        switch error {
        case is URLError:
            return "Failed to connect to the server."
        case is DecodingError:
            return "Failed to decode the response."
        case let error as NetworkError:
            switch error {
            case .invalidURL:
                return "Invalid URL."
            case .invalidData:
                return "Invalid data."
            case .invalidResponse:
                return "Invalid response from server."
            case .message(let message):
                return message
            }
        default:
            return error.localizedDescription
        }
    }
}
