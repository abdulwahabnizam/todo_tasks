//
//  CallsListVC.swift
//  todo_tasks
//
//  Created by apple on 30/06/2024.
//

import UIKit
import Combine

class CallsListVC: UIViewController {
    @IBOutlet weak var callsTableView: UITableView!
    var callsViewModel : CallsViewModel?
    var calls: [CallsModel] = []
    private var cancellables = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callsViewModel = CallsViewModel(callsRepository: CallsRepository())
        callsViewModel?.fetchCalls(from: "https://my-json-server.typicode.com/imkhan334/demo-1/call")
        
        callsViewModel?.$calls
        .sink { [weak self] calls in
            self?.calls = calls
            DispatchQueue.main.async {
                self?.callsTableView.reloadData()
            }
        }
        .store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
}
extension CallsListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.calls.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let callsCell = self.callsTableView.dequeueReusableCell(withIdentifier: "CallsCell") as? CallsCell
        callsCell?.nameLbl.text = self.calls[indexPath.row].name ?? "-"
        callsCell?.numberLbl.text  = self.calls[indexPath.row].number ?? ""
        return callsCell!
    }
}
