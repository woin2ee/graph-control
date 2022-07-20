//
//  MainViewModel.swift
//  GraphControl
//
//  Created by Jaewon on 2022/07/18.
//

import Foundation
import RxSwift
import RxCocoa

final class MainViewModel: ViewModelType {
    
    private let initialValue: Double = 50
    
    struct Input {
        var didChangeValue: Driver<Float>
    }
    
    struct Output {
        var graph: Driver<Graph>
    }
    
    // Input 을 Output 으로 변환
    func transform(input: Input) -> Output {
        let observableGraph: Observable<Graph> = .of(Graph.init(value: initialValue))
        
        let graph = input.didChangeValue
            .withLatestFrom(
                observableGraph.asDriver(onErrorJustReturn: Graph.init(value: initialValue))
            )
            
        return Output.init(graph: graph)
    }
}
