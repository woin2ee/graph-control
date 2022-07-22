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
        var typedText: Driver<String?>
    }
    
    struct Output {
        var graph: Driver<Graph>
    }
    
    // Input 을 Output 으로 변환
    func transform(input: Input) -> Output {
        let graph = Driver
            .merge(
                input.changedValue,
                input.typedText
                    .compactMap { Float($0!) }
                    .map {
                        if $0 > 100 {
                            return 100.0
                        } else {
                            return $0
                        }
                    }
            )
            .map { value in
                return Graph.init(value: value)
            }
        
        return Output.init(graph: graph)
    }
}
