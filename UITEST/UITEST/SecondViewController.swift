//
//  SecondViewController.swift
//  UITEST
//
//  Created by 蒋孝才 on 17/1/23.
//  github地址:https://github.com/mythkiven
//  如有任何问题，还请提issues
//
//    Copyright © 2017年 mythkiven. All rights reserved.
//


import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func clickedBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
