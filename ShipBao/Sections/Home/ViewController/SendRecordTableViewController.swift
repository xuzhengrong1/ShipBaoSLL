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
import MJRefresh

class SendRecordTableViewController: UITableViewController, IndicatorInfoProvider {
    
    
    let cellIdentifier = "collegeCell"
    var blackTheme = false
    
    var pageIndex = 1
    var noMoreData = false
    var itemInfo = IndicatorInfo(title: "View")
    
        
    var tabType : String
    var orderList:[RecordList] = []
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
    
    func loadMoreData() {
        
        if noMoreData {
            
            tableView.mj_footer.endRefreshingWithNoMoreData();
            return;
        }
        pageIndex += 1
        getRecordListData(pageIndex)
        
    }
    
    
    func getRecordListData(_ page: Int) {
        
        XZRNetWorkTool.shared.getOrderList(scene: Int(self.tabType)!, page: page, pageSize: 5) { (response ) in

            if let recods  = response?.dataList?.recordList
            {
                
               
                if recods.count > 0
                {
                    if(self.pageIndex <= 1)
                    {
                       self.orderList = recods
                        DispatchQueue.main.async {
                            self.tableView.mj_footer = MJRefreshAutoNormalFooter.createFooter(self, refreshAction: #selector(self.loadMoreData))
                        }
                    }else
                    {
                        
                        self.orderList.append(contentsOf: recods);
                       
                    }

                }
                if   recods.count < 5 {
                    self.noMoreData = true
                    if((self.tableView.mj_footer) != nil)
                    {
                        self.tableView.mj_footer.endRefreshingWithNoMoreData();
                    }
                }
                
            }
             self.tableView.reloadData();
            self.endMJRefresh();
    }
    }
//
//
    func endMJRefresh() {
        self.tableView.mj_header.endRefreshing()
        if((self.tableView.mj_footer) != nil)
        {
            self.tableView.mj_footer.endRefreshing()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if tabType == "1" {
          tableView.registerCell(String(describing: SendRecordCell.self))
        }else
        {
            tableView.registerCell(String(describing: SendRecordNoFinaishedCell.self))
        }
       
        self.pageIndex = 1;
        tableView.estimatedRowHeight = 102;
        tableView.rowHeight = UITableViewAutomaticDimension
        navigationController?.navigationBar.barTintColor = UIColor.hexStringToUIColor(hex: "#FAFBFD");
        self.addHeaderFooterView();
    }

    
    

    
    func addHeaderFooterView() {
        self.tableView.mj_header =  MJRefreshNormalHeader(refreshingBlock: {
            self.pageIndex = 1;
            self.noMoreData = false ;
        self.getRecordListData(self.pageIndex);
        });
        self.getRecordListData(self.pageIndex);
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return orderList.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10;
        
    }
   
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let cellData = self.orderList[indexPath.section];
        

        let vc =   getControllerFromStoryBoard("Home", identity:String(describing: OrderDetailsViewController.self)) as! OrderDetailsViewController;
        vc.orderList = cellData;
         navigationController?.pushViewController(vc, animated: true)
        
        
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
        if tabType == "1" {
            let cell = tableView.dequeueCelllForReuse(SendRecordCell.self, indexPath: indexPath) as! SendRecordCell
            let cellData = self.orderList[indexPath.section];
            cell.record = cellData;
            return cell;

        }else
        {
            let cell = tableView.dequeueCelllForReuse(SendRecordNoFinaishedCell.self, indexPath: indexPath) as! SendRecordNoFinaishedCell
            let cellData = self.orderList[indexPath.section];
            cell.record = cellData;
            return cell;
        }
       
           }

    
    // MARK: - IndicatorInfoProvider

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
