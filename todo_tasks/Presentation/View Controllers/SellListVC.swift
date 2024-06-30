//
//  SellListVC.swift
//  todo_tasks
//
//  Created by apple on 30/06/2024.
//

import UIKit
import Combine

class SellListVC: UIViewController {
    @IBOutlet weak var sellTableView: UITableView!
    var sellViewModel: SellViewModel?
    var sellItem: [ItemToSell]?
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sellViewModel = SellViewModel(sellRepository: SellRepository())
//        sellViewModel?.createSell()
        sellViewModel?.fetchSell()
        sellViewModel?.$sell.sink { [weak self] sellItems in
            self?.sellItem = sellItems
            DispatchQueue.main.async {
                self?.sellTableView.reloadData()
            }
        }
        .store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
}

extension SellListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.sellItem?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sellCells = sellTableView.dequeueReusableCell(withIdentifier: "SellCells") as? SellCells
        sellCells?.nameLbl.text = sellItem?[indexPath.row].name ?? ""
        sellCells?.priceLbl.text = String(describing: sellItem?[indexPath.row].price ?? 0)
        sellCells?.quantityLbl.text = String(describing: sellItem?[indexPath.row].quantity ?? 0)
        sellCells?.typeLbl.text = String(describing: sellItem?[indexPath.row].type ?? 0)
        return sellCells!
    }
}
