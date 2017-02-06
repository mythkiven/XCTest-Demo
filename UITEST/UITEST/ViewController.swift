//
//  ViewController.swift
//  UITEST
//
//  Created by gyjrong on 17/1/23.
//  Copyright © 2017年 mythkiven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickedColor(_ sender: UIButton) {
        self.view.backgroundColor = sender.isSelected == true ? UIColor.red:UIColor.blue
        sender.isSelected = !sender.isSelected
    }

}

