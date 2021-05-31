//
//  PaymentMethods.swift
//  Payments
//
//  Created by Rajeev on 31/05/21.
//

import Foundation

struct PaymentMethods: Decodable {
    var networks : Applicable
}
struct Applicable : Decodable{
    var applicable : [PaymentMethod]
}

struct PaymentMethod: Decodable {
    var code : String?
    var label : String?
    var method : String?
    var links : Links
}

struct Links : Decodable{
    var logo : String?
}
