//
//  Brain.swift
//  Calc
//
//  Created by Andriy_Moravskyi on 6/23/17.
//  Copyright © 2017 Andriy_Moravskyi. All rights reserved.
//

import Foundation
func changeSign(operand: Double)-> Double{
    return -operand
}
struct Brain {
    private var acumulator: Double?
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation ((Double,Double) -> Double)
        case equals
    }
    private var operations: Dictionary<String,Operation> = [
        "π" : Operation.constant(Double.pi),
        "e" : Operation.constant(M_E),
        "√" : Operation.unaryOperation(sqrt),
        "cos" : Operation.unaryOperation(cos),
        "±" : Operation.unaryOperation(changeSign),
        "×" : Operation.binaryOperation({$0 * $1}),
        "÷" : Operation.binaryOperation({$0 / $1}),
        "+" : Operation.binaryOperation({$0 + $1}),
        "-" : Operation.binaryOperation({$0 - $1}),
        "=" : Operation.equals
    ]

    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol]{
            switch operation {
            case .constant(let value):
            acumulator = value
            case .unaryOperation(let function):
                if acumulator != nil{
                acumulator = function(acumulator!)
                 }
            case .binaryOperation(let function):
                if acumulator != nil{
                pendingBinaryOperation = PendingBinariOperation (function: function, firstOperand: acumulator!)
                acumulator = nil
                }
            case .equals:
                performPendingBinaryOperation ()
            
        }
    }
}
    private mutating func performPendingBinaryOperation(){
        if pendingBinaryOperation != nil && acumulator != nil{
        acumulator = pendingBinaryOperation!.perform(with: acumulator!)
        pendingBinaryOperation = nil
            
        }
    }
    
    private var pendingBinaryOperation: PendingBinariOperation?
    
    private struct PendingBinariOperation{
        let function: (Double,Double) -> Double
        let firstOperand: Double
        func perform( with secondOperand: Double) -> Double {
            return function(firstOperand,secondOperand)
        }
    }
    
   mutating func setOperand(_ operand: Double){
        acumulator = operand
    }
    var result :Double? {
        get {
        return acumulator
        }
    }
    }
