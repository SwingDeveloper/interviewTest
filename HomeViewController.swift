//
//  HomeViewController.swift
//  interviewTest
//
//  Created by macbook_air_1 on 2022/12/2.
//

import UIKit

class HomeViewController: UIViewController {
    var inputTextField: UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func question3Btn(_ sender: Any) {
        let controller = UIAlertController(title: "Please key in test data size.", message: nil, preferredStyle: .alert)
        
        controller.addTextField { uiTextField in
            self.inputTextField = uiTextField
            self.inputTextField?.placeholder = "1~99"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            self.performSegue(withIdentifier: "thirdSegue", sender: nil)
        }
        controller.addAction(action)
        controller.addAction(cancelAction)
        present(controller, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "thirdSegue" {
            let destination = segue.destination as! ThirdViewController
            destination.viewValue = Int((inputTextField?.text)!)!
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
