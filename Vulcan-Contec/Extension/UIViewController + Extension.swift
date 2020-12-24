//
//  UIViewController + Extension.swift
//  Vulcan-Contec
//
//  Created by Prabu on 21/12/20.
//  Copyright © 2020 Prabu. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    class func instantiateFromStoryboard(_ name: String) -> Self
    {
        return instantiateFromStoryboardHelper(name)
    }
    
    fileprivate class func instantiateFromStoryboardHelper<T>(_ name: String) ->
        T
    {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier:
        "DashboardViewController") as! T
        
        return controller
    }
}
