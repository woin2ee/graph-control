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
    
    struct Input {
        var changedValue: Driver<Float>
    }
    
    struct Output {
        var graph: Driver<Graph>
    }
    
    // Input 을 Output 으로 변환
    func transform(input: Input) -> Output {
        let graph = input.changedValue
            .map { value in
                return Graph.init(value: value)
            }
        
        return Output.init(graph: graph)
    }
}
