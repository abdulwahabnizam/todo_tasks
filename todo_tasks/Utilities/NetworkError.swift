//
//  enums.swift
//  todo_tasks
//
//  Created by apple on 30/06/2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidData
    case invalidResponse
    case message(String)
}
