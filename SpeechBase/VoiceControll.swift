//
//  VoiceControll.swift
//  SpeechBase
//
//  Created by Feihong Zhao on 2017-03-22.
//  Copyright © 2017 Greg Goralski. All rights reserved.
//

import UIKit

extension ViewController {

    func searchWords(inputSentence: String) {
        if let wordAction = WordsSet.searchFor(word: inputSentence) {

            switch wordAction.action {
            case "selectCookie":
                addToCartForImageView(startingImageView: itemOne, name: "cookie", price: 1.2)
            case "selectWater":
                addToCartForImageView(startingImageView: itemTwo, name: "water", price: 1.5)
            case "selectCoke":
                addToCartForImageView(startingImageView: itemThree, name: "coke", price: 2.5)
            case "selectApple":
                addToCartForImageView(startingImageView: itemSix, name: "apple", price: 0.9)
            case "selectChips":
                addToCartForImageView(startingImageView: itemFour, name: "chips", price: 1.6)
            case "selectBanana":
                addToCartForImageView(startingImageView: itemFive, name: "banana", price: 0.8)
            case "cancelSelection":
                cancelSelection()
            case "checkOut":
                checkOut()
            default:
                self.cartCollectionView.reloadData()
                return
            }
        }
    }
    
    func addItem(_ name: String, price: Float){
        self.checkoutItems.append(name)
        self.totalCost += price
        self.costNumberLabel.text = "$ \(self.totalCost)"
        self.cartCollectionView.reloadData()
        let item = self.checkoutItems.count - 1
        let indexPath = IndexPath(item: item, section: 0)
        self.cartCollectionView.layoutIfNeeded()
        self.cartCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        self.cartCollectionView.scrollRectToVisible(CGRect(x: self.view.frame.width + 20, y: 0, width: self.view.frame.width + 20, height: self.view.frame.height), animated: true)
        self.capturedTextLabel.text = nil
        microphonePressed()
    }
    
    func cancelSelection(){
        self.checkoutItems = []
        totalCookie = 0
        totalWater = 0
        totalCoke = 0
        totalChips = 0
        totalBanana = 0
        totalApple = 0
        self.capturedTextLabel.text = nil
        self.cartCollectionView.reloadData()
        self.totalCost = 0.0
        self.costNumberLabel.text = "$ 0.0"
    }
    
