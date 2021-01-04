//
//  UIViewController+Extensions.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 3/01/21.
//

import UIKit

fileprivate var containerLoading: UIView?

//MARK: - Show activity indicator
extension UIViewController {
    func showLoading () {
        containerLoading = UIView(frame: view.bounds)
        containerLoading?.backgroundColor = .lightGray
        
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = containerLoading!.center
        activityIndicator.startAnimating()
        containerLoading?.addSubview(activityIndicator)
        self.view.addSubview(containerLoading!)
    }
    
    func hideLoading () {
        DispatchQueue.main.async {
            containerLoading?.removeFromSuperview()
            containerLoading = nil
        }
    }
}
