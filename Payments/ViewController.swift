//
//  ViewController.swift
//  Payments
//
//  Created by Rajeev on 31/05/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var paymentsViewModel : PaymentsViewModel!
    private var dataSource : TableViewDataSource<TableViewCell,PaymentMethod>!

    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
        
    }
    
    func callToViewModelForUIUpdate(){
        
        self.paymentsViewModel =  PaymentsViewModel()
        self.paymentsViewModel.bindViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource(){
        
        self.dataSource = TableViewDataSource(cellIdentifier: "TableViewCell", items: self.paymentsViewModel.empData.networks.applicable, configureCell: { (cell, evm) in
            
            cell.logoImageView?.downloadFrom(url: evm.links.logo)
            cell.nameLabel.text = evm.label
        })
        
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
        }
    }
    
}


