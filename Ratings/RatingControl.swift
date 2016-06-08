//
//  RatingControl.swift
//  Ratings
//
//  Created by suyanlu on 16/6/7.
//  Copyright © 2016年 suyanlu. All rights reserved.
//

import UIKit

class RatingControl: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    // MARK: Properties
    var rating = 0
    var ratingButtons = [UIButton]()
    let spacing = 5
    let stars = 5

    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        for _ in 0..<stars {
            let button = UIButton()
            //let button = UIButton(frame: CGRect(x:index*(44 + 5), y:0, width: 44, height: 44))
            button.backgroundColor = UIColor.redColor()
            button.addTarget(self,
                             action: #selector(RatingControl.ratingButtonTapped(_:)),
                             forControlEvents: .TouchDown)
            ratingButtons += [button]
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        // Set the button's width and height to a square the size of the frame's height.
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x:0, y:0, width: buttonSize, height: buttonSize)
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = buttonSize*stars + spacing*(stars-1)
        return CGSize(width: width, height: buttonSize)
    }
    
    // MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        print("Button Pressed 👍")
    }
    
    
}
