//
//  CallRepository.swift
//  todo_tasks
//
//  Created by apple on 29/06/2024.
//

import Foundation

protocol CallsRepositoryProtocol {
    func fetchCallsList(url: String?,completion: @escaping (Result<[CallsModel], Error>) -> Void);
}
