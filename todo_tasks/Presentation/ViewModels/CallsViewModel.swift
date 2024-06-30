//
//  CallsViewModel.swift
//  todo_tasks
//
//  Created by apple on 29/06/2024.
//

import Foundation
import Combine

class CallsViewModel: ObservableObject {
    @Published var calls: [CallsModel] = []
    private var callsRepository: CallsRepositoryProtocol?
    @Published var errorMessage: String?

    init(callsRepository: CallsRepositoryProtocol) {
        self.callsRepository = callsRepository
    }
    
    func fetchCalls(from urlString: String) {
        callsRepository?.fetchCallsList(url: urlString) { [weak self] result in
            switch result {
                case .success(let calls):
                    self?.calls = calls
                    print("Fetched calls:", calls)
                case .failure(let error):
                    // Handle the error case
                    print("Error fetching calls:", error.localizedDescription)
                    let error = self?.handleError(error)
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
