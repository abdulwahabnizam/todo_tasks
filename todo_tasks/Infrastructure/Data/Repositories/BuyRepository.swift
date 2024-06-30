//
//  BuyRepository.swift
//  todo_tasks
//
//  Created by apple on 29/06/2024.
//

import Foundation

class BuyRepository: BuyRepositoryProtocol {
    func fetchBuyList(url: String?, completion: @escaping (Result<[BuyModel], Error>) -> Void) {
        guard let url = url else {
            return
        }
        let urlRequest = URLRequest(url: URL(string: url)!)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            do {
                let buyList = try JSONDecoder().decode([BuyModel].self, from: data)
                completion(.success(buyList))
            } catch {
                completion(.failure(NetworkError.message("Some error occured while decoding")))
            }
        }.resume()
    }
}
