//
//  Mercadolibre_iOSTests.swift
//  Mercadolibre_iOSTests
//
//  Created by Andres Carrillo on 3/01/21.
//

import XCTest
@testable import Mercadolibre_iOS

final class Mercadolibre_iOSTests: XCTestCase {
    
    var searchItemsRepository: SearchItemsRepository!
    
    override func setUp() {
        super.setUp()
        searchItemsRepository = SearchItemsRepository(SearchItemsServiceMock())
    }
    
    override func tearDown() {
        super.tearDown()
        searchItemsRepository = nil
    }
    
    func test_SearchItems_SuccessfulResponse() {
        //given
        var items: [APISearchItem]?
        let successCase = "Success"
        let promise = expectation(description: "get items from a search")
        
        //when
        searchItemsRepository.getListOfItems(params: successCase) { result in
            switch result {
            case .success(let response):
                 items = response.results
                promise.fulfill()
                break
            case .failure(_):
                XCTFail()
                break
            }
        }
        
        //then
        wait(for: [promise], timeout: 1.0)
        XCTAssertNotNil(items)
    }
    
    func test_ProductConditionIsNew() {
        //given
        let expectedCondition = "new"
        
        //when
        let item = TestObjects.searchAPIItem_New
        
        //then
        XCTAssertEqual(expectedCondition, item.condition)
    }
    
    func test_ProductConditionIsUsed() {
        //given
        let expectedCondition = "used"
        
        //when
        let item = TestObjects.searchAPIItem_Used
        
        //then
        XCTAssertEqual(expectedCondition, item.condition)
    }
    
    func test_MessageWhenItemStockIsOne() {
        //given
        let expectedMessage = "¡Última disponible!"
        
        //when
        let item = ProductItem(apiItem: TestObjects.searchAPIItem_StockOne)
        
        //then
        XCTAssertEqual(expectedMessage, item.availableQuantity)
    }
    
    func test_Message_WhenConditionIsNew() {
        //given
        let expectedCondition = "Nuevo"
        
        //when
        let item = ProductItem(apiItem: TestObjects.searchAPIItem_New)
        
        //then
        XCTAssertEqual(expectedCondition, item.condition.rawValue)
    }
    
    func test_Message_WhenConditionIsUsed() {
        //given
        let expectedCondition = "Usado"
        
        //when
        let item = ProductItem(apiItem: TestObjects.searchAPIItem_Used)
        
        //then
        XCTAssertEqual(expectedCondition, item.condition.rawValue)
    }
    
    func test_Message_WhenIsFreeShipping() {
        //given
        let expectedMessage = "Envío gratis"
        
        //when
        let item = ProductItem(apiItem: TestObjects.searchAPIItem_New)
        
        //then
        XCTAssertEqual(expectedMessage, item.shipping)
    }
    
    func test_Message_WhenIsNotFreeShipping() {
        //given
        let expectedMessage = ""
        
        //when
        let item = ProductItem(apiItem: TestObjects.searchAPIItem_Used)
        
        //then
        XCTAssertEqual(expectedMessage, item.shipping)
    }

}
