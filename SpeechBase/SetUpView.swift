//
//  SetUpView.swift
//  SpeechBase
//
//  Created by Feihong Zhao on 2017-03-23.
//  Copyright © 2017 Greg Goralski. All rights reserved.
//

import UIKit
import SnapKit

extension ViewController {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CartCell
        cell.itemName = checkoutItems[indexPath.item]
        cell.layer.cornerRadius = 6
        cell.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return checkoutItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func setUpView(){
        
        let pictureSize: Float = 60
        let labelWidth: Float = 80
        let labelHeight: Float = 24
        let pictureMargin: Float = 32
        let regularTopMargin: Float = 6
        let labelSideMargin: Float = 22
        let miniMargin: Float = 3
        let shelfHeight: Float = 1.2
        
        // shelf one
        view.addCustomerView(itemOne)
        itemOne.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(pictureMargin)
            make.left.equalToSuperview().offset(pictureMargin)
            make.width.equalTo(pictureSize)
            make.height.equalTo(pictureSize)
        }
        view.addCustomerView(itemTwo)
        itemTwo.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(pictureMargin)
            make.width.equalTo(pictureSize)
            make.height.equalTo(pictureSize)
        }
        view.addCustomerView(itemThree)
        itemThree.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-pictureMargin)
            make.top.equalToSuperview().offset(pictureMargin)
            make.width.equalTo(pictureSize)
            make.height.equalTo(pictureSize)
        }
        
        view.addCustomerView(itemOneLabel)
        itemOneLabel.snp.makeConstraints { (make) in
            make.top.equalTo(itemOne.snp.bottom).offset(regularTopMargin)
            make.left.equalToSuperview().offset(labelSideMargin)
            make.width.equalTo(labelWidth)
            make.height.equalTo(labelHeight)
        }
        
        view.addCustomerView(itemTwoLabel)
        itemTwoLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(itemTwo.snp.bottom).offset(regularTopMargin)
            make.width.equalTo(labelWidth)
            make.height.equalTo(labelHeight)
        }
        
        view.addCustomerView(itemThreeLabel)
        itemThreeLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-labelSideMargin)
            make.top.equalTo(itemThree.snp.bottom).offset(regularTopMargin)
            make.width.equalTo(labelWidth)
            make.height.equalTo(labelHeight)
        }
        view.addCustomerView(itemOnePrice)
        itemOnePrice.snp.makeConstraints { (make) in
            make.top.equalTo(itemOneLabel.snp.bottom).offset(miniMargin)
            make.left.equalToSuperview().offset(labelSideMargin)
            make.width.equalTo(labelWidth)
            make.height.equalTo(labelHeight)
        }
        
        view.addCustomerView(itemTwoPrice)
        itemTwoPrice.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(itemTwoLabel.snp.bottom).offset(miniMargin)
            make.width.equalTo(labelWidth)
            make.height.equalTo(labelHeight)
        }
        
        view.addCustomerView(itemThreePrice)
        itemThreePrice.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-labelSideMargin)
            make.top.equalTo(itemThreeLabel.snp.bottom).offset(miniMargin)
            make.width.equalTo(labelWidth)
            make.height.equalTo(labelHeight)
        }
        
        view.addCustomerView(shelfOne)
        shelfOne.snp.makeConstraints { (make) in
            make.top.equalTo(itemOnePrice.snp.bottom).offset(miniMargin)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(shelfHeight)
        }
