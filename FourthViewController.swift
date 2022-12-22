//
//  FourthViewController.swift
//  interviewTest
//
//  Created by macbook_air_1 on 2022/12/13.
//

import UIKit


class FourthViewController: UIViewController {

    @IBOutlet weak var imageBtn: UIButton! {
        didSet {
            imageBtn.configurationUpdateHandler = {
                imageBtn in
                imageBtn.layer.cornerRadius = imageBtn.frame.height / 2
            }
        }
    }
    @IBOutlet weak var normalBtn: UIButton! {
        didSet {
            normalBtn.configurationUpdateHandler = {
                normalBtn in
                normalBtn.layer.cornerRadius = normalBtn.frame.height / 2
            }
        }
    }
    @IBOutlet weak var rippleBtn: UIButton!
    @IBOutlet weak var borderBtn: UIButton! {
        didSet {
            borderBtn.configurationUpdateHandler = {
                borderBtn in
                borderBtn.backgroundColor = borderBtn.isHighlighted ? .darkGray : .systemPurple
                borderBtn.layer.cornerRadius = borderBtn.frame.height / 2
            }
        }
    }
    @IBOutlet weak var gradientBtn: UIButton! {
        didSet {
            gradientBtn.configurationUpdateHandler = {
                gradientBtn in
                gradientBtn.layer.cornerRadius = gradientBtn.frame.height / 2
                //gradientBtn.layer.masksToBounds = true
            }
        }
    }
    let myView = UIView()
    let shadowView = UIView()
    let touch = UITouch()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        gradient()
        rippleBtn.layer.cornerRadius = rippleBtn.bounds.height/2
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: rippleBtn)
            print(position)
        }
    }
    
    func rippleView() {
        let animation = CABasicAnimation(keyPath: "transform.scale.x")
        animation.fromValue = 0.3
        animation.toValue = 1
        animation.duration = 0.2
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        myView.layer.add(animation, forKey: "transform.scale.x")
        rippleBtn.addSubview(myView)
    }
    
    
    
    func gradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientBtn.bounds
        gradientLayer.colors = [CGColor(red: 0, green: 1, blue: 0, alpha: 1), CGColor(red: 0, green: 0, blue: 1, alpha: 1)]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.cornerRadius = gradientLayer.frame.height / 2
        gradientBtn.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    @IBAction func gradientBtnTouchUP(_ sender: UIButton) {
        sender.layer.shadowColor = UIColor.clear.cgColor
        sender.layer.shadowOffset = CGSize(width: 0, height: 0)
        sender.layer.shadowRadius = 0
        sender.layer.shadowOpacity = 0
    }
    @IBAction func gradientBtnTapped(_ sender: UIButton) {
        sender.layer.shadowColor = UIColor.black.cgColor
        sender.layer.shadowOffset = CGSize(width: 2, height: 2)
        sender.layer.shadowRadius = 2
        sender.layer.shadowOpacity = 0.3
    }
    
    @IBAction func touchDownRipple(_ sender: UIButton) {
        let touch = UITouch()
        myView.frame = sender.bounds
        myView.layer.cornerRadius = sender.bounds.height/2
        myView.backgroundColor = .darkGray
        myView.alpha = 0.3
        rippleView()
        print(touch.location(in: rippleBtn))
    }
    
    @IBAction func touchUpOutsideRipple(_ sender: UIButton) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.myView.removeFromSuperview()
        }
    }
    @IBAction func touchOutRipple(_ sender: UIButton) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.myView.removeFromSuperview()
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UIButton {
    func rippleAnimate() {
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    
    
    @objc func buttonTapped() {
        
        let radius: CGFloat = min(self.bounds.width, self.bounds.height) / 2
        let path = UIBezierPath(arcCenter: self.center, radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.lightGray.cgColor
        shapeLayer.strokeColor = UIColor.darkGray.cgColor
        let animation = CABasicAnimation(keyPath: "transform.scale.x")
        animation.fromValue = UIBezierPath(arcCenter: self.center, radius: 0, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true).cgPath
        animation.toValue = path.cgPath
        animation.duration = 0.5
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        shapeLayer.add(animation, forKey: "transform.scale.x")
        self.layer.addSublayer(shapeLayer)
        
    }
}
