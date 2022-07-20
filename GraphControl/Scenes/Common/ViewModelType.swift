//
//  ViewModelType.swift
//  GraphControl
//
//  Created by Jaewon on 2022/07/20.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
