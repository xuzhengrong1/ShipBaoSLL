

import UIKit
import Material

// 左右间距
let kMargin:CGFloat = 15.0
// 导航栏高度
let kNavBarHeight: CGFloat = 64.0


let kReadedArticleList :String  = "readedArticleList"
let kHasReadArticleTextColor : UIColor = UIColor.lightGray;


/// 屏幕的宽
let SCREEN_W = UIScreen.main.bounds.width
/// 屏幕的高
let SCREEN_H = UIScreen.main.bounds.height

let MessageTableColor  = rgbColor(r: 245 , g: 245, b: 247, a: 1)
let NavTintColor = rgbColor(r: 88, g: 185, b: 122);

let TabbarTextColor = rgbColor(r: 169, g: 169, b: 169)

let kCellIcon = "cellIcon"
let kCellImageName = "cellImageName"
let kCellViewController = "cellViewController"
let kcellUrl = "cellUrl"
let kCellText = "cellText"
let kCellDetailText = "cellText"


func stringClassFromString(_ className: String) -> AnyClass! {
    
    /// get namespace
    let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String;
    
    /// get 'anyClass' with classname and namespace
    let cls: AnyClass = NSClassFromString("\(namespace).\(className)")!;
    
    // return AnyClass!
    return cls;
}


/// RGBA的颜色设置
func rgbColor(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) -> UIColor {
    return UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
}


let DefulatCorneradias:CGFloat = 4.0 

//func castStringToEnmu<T>(_ enmuStr:String ) -> T {
////    let enmu: T
//    
//  let type = T(rawValue: Int(enmuStr))
////    if _model?.type != nil
////    {
////        
////        if let catId = model?.catId , let classType = EDMClassType(rawValue: Int( catId)!)  {
////            self.type = classType
////        }
////    }
//    
//    return type
//}

func getControllerFromStoryBoard(_ storyBoardName:String, identity: String) -> UIViewController {
    
    let storyboard = UIStoryboard(name: storyBoardName, bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: identity)
    return controller
}


let COLORLIKEGREEN = UIColor.hexStringToUIColor(hex:"#56bc7b")

let SYSTEMFONT15 = UIFont.systemFont(ofSize: 15);

let APP_ID = "18da20094d0-4e6ff-56baf-485aac4e9b9";

let SUB_APP_ID = "4e6ff-56baf"

let VERSIONSTR = "1.0"

let SHIPBAO_APP = "SHIPBAO_APP"


 let BASE_URL = "http://139.162.37.173:10004/api.php"

extension ErrorTextField{
    func configErrorTextField(){
        self.placeholderNormalColor = .lightGray
        self.placeholderActiveColor = COLORLIKEGREEN
        self.dividerNormalColor = .lightGray
        self.dividerActiveColor = COLORLIKEGREEN
        
       // emailField.textInset = 20
        // Setting the visibilityIconButton color.
//        passwordField.visibilityIconButton?.tintColor = Color.green.base.withAlphaComponent(passwordField.isSecureTextEntry ? 0.38 : 0.54)
    }
}


/// 背景灰色
func globalColor() -> UIColor {
    return rgbColor(r: 245, g: 245, b: 245, a: 1)
}

/// 红色
func globalRedColor() -> UIColor {
    return rgbColor(r: 212, g: 61, b: 61, a: 1.0)
}



/// iPhone 5
let isIPhone5 = SCREEN_H == 568 ? true : false
/// iPhone 6
let isIPhone6 = SCREEN_H == 667 ? true : false
/// iPhone 6P
let isIPhone6P = SCREEN_H == 736 ? true : false