//////////////////////////////////////////////////////////////////////////////////////////
        
        // shelf two
        view.addCustomerView(itemFour)
        itemFour.snp.makeConstraints { (make) in
            make.top.equalTo(shelfOne.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(pictureMargin)
            make.width.equalTo(pictureSize)
            make.height.equalTo(pictureSize)
        }
        view.addCustomerView(itemFive)
        itemFive.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(shelfOne.snp.bottom).offset(12)
            make.width.equalTo(pictureSize)
            make.height.equalTo(pictureSize)
        }
        view.addCustomerView(itemSix)
        itemSix.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-pictureMargin)
            make.top.equalTo(shelfOne.snp.bottom).offset(12)
            make.width.equalTo(pictureSize)
            make.height.equalTo(pictureSize)
        }
        view.addCustomerView(itemFourLabel)
        itemFourLabel.snp.makeConstraints { (make) in
            make.top.equalTo(itemFour.snp.bottom).offset(miniMargin)
            make.left.equalToSuperview().offset(labelSideMargin)
            make.width.equalTo(labelWidth)
            make.height.equalTo(labelHeight)
        }
        view.addCustomerView(itemFiveLabel)
        itemFiveLabel.snp.makeConstraints { (make) in
            make.top.equalTo(itemFive.snp.bottom).offset(miniMargin)
            make.centerX.equalToSuperview()
            make.width.equalTo(labelWidth)
            make.height.equalTo(labelHeight)
        }
        view.addCustomerView(itemSixLabel)
        itemSixLabel.snp.makeConstraints { (make) in
            make.top.equalTo(itemSix.snp.bottom).offset(miniMargin)
            make.right.equalToSuperview().offset(-labelSideMargin)
            make.width.equalTo(labelWidth)
            make.height.equalTo(labelHeight)
        }
        view.addCustomerView(itemFourPrice)
        itemFourPrice.snp.makeConstraints { (make) in
            make.top.equalTo(itemFourLabel.snp.bottom).offset(miniMargin)
            make.left.equalToSuperview().offset(labelSideMargin)
            make.width.equalTo(labelWidth)
            make.height.equalTo(labelHeight)
        }
        view.addCustomerView(itemFivePrice)
        itemFivePrice.snp.makeConstraints { (make) in
            make.top.equalTo(itemFiveLabel.snp.bottom).offset(miniMargin)
            make.centerX.equalToSuperview()
            make.width.equalTo(labelWidth)
            make.height.equalTo(labelHeight)
        }
        view.addCustomerView(itemSixPrice)
        itemSixPrice.snp.makeConstraints { (make) in
            make.top.equalTo(itemSixLabel.snp.bottom).offset(miniMargin)
            make.right.equalToSuperview().offset(-labelSideMargin)
            make.width.equalTo(labelWidth)
            make.height.equalTo(labelHeight)
        }
        view.addCustomerView(shelfTwo)
        shelfTwo.snp.makeConstraints { (make) in
            make.top.equalTo(itemFourPrice.snp.bottom).offset(miniMargin)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(shelfHeight)
        }

