//
//  StoryboardHelper.swift
//  todo_tasks
//
//  Created by apple on 30/06/2024.
//

import Foundation
import UIKit

class StoryboardHelper {

    static let shared = StoryboardHelper()
    
    private init() {}
    
    func instantiateViewController<T: UIViewController>(fromStoryboard name: String, withIdentifier identifier: String, inBundle bundle: Bundle? = nil) -> T? {
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        return storyboard.instantiateViewController(withIdentifier: identifier) as? T
    }
    
    func pushViewController(fromStoryboard name: String, withIdentifier identifier: String, on navigationController: UINavigationController?, inBundle bundle: Bundle? = nil, animated: Bool = true) {
        if let viewController = instantiateViewController(fromStoryboard: name, withIdentifier: identifier, inBundle: bundle) as UIViewController? {
            navigationController?.pushViewController(viewController, animated: animated)
        }
    }
}
