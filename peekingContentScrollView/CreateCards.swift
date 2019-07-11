//
//  CreateCards.swift
//  peekingContentScrollView
//
//  Created by Cedan 7EDGE on 7/11/19.
//  Copyright © 2019 cedanmisquith. All rights reserved.
//

import UIKit

class CreateCard {
    
    var count: CGFloat = 0
    var index: Int = 0
    
    func returnCardFor(content: [cardContent], frame: CGRect) -> [UIView]{
        var cards = [UIView]()
        for data in content{
            
            //Create the main outer card view or the container view to hold all your objects.
            let outerView = UIView(frame: CGRect(x: count, y: (frame.height/2) - (frame.height/2.5)/2, width: frame.width-90, height: frame.height/2.5))
            outerView.layer.applySketchShadow(color: .black, alpha: 0.2, x: 0, y: 30, blur: 30, spread: 0)
            outerView.tag = index
            outerView.backgroundColor = data.bgColor
            
            //Create you title label
            let titleLabel = UILabel(frame: CGRect(x: 0, y: 20, width: outerView.frame.width, height: 30))
            titleLabel.text = data.title
            titleLabel.font = titleLabel.font.withSize(28)
            titleLabel.textAlignment = .center
            titleLabel.adjustsFontSizeToFitWidth = true
            outerView.addSubview(titleLabel)
            
            //Create the description label
            let descriptionLabel = UILabel(frame: CGRect(x: 0, y: titleLabel.frame.maxY+20, width: outerView.frame.width, height: outerView.frame.height-titleLabel.frame.maxY+40))
            descriptionLabel.text = data.cardDescription
            descriptionLabel.numberOfLines = 0
            descriptionLabel.textAlignment = .center
            descriptionLabel.font = titleLabel.font.withSize(28)
            descriptionLabel.adjustsFontSizeToFitWidth = true
            outerView.addSubview(descriptionLabel)
            
            cards.append(outerView)
            
            count += frame.width-60
            index += 1
        }
        return cards
    }
    
}
extension CALayer{
    func applySketchShadow(color: UIColor, alpha: Float, x: CGFloat, y: CGFloat, blur: CGFloat, spread: CGFloat) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