//////////////////////////////////////////////////////////////////////////////////////

        // Cart Viwe
        view.addCustomerView(cartCollectionView)
        cartCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(shelfTwo.snp.bottom).offset(regularTopMargin)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.height.equalTo(100)
        }
        
        // capture Voice Track View
        view.addCustomerView(capturedTextLabel)
        capturedTextLabel.snp.makeConstraints { (make) in
            make.top.equalTo(cartCollectionView.snp.bottom).offset(regularTopMargin)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.height.equalTo(24)
        }
        
        // instructions
        view.addCustomerView(tipLabelOne)
        tipLabelOne.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(8)
            make.top.equalTo(capturedTextLabel.snp.bottom).offset(regularTopMargin)
            make.width.equalToSuperview().offset(-16)
            make.height.equalTo(18)
        }
        view.addCustomerView(tipLabelTwo)
        tipLabelTwo.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(8)
            make.top.equalTo(tipLabelOne.snp.bottom)
            make.width.equalToSuperview().offset(-16)
            make.height.equalTo(18)
        }
        
        // record process
        view.addCustomerView(recordLabel)
        recordLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-pictureMargin)
            make.width.equalTo(120)
            make.height.equalTo(24)
        }
        
        // cost
        view.addCustomerView(totalCostLabel)
        totalCostLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-pictureMargin)
            make.right.equalToSuperview().offset(-20)
            make.width.equalTo(70)
            make.height.equalTo(26)
        }
        view.addCustomerView(costNumberLabel)
        costNumberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(totalCostLabel.snp.bottom).offset(-6)
            make.right.equalToSuperview().offset(-20)
            make.width.equalTo(40)
            make.height.equalTo(30)
        }
                
        // micro
        recordBtn.setImage(#imageLiteral(resourceName: "mic").withRenderingMode(.alwaysTemplate), for: .normal)
        recordBtn.tintColor = .red
        recordBtn.addTarget(self, action:#selector(microphonePressed), for: .touchDown)

        view.addCustomerView(recordBtn)
        recordBtn.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-regularTopMargin)
            make.centerX.equalToSuperview()
            make.width.equalTo(90)
            make.height.equalTo(80)
        }
        
        // checkout view
        checkoutView.addCustomerView(detailInfoView)
        detailInfoView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(180)
        }
        checkoutView.addCustomerView(checkoutViewCostLabel)
        checkoutViewCostLabel.snp.makeConstraints { (make) in
            make.top.equalTo(detailInfoView.snp.bottom)
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(90)
            make.height.equalTo(26)
        }
        checkoutView.addCustomerView(checkoutViewCostNumberLabel)
        checkoutViewCostNumberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(detailInfoView.snp.bottom)
            make.right.equalToSuperview()
            make.width.equalTo(90)
            make.height.equalTo(26)
        }
        checkoutView.addCustomerView(separatorFour)
        separatorFour.snp.makeConstraints { (make) in
            make.top.equalTo(checkoutViewCostLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.height.equalTo(1.6)
        }
        checkoutView.addCustomerView(cardNumberLabel)
        cardNumberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(separatorFour.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(26)
        }
        checkoutView.addCustomerView(cardNumberTextInput)
        cardNumberTextInput.snp.makeConstraints { (make) in
            make.top.equalTo(cardNumberLabel.snp.bottom)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(26)
        }
        checkoutView.addCustomerView(visaImageView)
        visaImageView.snp.makeConstraints { (make) in
            make.top.equalTo(cardNumberLabel.snp.bottom)
            make.width.equalTo(60)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(26)
        }
        checkoutView.addCustomerView(separatorOne)
        separatorOne.snp.makeConstraints { (make) in
            make.top.equalTo(cardNumberTextInput.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.height.equalTo(1.6)
        }
        checkoutView.addCustomerView(dateLabel)
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(separatorOne.snp.bottom).offset(6)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(26)
        }
        checkoutView.addCustomerView(dateTextInput)
        dateTextInput.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp.bottom)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(26)
        }
        checkoutView.addCustomerView(separatorTwo)
        separatorTwo.snp.makeConstraints { (make) in
            make.top.equalTo(dateTextInput.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.height.equalTo(1.6)
        }
        checkoutView.addCustomerView(cvcCodeLabel)
        cvcCodeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(separatorTwo.snp.bottom).offset(6)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(26)
        }
        checkoutView.addCustomerView(codeInput)
        codeInput.snp.makeConstraints { (make) in
            make.top.equalTo(cvcCodeLabel.snp.bottom)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(26)
        }
        checkoutView.addCustomerView(separatorThree)
        separatorThree.snp.makeConstraints { (make) in
            make.top.equalTo(codeInput.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.height.equalTo(1.6)
        }
        checkoutView.addCustomerView(cancelButon)
        cancelButon.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(separatorThree.snp.bottom).offset(regularTopMargin)
            make.width.equalTo(60)
            make.height.equalTo(36)
        }
        checkoutView.addCustomerView(payButton)
        payButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(60)
        }
        
        // item info
        
        detailInfoView.addCustomerView(cookieContainer)
        cookieContainerHeightAnchor = cookieContainer.heightAnchor.constraint(equalTo: detailInfoView.heightAnchor, multiplier: 1/6)
        cookieContainerHeightAnchor?.isActive = true
        cookieContainer.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        cookieContainer.addCustomerView(cookieLabel)
        cookieLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.height.equalTo(30)
            make.top.equalToSuperview()
            make.width.equalTo(90)
        }
        cookieContainer.addCustomerView(cookieCountLabel)
        cookieCountLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.height.equalTo(30)
            make.top.equalToSuperview()
            make.width.equalTo(90)
        }
        
        detailInfoView.addCustomerView(waterContainer)
        waterContainerHeightAnchor = waterContainer.heightAnchor.constraint(equalTo: detailInfoView.heightAnchor, multiplier: 1/6)
        waterContainerHeightAnchor?.isActive = true
        waterContainer.snp.makeConstraints { (make) in
            make.top.equalTo(cookieContainer.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        waterContainer.addCustomerView(waterLabel)
        waterLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.height.equalTo(30)
            make.top.equalToSuperview()
            make.width.equalTo(90)
        }
        waterContainer.addCustomerView(waterCountLabel)
        waterCountLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.height.equalTo(30)
            make.top.equalToSuperview()
            make.width.equalTo(90)
        }

        detailInfoView.addCustomerView(cokeContainer)
        cokeContainerHeightAnchor = cokeContainer.heightAnchor.constraint(equalTo: detailInfoView.heightAnchor, multiplier: 1/6)
        cokeContainerHeightAnchor?.isActive = true
        cokeContainer.snp.makeConstraints { (make) in
            make.top.equalTo(waterContainer.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        cokeContainer.addCustomerView(cokeLabel)
        cokeLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.height.equalTo(30)
            make.top.equalToSuperview()
            make.width.equalTo(90)
        }
        cokeContainer.addCustomerView(cokeCountLabel)
        cokeCountLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.height.equalTo(30)
            make.top.equalToSuperview()
            make.width.equalTo(90)
        }

        
        detailInfoView.addCustomerView(chipsContainer)
        chipsContainerHeightAnchor = chipsContainer.heightAnchor.constraint(equalTo: detailInfoView.heightAnchor, multiplier: 1/6)
        chipsContainerHeightAnchor?.isActive = true
        chipsContainer.snp.makeConstraints { (make) in
            make.top.equalTo(cokeContainer.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        chipsContainer.addCustomerView(chipsLabel)
        chipsLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.height.equalTo(30)
            make.top.equalToSuperview()
            make.width.equalTo(90)
        }
        chipsContainer.addCustomerView(chipsCountLabel)
        chipsCountLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.height.equalTo(30)
            make.top.equalToSuperview()
            make.width.equalTo(90)
        }
        
        detailInfoView.addCustomerView(bananaContainer)
        bananaContainerHeightAnchor = bananaContainer.heightAnchor.constraint(equalTo: detailInfoView.heightAnchor, multiplier: 1/6)
        bananaContainerHeightAnchor?.isActive = true
        bananaContainer.snp.makeConstraints { (make) in
            make.top.equalTo(chipsContainer.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        bananaContainer.addCustomerView(bananaLabel)
        bananaLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.height.equalTo(30)
            make.top.equalToSuperview()
            make.width.equalTo(90)
        }
        bananaContainer.addCustomerView(bananaCountLabel)
        bananaCountLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.height.equalTo(30)
            make.top.equalToSuperview()
            make.width.equalTo(90)
        }
        
        detailInfoView.addCustomerView(appleContainer)
        appleContainerHeightAnchor = appleContainer.heightAnchor.constraint(equalTo: detailInfoView.heightAnchor, multiplier: 1/6)
        appleContainerHeightAnchor?.isActive = true
        appleContainer.snp.makeConstraints { (make) in
            make.top.equalTo(bananaContainer.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        appleContainer.addCustomerView(appleLabel)
        appleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.height.equalTo(30)
            make.top.equalToSuperview()
            make.width.equalTo(90)
        }
        appleContainer.addCustomerView(appleCountLabel)
        appleCountLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.height.equalTo(30)
            make.top.equalToSuperview()
            make.width.equalTo(90)
        }
    }

    
}
