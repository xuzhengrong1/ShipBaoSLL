//
//  UIView+Init.swift
//  YDMShop
//
//  Created by Xuzhengrong on 2017/2/13.
//  Copyright © 2017年 elenjoy. All rights reserved.
//

import Foundation
extension UIView {
    
    
    
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UINavigationController {
                return viewController
            }
        }
        return nil
    }
//    @discardableResult   // 1
//    func fromNib<T : UIView>() -> T? {   // 2
//        guard let view = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?[0] as? T else {    // 3
//            // xib not loaded, or it's top view is of the wrong type
//            return nil
//        }
//        self.addSubview(view)     // 4
//        view.translatesAutoresizingMaskIntoConstraints = false   // 5
//        
////        view.layoutAttachAll(to: self)   // 6
//        return view   // 7
//    }
    
   class  func loadFromNibNamed(nibNamed: String? = "", bundle : Bundle? = nil) -> UIView? {
     var nibName = String(describing: self)
    return UINib(
        nibName: nibName,
        bundle: bundle
        ).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
    
}
