//
//  BuyListVC.swift
//  todo_tasks
//
//  Created by apple on 30/06/2024.
//

import UIKit
import Combine

class BuyListVC: UIViewController {
    @IBOutlet weak var buyTableView: UITableView!
    var buyViewModel : BuyViewModel?
    var buyList: [BuyModel] = []
    private var cancellables = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buyViewModel = BuyViewModel(buyRepository: BuyRepository())
        buyViewModel?.fetchBuy(from: "https://my-json-server.typicode.com/imkhan334/demo-1/buy")
        
        buyViewModel?.$buy
        .sink { [weak self] buyList in
            print(buyList.count)
            self?.buyList = buyList
            DispatchQueue.main.async {
                self?.buyTableView.reloadData()
            }
        }
        .store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
}
extension BuyListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.buyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let callsCell = self.buyTableView.dequeueReusableCell(withIdentifier: "BuyCell") as? BuyCell
        callsCell?.nameLbl.text = self.buyList[indexPath.row].name ?? "-"
        callsCell?.priceLbl.text  = String(describing: self.buyList[indexPath.row].price ?? 0)
        callsCell?.quantityLbl.text  = String(describing: self.buyList[indexPath.row].quantity ?? 0)
        return callsCell!
    }
}
