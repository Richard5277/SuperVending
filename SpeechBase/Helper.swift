//
//  Helper.swift
//  SpeechBase
//
//  Created by Feihong Zhao on 2017-03-22.
//  Copyright © 2017 Greg Goralski. All rights reserved.
//

import UIKit

extension UIImage {
    func resizeToWidth(_ newWidth: CGFloat) -> UIImage {
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    func imageWithInsets(insetDimen: CGFloat) -> UIImage {
        return imageWithInset(insets: UIEdgeInsets(top: insetDimen, left: insetDimen, bottom: insetDimen, right: insetDimen))
    }
    
    func imageWithInset(insets: UIEdgeInsets) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: self.size.width + insets.left + insets.right, height: self.size.height + insets.top + insets.bottom), false, self.scale)
        let origin = CGPoint(x: insets.left, y: insets.top)
        self.draw(at: origin)
        let imageWithInsets = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imageWithInsets!
    }
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        //MARK: gotta use self.init inside a convenience, not super
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}
struct myColor {
    static var lightGray: UIColor = UIColor(r: 214, g: 217, b: 224, a: 1)
    static var lightBlack: UIColor = UIColor(r: 25, g: 28, b: 35, a: 0.7)
    static var red: UIColor = UIColor(r: 231, g: 68, b: 40, a: 1)
    static var black: UIColor = UIColor(r: 19, g: 22, b: 31, a: 1)
    static var white: UIColor = UIColor(r: 250, g: 250, b: 250, a: 1)
    static var gray: UIColor = UIColor(r: 179, g: 185, b: 199, a: 1)
    static var yellow: UIColor = UIColor(r: 233, g: 208, b: 56, a: 1)
    static var lightYellow: UIColor = UIColor(r: 233, g: 208, b: 56, a: 0.6)
    static var orange: UIColor = UIColor(r: 240, g: 147, b: 41, a: 1)
}

extension UIView {
    func addCustomerView(_ view: UIView){
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
}














