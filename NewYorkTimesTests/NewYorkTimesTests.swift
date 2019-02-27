//
//  NewYorkTimesTests.swift
//  NewYorkTimesTests
//
//  Created by Zeeshan Badshah on 26/02/2019.
//  Copyright © 2019 Zeeshan Badshah. All rights reserved.
//

import XCTest
@testable import NewYorkTimes

class NewYorkTimesTests: XCTestCase {

    var mainVC = MainVC()
    var detailVC = DetailVC()
    var storyBaord = UIStoryboard()
    override func setUp() {
        super.setUp()
        storyBaord = UIStoryboard(name: "Main", bundle: nil)
        mainVC = storyBaord.instantiateViewController(withIdentifier: "mainVC") as! MainVC
        detailVC = storyBaord.instantiateViewController(withIdentifier: "detailVC") as! DetailVC
        _ = mainVC.view
        _ = detailVC.view
    }
    
    func testHasMainVC() {
        
        XCTAssertNotNil(mainVC,"No mainVC identifier found")
       
    }
    
    func testInitTableView()  {
        
        XCTAssertNotNil(mainVC.tblView)
    }
    
    func testHasTableViewDataSource()  {
        
        XCTAssertTrue(mainVC.tblView.dataSource is MainVC)
    }
    
    func testHasTableViewDelegate()  {
        
        XCTAssertTrue(mainVC.tblView.delegate is MainVC)
    }
    
    func testFeedsJsonParse()  {
        
        let filterMostViewed = "mostpopular/v2/mostviewed/all-sections/7.json?api-key="

        WebApiMock().getFeeds(filter: filterMostViewed) { (feeds) in
            
            XCTAssertTrue(feeds.results.count > 0)
            
            if(feeds.results.count > 0){
                
                self.mainVC.feeds = feeds.results
                self.mainVC.tblView.reloadData()
            }
        }
    }
    
    func testTableViewHasCells()  {

        testFeedsJsonParse()
        XCTAssertEqual(mainVC.tblView.numberOfRows(inSection: 0), 1)
        XCTAssertGreaterThan(mainVC.tblView.numberOfRows(inSection: 0), 0)
    }
    
    
    func testHasDetailVC() {
        
            XCTAssertNotNil(detailVC,"No detailVC identifier found")
    }
    
    func testHasDetailVCWebView() {
        
        testHasDetailVC()
        XCTAssertNotNil(detailVC.webview, "No Webview found")
    }
    
    

}
