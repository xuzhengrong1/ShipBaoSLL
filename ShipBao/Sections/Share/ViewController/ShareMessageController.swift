//
//  ShareMessageController.swift
//  ShipBao
//
//  Created by Xuzhengrong on 2017/8/21.
//  Copyright © 2017年 COE. All rights reserved.
//

import Foundation
class ShareMessageController: UITableViewController {
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        self.registerCell(String(describing: MessageOnePicTableViewCell.self));
        self.tableView.estimatedRowHeight=100;
        
        dropDown.dataSource = ["111","222","3333"]
        dropDown.dropdownWidth  = 200 ;
        dropDown.backgroundColor = UIColor.white;
        dropDown.separatorColor = rgbColor(r: 169, g: 169, b: 169);
        dropDown.selectionBackgroundColor = rgbColor(r: 169, g: 169, b: 169)
        let button =  XZRNavButton(title: dropDown.dataSource.first!, image:UIImage.init(named: "Settings")! )
        dropDown.direction = .bottom;
        dropDown.bottomOffset = CGPoint(x:(button.size.width-dropDown.dropdownWidth!)/2 , y: 50)
        button.addTarget(self, action:#selector(self.showDropDown) , for: .touchUpInside)
        self.navigationItem.titleView = button;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        
    }
    
    func showDropDown() {
        dropDown.anchorView = self.navigationItem.titleView;
        dropDown.show()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MessageOnePicTableViewCell.getCelllForReuse(tableView, indexPath: indexPath) as MessageOnePicTableViewCell
        
        return cell
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: false)
    }
    
    open func  registerCell(_ identifier: String)
    {
        self.tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
}
