//
//  EDMAutoFooter+Extension.swift
//  YDMShop
//
//  Created by Xuzhengrong on 2017/3/27.
//  Copyright © 2017年 elenjoy. All rights reserved.
//
import MJRefresh
import Foundation
extension  MJRefreshAutoNormalFooter
{
    class func createFooter(_ target:Any, refreshAction:Selector) -> MJRefreshAutoNormalFooter? {
        
        let footer =  MJRefreshAutoNormalFooter(refreshingTarget: target, refreshingAction:refreshAction)
        footer?.setTitle("", for: .noMoreData)
        footer?.setTitle("上拉加载更多", for: .idle)
        footer?.setTitle("加载中...", for: .refreshing)
        footer?.setTitle("松开加载更多", for: .pulling)
        footer?.stateLabel.textColor = UIColor.hexStringToUIColor(hex: "#838487");
        footer?.stateLabel.font = UIFont.systemFont(ofSize: 13)
        return footer
    }
    
    
    open override func endRefreshingWithNoMoreData() {
        super.endRefreshingWithNoMoreData()
        let myAttribute = [NSFontAttributeName: UIFont.systemFont(ofSize:10),NSForegroundColorAttributeName:UIColor.hexStringToUIColor(hex: "#838487")]
        let lableTextAttrStr = NSMutableAttributedString(string: "", attributes: myAttribute )
        let myString = NSMutableAttributedString(string: "————————", attributes: myAttribute )
        lableTextAttrStr.append(myString);
        let textAttr = [NSFontAttributeName: UIFont.systemFont(ofSize: 13),NSForegroundColorAttributeName:UIColor.hexStringToUIColor(hex: "#838487")]
        let attrString = NSMutableAttributedString(string: "    我们是有底线的    ",attributes: textAttr)
        lableTextAttrStr.append(attrString)
        lableTextAttrStr.append(myString)
        self.stateLabel.attributedText = lableTextAttrStr

    }
//  class  func createNoMoreDataAttrString() -> NSMutableAttributedString {
//    let myAttribute = [NSFontAttributeName: UIFont.systemFont(ofSize:10),NSForegroundColorAttributeName:UIColor.hexStringToUIColor(hex: "#838487")]
//    let lableTextAttrStr = NSMutableAttributedString(string: "", attributes: myAttribute )
//    let myString = NSMutableAttributedString(string: "————————", attributes: myAttribute )
//    lableTextAttrStr.append(myString);
//    let textAttr = [NSFontAttributeName: UIFont.systemFont(ofSize: 13),NSForegroundColorAttributeName:UIColor.hexStringToUIColor(hex: "#838487")]
//    let attrString = NSMutableAttributedString(string: "    我们是有底线的    ",attributes: textAttr)
//    lableTextAttrStr.append(attrString)
//    lableTextAttrStr.append(myString)
//    return lableTextAttrStr;
//    }
    
}
