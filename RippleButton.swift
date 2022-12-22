//
//  RippleButton.swift
//  interviewTest
//
//  Created by macbook_air_1 on 2022/12/20.
//

import UIKit

class RippleButton: UIButton {

    let myView = UIView()
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self)
            print(position)
        }
    }
    
}
