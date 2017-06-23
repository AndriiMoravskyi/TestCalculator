//
//  Brain.swift
//  Calc
//
//  Created by Andriy_Moravskyi on 6/23/17.
//  Copyright © 2017 Andriy_Moravskyi. All rights reserved.
//

import Foundation
struct Brain {
    private var acumulator: Double?
    private enum Operation {
     case constant(Double)
     case unaryOperation((Double) -> Double)
    }
    private var operations: Dictionary<String,Operation> = [
        "π" : Operation.constant(Double.pi),
        "e" : Operation.constant(M_E),
        "√" : Operation.unaryOperation(sqrt),
        "cos" : Operation.unaryOperation(cos),
        "±" : Operation.unaryOperation(cos),
        "×" : Operation.unaryOperation(cos),
        "÷" : Operation.unaryOperation(cos),
        "=" : Operation.unaryOperation(cos)
    ]

    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol]{
            switch operation {
            case .constant(let value):
            acumulator = value
            case .unaryOperation:
            break}
            
        }
        
    }
    mutating func setOperand(_ operand: Double){
        acumulator = operand
    }
    var result :Double? {
        get {
        return acumulator!
        }
    }
}