    func checkOut(){
        print("Check Out")
        print(checkoutItems)
        microphonePressed()
        for item in checkoutItems {
            if item == "cookie" {
                totalCookie += 1
            }else if item == "water" {
                totalWater += 1
            }else if item == "coke" {
                totalCoke += 1
            }else if item == "chips" {
                totalChips += 1
            }else if item == "banana" {
                totalBanana += 1
            }else if item == "apple" {
                totalApple += 1
            }
        }
        cookieContainerHeightAnchor?.isActive = false
        cookieContainerHeightAnchor = cookieContainer.heightAnchor.constraint(equalTo: detailInfoView.heightAnchor, multiplier: totalCookie == 0 ? 0 : 1/6)
        cookieContainerHeightAnchor?.isActive = true
        cookieCountLabel.text = totalCookie == 0 ? nil : "X \(totalCookie)"
        cookieLabel.text = totalCookie == 0 ? nil : "cookie"
        
        waterContainerHeightAnchor?.isActive = false
        waterContainerHeightAnchor = waterContainer.heightAnchor.constraint(equalTo: detailInfoView.heightAnchor, multiplier: totalWater == 0 ? 0 : 1/6)
        waterContainerHeightAnchor?.isActive = true
        waterCountLabel.text = totalWater == 0 ? nil : "X \(totalWater)"
        waterLabel.text = totalWater == 0 ? nil : "water"
        
        cokeContainerHeightAnchor?.isActive = false
        cokeContainerHeightAnchor = cokeContainer.heightAnchor.constraint(equalTo: detailInfoView.heightAnchor, multiplier: totalCoke == 0 ? 0 : 1/6)
        cokeContainerHeightAnchor?.isActive = true
        cokeCountLabel.text = totalCoke == 0 ? nil : "X \(totalCoke)"
        cokeLabel.text = totalCoke == 0 ? nil : "coke"
        
        chipsContainerHeightAnchor?.isActive = false
        chipsContainerHeightAnchor = chipsContainer.heightAnchor.constraint(equalTo: detailInfoView.heightAnchor, multiplier: totalChips == 0 ? 0 : 1/6)
        chipsContainerHeightAnchor?.isActive = true
        chipsCountLabel.text = totalChips == 0 ? nil : "X \(totalChips)"
        chipsLabel.text = totalChips == 0 ? nil : "chips"
        
        bananaContainerHeightAnchor?.isActive = false
        bananaContainerHeightAnchor = bananaContainer.heightAnchor.constraint(equalTo: detailInfoView.heightAnchor, multiplier: totalBanana == 0 ? 0 : 1/6)
        bananaContainerHeightAnchor?.isActive = true
        bananaCountLabel.text = totalBanana == 0 ? nil : "X \(totalBanana)"
        bananaLabel.text = totalBanana == 0 ? nil : "banana"
        
        appleContainerHeightAnchor?.isActive = false
        appleContainerHeightAnchor = appleContainer.heightAnchor.constraint(equalTo: detailInfoView.heightAnchor, multiplier: totalApple == 0 ? 0 : 1/6)
        appleContainerHeightAnchor?.isActive = true
        appleCountLabel.text = totalApple == 0 ? nil : "X \(totalApple)"
        appleLabel.text = totalApple == 0 ? nil : "apple"
        
        checkoutViewCostNumberLabel.text = "$ \(totalCost)"

        if let keyWindow = UIApplication.shared.keyWindow {
            self.blackBackgroundView = UIView(frame: keyWindow.frame)
            self.blackBackgroundView.backgroundColor = .black
            self.blackBackgroundView.alpha = 0
            self.checkoutView.alpha = 0
            keyWindow.addSubview(self.blackBackgroundView)
            checkoutView.frame = CGRect(x: keyWindow.frame.width / 2, y: keyWindow.frame.height / 2, width: 0, height: 0)
            keyWindow.addSubview(checkoutView)
            
            UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
                self.blackBackgroundView.alpha = 0.8
                self.checkoutView.alpha = 1
                self.checkoutView.frame = CGRect(x: 16, y: 32, width: keyWindow.frame.width - 32, height: keyWindow.frame.height - 64)
            }, completion: { (true) in
                self.cancelButon.addTarget(self, action: #selector(self.cancelPlayment), for: .touchUpInside)
                self.payButton.addTarget(self, action: #selector(self.handlePayent), for: .touchUpInside)
            })
            
        }
       
    }
    
    func addToCartForImageView(startingImageView: UIImageView, name: String, price: Float){
        print("Start Animation")
        startingFrame = startingImageView.superview?.convert(startingImageView.frame, to: nil)
        let cartYPositon = self.cartCollectionView.frame.origin.y
        let zoomingImageview = UIImageView(frame: startingFrame!)
        zoomingImageview.backgroundColor = .clear
        zoomingImageview.isUserInteractionEnabled = true
        
        UIView.animate(withDuration: 1.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            zoomingImageview.image = startingImageView.image
            zoomingImageview.frame = CGRect(x: self.view.frame.width / 2, y: cartYPositon + 30, width: 0, height: 0)
            zoomingImageview.alpha = 0
            self.view.addSubview(zoomingImageview)
        }, completion: {(complete) in
            self.addItem(name, price: price)
        })
        
    }
    
    func cancelPlayment(){
        print("Cancel Payment")
        cancelSelection()
        self.blackBackgroundView.removeFromSuperview()
        self.checkoutView.removeFromSuperview()
    }
    func handlePayent(){
        print("Payment Made")
        cancelSelection()
        self.blackBackgroundView.removeFromSuperview()
        self.checkoutView.removeFromSuperview()
        cancelSelection()
    }
    
}


