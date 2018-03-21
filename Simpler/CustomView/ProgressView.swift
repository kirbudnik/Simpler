//
//  ProgressView.swift
//  Qdispatch
//
//  Created by PSIHPOK on 2/14/17.
//  Copyright © 2017 qdispatch. All rights reserved.
//

import Foundation
import UIKit
import JGProgressHUD

class ProgressView {
    
    private static var progressHUD:JGProgressHUD? = nil
    private static let DEFAULT_DELAY:TimeInterval = 3.0
    
    init() {
        
    }
    
    static func showToast(view:UIView, message:String, duration:TimeInterval = 0) {
        dismissProgressView()
        progressHUD = JGProgressHUD(style: .dark)
        progressHUD?.indicatorView = nil
        progressHUD?.textLabel.text = message
        progressHUD?.show(in: view)
        if duration == 0 {
            progressHUD?.dismiss(afterDelay: ProgressView.DEFAULT_DELAY)
        }
        else {
            progressHUD?.dismiss(afterDelay: duration)
        }
        
        
    }
    
    static func changeMessage(message:String) {
        if progressHUD != nil {
            progressHUD?.textLabel.text = message
        }
    }
    
    static func showProgressView(view:UIView, message:String? = nil) {
        dismissProgressView()
        progressHUD = JGProgressHUD(style: .dark)
        progressHUD?.textLabel.text = message
        progressHUD?.show(in: view)
    }
    
    static func dismissProgressView(completion:(() -> Void)? = nil) {
        if progressHUD != nil {
            progressHUD?.dismiss()
            
            if completion != nil {
                completion!()
            }
        }
    }
    
    static func showAlert(viewController:UIViewController, title:String? = nil, message:String, activeTitle:String? = nil, activeAction: ((UIAlertAction) -> Void)? = nil, deactiveTitle:String? = nil, deactiveAction: ((UIAlertAction) -> Void)? = nil, completion:(() -> Void)? = nil) {
        dismissProgressView()
        let alertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if activeTitle != nil {
            let active = UIAlertAction(title: activeTitle, style: .default, handler: activeAction)
            alertController.addAction(active)
        }
        
        if deactiveTitle != nil {
            let deactive = UIAlertAction(title: deactiveTitle, style: .cancel, handler: deactiveAction)
            alertController.addAction(deactive)
        }
        
        if activeTitle == nil && deactiveTitle == nil {
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
        }
        
        viewController.present(alertController, animated: true, completion: completion)
    }
    
}
