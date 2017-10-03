//
//  TestViewController.swift
//  ShipBao
//
//  Created by Xuzhengrong on 2017/9/28.
//  Copyright © 2017年 COE. All rights reserved.
//

import Foundation

class TestViewController: XZRBaseUIViewController {
    
    @IBOutlet weak var TestButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib();
    }
    override func viewDidLoad() {
        
    }
    
    @IBAction func TestAction(_ sender: UIButton) {
        NSLog("vcvcvcvc");
    }
}
