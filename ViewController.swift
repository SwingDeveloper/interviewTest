//
//  ViewController.swift
//  interviewTest
//
//  Created by macbook_air_1 on 2022/12/2.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func leftBtn(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.myView.frame = self.myView.frame.offsetBy(dx: 150, dy: 0)
        }
        sender.isEnabled = false
        rightBtn.isEnabled = true
    }
    
    @IBAction func rightBtn(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.myView.frame = self.myView.frame.offsetBy(dx: -150, dy: 0)
        }
        sender.isEnabled = false
        leftBtn.isEnabled = true
    }
}

