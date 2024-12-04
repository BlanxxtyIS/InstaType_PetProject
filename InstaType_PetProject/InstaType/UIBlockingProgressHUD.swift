//
//  UIBlockingProgressHUD.swift
//  InstaType_PetProject
//
//  Created by Марат Хасанов on 12.08.2024.
//

import UIKit
import ProgressHUD

class UIBlockingProgressHUD {
    private static var window: UIWindow? {
        return UIApplication.shared.windows.first
    }
    
    static func show() {
        window?.isUserInteractionEnabled = false
        ProgressHUD.animate()
    }
    
    static func dismiss() {
        window?.isUserInteractionEnabled = true
        ProgressHUD.dismiss()
    }
}
