//
//  UISliderNavigationController.swift
//  MyAcuvueMain
//
//  Created by eClerx_Digital on 18/12/19.
//  Copyright © 2019 csc digital. All rights reserved.
//

import UIKit

extension UINavigationController: UIGestureRecognizerDelegate {

    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

class UISliderNavigationController: UIViewController {
    let  navColor = UIColor(red: 37, green: 126, blue: 233)
    var backImage = UIImage(named: "back_whitearrow")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBarColor()
        backButtonFirstNVC()
        backButtonNVCStack()
        
      
    }
    
   
    
    func setNavBarColor(){
        if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
            // iOS 6.1 or earlier
            // changed after ios 7 so no longer affects background
            navigationController?.navigationBar.tintColor = navColor
        } else {
            // iOcS 7.0 or later
            navigationController?.navigationBar.barTintColor = navColor
        }
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
    
    func backButtonFirstNVC(){
        backImage = backImage?.withRenderingMode(.alwaysOriginal)
        
        let leftButton = UIButton(type: .roundedRect)
        leftButton.tintColor = UIColor.white
        leftButton.addTarget(self, action: #selector(backButtonFirstNVCClick), for: .touchUpInside)
        leftButton.setTitle("", for: .normal)
        leftButton.setImage(backImage, for: .normal)
        leftButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftButton)
    }
    
    
    func backButtonNVCStack(){
        navigationController?.navigationBar.backIndicatorImage = backImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        
        let item = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = item
    }
    
    
    
    
    @objc func backButtonFirstNVCClick(){
        print("back pressed")
        dismiss(animated: true, completion: nil)
        
    }
}

