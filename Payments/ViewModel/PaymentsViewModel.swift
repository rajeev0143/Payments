//
//  PaymentsViewModel.swift
//  Payments
//
//  Created by Rajeev on 31/05/21.
//

import Foundation

class PaymentsViewModel : NSObject{
    
    private var apiService : APIService!
    private(set) var empData : PaymentMethods! {
        didSet {
            self.bindViewModelToController()
        }
    }
    
    var bindViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService =  APIService()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.apiService.apiToGetData { (empData) in
            self.empData = empData
        }
    }
}
