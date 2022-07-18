//
//  NSLayoutConstraint.swift
//  GraphControl
//
//  Created by Jaewon on 2022/07/18.
//

import UIKit

extension NSLayoutConstraint {
    static func updateMultiplier(of constraint: inout NSLayoutConstraint, _ multiplier: CGFloat) {
        let newConstraint = NSLayoutConstraint(
            item: constraint.firstItem!,
            attribute: constraint.firstAttribute,
            relatedBy: constraint.relation,
            toItem: constraint.secondItem,
            attribute: constraint.secondAttribute,
            multiplier: multiplier,
            constant: constraint.constant
        )
        newConstraint.identifier = constraint.identifier
        newConstraint.priority = constraint.priority
        newConstraint.shouldBeArchived = constraint.shouldBeArchived
        
        NSLayoutConstraint.deactivate([constraint])
        NSLayoutConstraint.activate([newConstraint])
        
        constraint = newConstraint
    }
}
