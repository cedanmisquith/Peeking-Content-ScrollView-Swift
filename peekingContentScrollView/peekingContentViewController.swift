//
//  peekingContentViewController.swift
//  peekingContentScrollView
//
//  Created by Cedan 7EDGE on 7/11/19.
//  Copyright © 2019 cedanmisquith. All rights reserved.
//

import UIKit

class cardContent {
    var title: String!
    var bgColor: UIColor!
    var cardDescription: String!
    
    init(title: String, bgColor: UIColor, description: String) {
        self.title = title
        self.bgColor = bgColor
        self.cardDescription = description
    }
}

class peekingContentViewController: UIViewController {
    
    var scrollView: UIScrollView!
    
    var cardContentArray = [
        cardContent.init(title: "Title 01", bgColor: .red, description: "This is the description for title 01"),
        cardContent.init(title: "Title 02", bgColor: .blue, description: "This is the description for title 02"),
        cardContent.init(title: "Title 03", bgColor: .green, description: "This is the description for title 03"),
        cardContent.init(title: "Title 04", bgColor: .yellow, description: "This is the description for title 04"),
        cardContent.init(title: "Title 05", bgColor: .purple, description: "This is the description for title 05"),
        cardContent.init(title: "Title 06", bgColor: .orange, description: "This is the description for title 06"),
        cardContent.init(title: "Title 07", bgColor: .brown, description: "This is the description for title 07"),
        cardContent.init(title: "Title 08", bgColor: .magenta, description: "This is the description for title 08"),
        cardContent.init(title: "Title 09", bgColor: .gray, description: "This is the description for title 09"),
        cardContent.init(title: "Title 10", bgColor: .cyan, description: "This is the description for title 10")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView = UIScrollView(frame: CGRect(x: 30, y: 0, width: self.view.frame.width-60, height: self.view.frame.height))
        scrollView.isPagingEnabled = true
        scrollView.clipsToBounds = false
        scrollView.backgroundColor = .clear
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        self.view.addSubview(scrollView)
        
        let cards = CreateCard().returnCardFor(content: cardContentArray, frame: self.view.bounds)
        for card in cards{
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(cardTapped(sender:)))
            card.isUserInteractionEnabled = true
            card.addGestureRecognizer(tapGestureRecognizer)
            self.scrollView.addSubview(card)
        }
        self.scrollView.contentSize = CGSize(width: ((self.view.frame.width-80)*CGFloat(cardContentArray.count))+200, height: self.scrollView.frame.height)
    }
    
    @objc func cardTapped(sender: UITapGestureRecognizer!){
        print("Card Tapped \(sender.view?.tag ?? -1)")
    }
    
}
