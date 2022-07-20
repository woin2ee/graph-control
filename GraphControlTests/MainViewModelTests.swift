//
//  MainViewModelTests.swift
//  MainViewModelTests
//
//  Created by Jaewon on 2022/07/20.
//

import XCTest
import RxSwift
import RxCocoa
@testable import GraphControl

class MainViewModelTests: XCTestCase {
    
    let disposeBag = DisposeBag.init()
    
    var viewModel: MainViewModel!
    
    override func setUp() {
        self.viewModel = MainViewModel.init()
    }
    
    func test_transform_changeValue() {
        // arrange
        let value = PublishSubject<Float>.init()
        
        let input = MainViewModel.Input.init(didChangeValue: value.asDriver(onErrorJustReturn: -1))
        let output = viewModel.transform(input: input)
        
        let expectedValue: Float = 100
        var actualValue: Float = 0
        
        // act
        output.graph
            .do(onNext: { actualValue = $0.value })
            .drive()
            .disposed(by: disposeBag)
        
        value.onNext(100)
        
        // assert
        XCTAssertEqual(expectedValue, actualValue)
    }
}
