//
//  ViewController.swift
//  todo_tasks
//
//  Created by Spark Solutionz Inc on 28/06/2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func callsListAction(_ sender: Any) {
        StoryboardHelper.shared.pushViewController(fromStoryboard: "Main", withIdentifier: "CallsListVC", on: navigationController)
    }
    
    @IBAction func buyListAction(_ sender: Any) {
        StoryboardHelper.shared.pushViewController(fromStoryboard: "Main", withIdentifier: "BuyListVC", on: navigationController)
    }
    
    @IBAction func sellListAction(_ sender: Any) {
        StoryboardHelper.shared.pushViewController(fromStoryboard: "Main", withIdentifier: "SellListVC", on: navigationController)
    }
}

