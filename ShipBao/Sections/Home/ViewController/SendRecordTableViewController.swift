//  TableChildExampleViewController.swift
//  XLPagerTabStrip ( https://github.com/xmartlabs/XLPagerTabStrip )
//
//  Copyright (c) 2017 Xmartlabs ( http://xmartlabs.com )
//
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation
import XLPagerTabStrip
//import SSCycleScrollView
//import MJRefresh

class SendRecordTableViewController: UITableViewController, IndicatorInfoProvider {
    
    
    let cellIdentifier = "collegeCell"
    var blackTheme = false
    
    var pageIndex = 1
    var noMoreData = false
    var itemInfo = IndicatorInfo(title: "View")
    
        
    var tabType : String
    
//    var banners : [EDMList] = []
//    
//    var articles : [EDMArticlelist] = []
//    var courses : [CourseList] = []
    init(style: UITableViewStyle, itemInfo: String, type: String) {
        self.itemInfo = IndicatorInfo(title: itemInfo)
        self.tabType = type
        super.init(style: style)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
  
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//
//
//    func getCollegeData(_ page: Int) {
//        XZRNetWorkTool.shared.getCollegeData(page: page ,category: self.tabType, {articles in
//            if articles != nil {
//                
//                if let count  = (articles?.articlelist?.count), count < 10 {
//                    self.noMoreData = true
//                    if((self.tableView.mj_footer) != nil)
//                    {
//                       self.tableView.mj_footer.endRefreshingWithNoMoreData();
//                    }
//                }
//            if let articlelist  = articles?.articlelist
//            {
//                if(self.pageIndex <= 1)
//                {
//                    self.articles = articlelist
//                    self.tableView.reloadData()
//                    if(articlelist.count >= 10)
//                    {
//                        DispatchQueue.main.async {
//                            self.tableView.mj_footer = MJRefreshAutoNormalFooter.createFooter(self, refreshAction: #selector(self.loadMoreData))
//                        }
//                    }
//                }else
//                {
//                    
//                    self.articles.append(contentsOf: articlelist)
//                    self.tableView.reloadData()
//                }
//            }
//            }
//             self.endMJRefresh()
//        }
//        )
//    }
//    
//    func getCourseData(_ page: Int,_ isThisWeek :Int) {
//        XZRNetWorkTool.shared.getCourseData(page: page ,isThisWeek: isThisWeek ,{courseList in
//            if courseList != nil {
//                
//                if let count  = (courseList?.list?.count), count < 10 {
//                    self.noMoreData = true
//                    if((self.tableView.mj_footer) != nil)
//                    {
//                        self.tableView.mj_footer.endRefreshingWithNoMoreData();
//                    }
//                }
//                if let courseList  = courseList?.list
//                {
//                    if(self.pageIndex <= 1)
//                    {
//                        self.courses = courseList
//                        self.tableView.reloadData()
//                        if(courseList.count >= 10)
//                        {
//                            DispatchQueue.main.async {
//                                self.tableView.mj_footer = MJRefreshAutoNormalFooter.createFooter(self, refreshAction: #selector(self.loadMoreData))
//                            }
//                        }
//                    }else
//                    {
//                        
//                        self.courses.append(contentsOf: courseList)
//                        self.tableView.reloadData()
//                    }
//                }
//            }
//            self.endMJRefresh()
//        }
//        )
//    }
//    
//    
//    func endMJRefresh() {
//        self.tableView.mj_header.endRefreshing()
//        if((self.tableView.mj_footer) != nil)
//        {
//            self.tableView.mj_footer.endRefreshing()
//        }
//    }
//    func requstBannerData(){
//        XZRNetWorkTool.shared.getBannerData(category: self.tabType ,{ banners  in
//            if banners != nil && banners?.list != nil {
//                self.banners = (banners?.list)!
//                var urls :[Any] = []
//        
//               for list  in self.banners
//               {
//                var urlArr :[String] = []
//                if list.pic != nil {
//                    urlArr .append(list.pic!)
//                    urlArr.append("icon_banerplaceholder")
//                }
//                urls .append(urlArr)
//                
//                }
//                
//                self.cycleScrolllview.allImageUrls = urls as! [[String]]
//                self.cycleScrolllview.reloadImages()
//                self.cycleScrolllview.tapBlock = {index in
//                   
//                   let list  =  self.banners[index]
//                
//                        if list.url != nil && (list.url?.characters.count)! > 0 {
//                            
//                            DispatchQueue.main.async {
//                                let webVc = EDMWebViewController.start(title: list.title ?? "", url: list.url!)
//                                //                            webVc.hidesBottomBarWhenPushed = true
//                                self.navigationController?.pushViewController(webVc, animated: true);
//                            }
//                            
//                            
//                        }
//                }
//            }
//        })
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.title = "1111";
       tableView.registerCell(String(describing: SendRecordCell.self))
//        tableView.register(SendRecordCell.self, forCellReuseIdentifier: "UITableViewCell")

        tableView.estimatedRowHeight = 102;
        tableView.rowHeight = UITableViewAutomaticDimension
        navigationController?.navigationBar.barTintColor = UIColor.hexStringToUIColor(hex: "#FAFBFD");
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if(self.tabType=="recommend" || self.tabType=="new"){
            return 2
        }else{
            return 1
        }
    }
    
    
//    func requstAllData()  {
//        let OP1 = BlockOperation {
//            [unowned self]
//            () -> Void in
//            self.requstBannerData()
//        }
//        
//        let OP2 = BlockOperation {
//            [unowned self]
//            () -> Void in
//            self.getCollegeData(self.pageIndex)
//        }
//        OP2.addDependency(OP1)
//        let OP3 = BlockOperation {
//            [unowned self]
//            () -> Void in
//            self.getCourseData(self.pageIndex,1)
//        }
//        let QE = OperationQueue()
//        QE.addOperation(OP1)
//        QE.addOperation(OP2)
//        QE.addOperation(OP3)
//        QE.waitUntilAllOperationsAreFinished()
//    }
    
//    func addHeaderFooterView() {
//      self.tableView.mj_header =  MJRefreshNormalHeader(refreshingBlock: {
//        self.pageIndex = 1;
//        self.noMoreData = false ;
//        self.requstAllData()
//      });
//    }
    
    
//    func loadMoreData() {
//        
//        if noMoreData {
//            
//            tableView.mj_footer.endRefreshingWithNoMoreData();
//            return;
//        }
//        pageIndex += 1
//        getCollegeData(pageIndex)
//        
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(self.tabType=="recommend" || self.tabType=="new"){
            return 44
        }else{
            return 0
        }
        
    }
