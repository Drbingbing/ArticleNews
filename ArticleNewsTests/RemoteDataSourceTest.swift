//
//  RemoteDataSourceTest.swift
//  ArticleNewsTests
//
//  Created by Bing Bing on 2022/6/17.
//

import XCTest
@testable import ArticleNews

class RemoteDataSourceTest: XCTestCase {
    
    private var remoteDataSourceToTest: RemoteDataSourceProtocol!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        remoteDataSourceToTest = RemoteDataSource()
    }
    
    override func tearDownWithError() throws {
        remoteDataSourceToTest = nil
        try super.tearDownWithError()
    }
    
    func testArticleIDs() {
        let articleDataSource = remoteDataSourceToTest.articleNewsDataSource()
        
        let expectation = XCTestExpectation(description: "Should get top story ids")
        
        articleDataSource.getTopStoryIDs { result in
            switch result {
            case .success(let ids):
                XCTAssertTrue(!ids.isEmpty)
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testArticle() {
        
        let articleDataSource = remoteDataSourceToTest.articleNewsDataSource()
        
        let expectation = XCTestExpectation(description: "Should get top article")
        
        articleDataSource.getTopStoryIDs { result in
            switch result {
            case .success(let ids):
                XCTAssertTrue(!ids.isEmpty)
                articleDataSource.getArticle(ids.first!) { articleResult in
                    switch articleResult {
                    case .success(let article):
                        print(article)
                        expectation.fulfill()
                    case .failure(let error):
                        XCTFail(error.localizedDescription)
                        expectation.fulfill()
                    }
                }
            case .failure(let error):
                XCTFail(error.localizedDescription)
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 10)
    }
}
