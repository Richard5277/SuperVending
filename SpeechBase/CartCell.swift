//
//  CartCell.swift
//  SpeechBase
//
//  Created by Feihong Zhao on 2017-03-23.
//  Copyright © 2017 Greg Goralski. All rights reserved.
//

import UIKit

class CartCell: UICollectionViewCell {
 
    var itemName: String? {
        didSet{
            cartItemImageView.image = UIImage(named: self.itemName!)
        }
    }
    
    var cartItemImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .white
        
        cartItemImageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        addSubview(cartItemImageView)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
