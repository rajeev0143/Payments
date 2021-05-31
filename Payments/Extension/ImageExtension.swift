//
//  ImageExtension.swift
//  Payments
//
//  Created by Rajeev on 31/05/21.
//

import Foundation

import UIKit

extension UIImageView
{
    func downloadFrom(url:String?)
    {
        contentMode = .scaleAspectFit
        if let url = URL(string: url!)
        {
            URLSession.shared.dataTask(with: url as URL, completionHandler: { (data, _, error) -> Void in
                guard let data = data, error == nil else {
                    print("\nerror on download \(String(describing: error?.localizedDescription))")
                    return
                }
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
                
            }).resume()
        }
       
    }
}
