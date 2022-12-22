//
//  SecondViewController.swift
//  interviewTest
//
//  Created by macbook_air_1 on 2022/12/2.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var backBtn: UINavigationItem!
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var maskView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        maskView.isHidden = true
        alertView.isHidden = true
        closeBtn.isHidden = true
    }
    @IBAction func close(_ sender: UIButton) {
        maskView.isHidden = true
        alertView.isHidden = true
        sender.isHidden = true
        self.navigationController!.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        maskView.isHidden = false
        alertView.isHidden = false
        closeBtn.isHidden = false
        self.navigationController!.setNavigationBarHidden(true, animated: true)
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
