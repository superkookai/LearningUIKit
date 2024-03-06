//
//  Variable.swift
//  LearningUIKit
//
//  Created by Weerawut Chaiyasomboon on 6/3/2567 BE.
//

import Foundation

class Variable<Value> {
    var value: Value {
        didSet {
            DispatchQueue.main.async {
                self.onUpdate?(self.value)
            }
        }
    }

    var onUpdate: ((Value) -> Void)? {
        didSet {
            DispatchQueue.main.async {
                self.onUpdate?(self.value)
            }
        }
    }

    init(_ value: Value, _ onUpdate: ((Value) -> Void)? = nil) {
        self.value = value
        self.onUpdate = onUpdate
        DispatchQueue.main.async {
            self.onUpdate?(self.value)
        }
    }
}
