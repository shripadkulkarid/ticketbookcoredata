//
//  Model.swift
//  MovieTicketBook
//
//  Created by Samvidya Edutech LLP on 21/08/18.
//  Copyright © 2018 Samvidya Edutech LLP. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController{
    
    
    func getViewControllerFromStoryBoard(storyBoardName:String? = "",identifier : String? = "") -> UIViewController?{
        
        let viewController : UIViewController? = UIStoryboard(name: storyBoardName!, bundle: nil).instantiateViewController(withIdentifier: identifier!)
        guard  (viewController != nil) else {
            return nil
        }
        return viewController
    }
    
  
}
extension UIView {
    
    func dropShadow() {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 1
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        
        self.layer.rasterizationScale = UIScreen.main.scale
        
    }
    
    func viewDropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 3
    }
    
    
    
    
    
    
}