//    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 102
//    }
    
    
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if(self.tabType=="recommend"){
//            if(section==0){
//                let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
//                let label = UILabel(frame: CGRect(x: 40, y: 14, width: 100, height: 16))
//                label.text="今周课程"
//                let imageView=UIImageView(frame: CGRect(x: 12, y: 12, width: 20, height: 20))
//                imageView.image=UIImage(named:"kecheng")
//                view.addSubview(label)
//                view.addSubview(imageView)
//                return view
//            }else if(section==1){
//                let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
//                let label = UILabel(frame: CGRect(x: 40, y: 14, width: 100, height: 16))
//                label.text="干货 | 资讯"
//                let imageView=UIImageView(frame: CGRect(x: 12, y: 12, width: 20, height: 20))
//                imageView.image=UIImage(named:"zixun")
//                view.addSubview(label)
//                view.addSubview(imageView)
//                return view
//            }
//        }else if(self.tabType=="new"){
//            if(section==0){
//                let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
//                let label = UILabel(frame: CGRect(x: 40, y: 14, width: 100, height: 16))
//                label.text="今周课程"
//                let imageView=UIImageView(frame: CGRect(x: 12, y: 12, width: 20, height: 20))
//                imageView.image=UIImage(named:"kecheng")
//                view.addSubview(label)
//                view.addSubview(imageView)
//                return view
//            }else if(section==1){
//                let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
//                let label = UILabel(frame: CGRect(x: 40, y: 14, width: 100, height: 16))
//                label.text="往期课程"
//                let imageView=UIImageView(frame: CGRect(x: 12, y: 12, width: 20, height: 20))
//                imageView.image=UIImage(named:"kecheng_w")
//                view.addSubview(label)
//                view.addSubview(imageView)
//                return view
//            }
//        }
//        
//        return nil
//    }
   
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//       let cell  =  tableView.cellForRow(at: indexPath) as! EDMHomeNewView;
//        cell.titleLable?.textColor = UIColor.lightGray
//        
//        let model   = self.articles[indexPath.row];
//        if  var array =  UserDefaults.standard.object(forKey: kReadedArticleList) as? [String] {
//            
//            if(!array.contains(model.articleId!))
//            {
//                array.append(model.articleId!)
//                UserDefaults.standard.set(array, forKey:kReadedArticleList);
//            }
//            
//        }else
//        {
//            UserDefaults.standard.set([model.articleId!], forKey:kReadedArticleList);
//        }
//        UserDefaults.standard.synchronize()
//
//        if  model.link != nil  && (model.link?.characters.count)!>0 {
//            
//            let webVc = EDMWebViewController.start(title: model.title ?? "", url: model.link!)
//            self.navigationController?.pushViewController(webVc, animated: true);
//        }

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueCelllForReuse(SendRecordCell.self, indexPath: indexPath)
        
        
        return cell;
    }

    
    // MARK: - IndicatorInfoProvider

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
