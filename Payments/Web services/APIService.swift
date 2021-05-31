//
//  APIService.swift
//  Payments
//
//  Created by Rajeev on 31/05/21.
//

import Foundation

class APIService{
    
    private let sourcesURL = URL(string: "https://raw.githubusercontent.com/optile/checkout-android/develop/shared-test/lists/listresult.json")!
    
    func apiToGetData(completion : @escaping (PaymentMethods) -> ()){
        
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            
            if let httpStatus = urlResponse as? HTTPURLResponse, httpStatus.statusCode != 200{
                
                switch httpStatus.statusCode {
                case 404:
                    debugPrint("Invalid url")
                case 500:
                    debugPrint("Internal Server Error")
                default:
                    break
                }
                return
            }
            
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let empData = try! jsonDecoder.decode(PaymentMethods.self, from: data)
                completion(empData)
            }
            
        }.resume()
    }
    
}
