//
//  ArticleNewsTests.swift
//  ArticleNewsTests
//
//  Created by Bing Bing on 2022/6/17.
//

import XCTest
@testable import ArticleNews

class ArticleNewsTests: XCTestCase {
    
    private var mockInteractor: ArticleNewsRemoteDataSourceProtocol!
    private var viewModelToTest: TopStoriesViewModelProtocol!
    private var remoteDataSource: RemoteDataSourceProtocol!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        remoteDataSource = MockRemoteDataSource()
        mockInteractor = remoteDataSource.articleNewsDataSource()
        viewModelToTest = TopStoriesViewModel(interactor: mockInteractor)
    }

    override func tearDownWithError() throws {
        mockInteractor = nil
        viewModelToTest = nil
        remoteDataSource = nil
        try super.tearDownWithError()
    }
    
    func testStoriesEmpty() {
        
        let expectation = XCTestExpectation(description: "Should get empty state")
        
        viewModelToTest.getTopStoryIds { result in
            switch result {
            case .success(let ids):
                XCTAssertTrue(ids.isEmpty)
                expectation.fulfill()
            case .failure:
                XCTFail("not possible")
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
}

class MockRemoteDataSource: RemoteDataSourceProtocol {
    
    func articleNewsDataSource() -> ArticleNewsRemoteDataSourceProtocol {
        return MockArticleRemoteDataSource()
    }
}

class MockArticleRemoteDataSource: ArticleNewsRemoteDataSourceProtocol {
    
    func getTopStoryIDs(completion: @escaping (Result<StoryIDResult, Error>) -> Void) {
        completion(.success([]))
    }
    
    func getArticle(_ id: Int, completion: @escaping (Result<Article, Error>) -> Void) {
        let article = Article(id: 1,
                              by: "bing bing",
                              descendants: 391,
                              kids: [],
                              score: 1000,
                              time: 0,
                              title: "Hertzbleed Attack",
                              type: "story",
                              url: "")
        completion(.success(article))
    }
    
    
}
