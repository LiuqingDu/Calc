//
//  InterfaceController.swift
//  Calc WatchKit Extension
//
//  Created by Liuqing Du on 21/05/2015.
//  Copyright (c) 2015 JuneDesign. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    var strResult = "0"
    var type: CalcType = .Nil
    var leftValue: Double?
    var rightValue: Double?
    var isCalc = false
    
    @IBOutlet weak var labelResult: WKInterfaceLabel!
    
    @IBAction func btn0() {
        addNum(0)
    }
    @IBAction func btnDot() {
        if (strResult.componentsSeparatedByString(".").count < 2) {
            strResult += "."
            labelResult.setText(strResult)
        }
    }
    @IBAction func btn1() {
        addNum(1)
    }
    @IBAction func btn2() {
        addNum(2)
    }
    @IBAction func btn3() {
        addNum(3)
    }
    @IBAction func btn4() {
        addNum(4)
    }
    @IBAction func btn5() {
        addNum(5)
    }
    @IBAction func btn6() {
        addNum(6)
    }
    @IBAction func btn7() {
        addNum(7)
    }
    @IBAction func btn8() {
        addNum(8)
    }
    @IBAction func btn9() {
        addNum(9)
    }
    @IBAction func btnC() {
        strResult = "0"
        type = .Nil
        leftValue = nil
        rightValue = nil
        labelResult.setText(strResult)
    }
    @IBAction func btnN() {
        let num = (strResult as NSString).doubleValue
        strResult = "\(num * -1)"
        labelResult.setText(strResult)
    }
    @IBAction func btnH() {
        let num = (strResult as NSString).doubleValue
        strResult = "\(num / 100)"
        labelResult.setText(strResult)
    }
    @IBAction func btnD() {
        toRight()
        type = .Divide
    }
    @IBAction func btnM() {
        toRight()
        type = .Multiply
    }
    @IBAction func btnS() {
        toRight()
        type = .Subtract
    }
    @IBAction func btnA() {
        toRight()
        type = .Add
    }
    @IBAction func btnR() {
        if (isCalc) {
            calculate()
        }
        isCalc = false
    }
    
    func toRight() {
        if (!isCalc) {
            leftValue = (strResult as NSString).doubleValue
            isCalc = true
            rightValue = nil
        }
    }
    
    func addNum(num: Int) {
        if (!isCalc) {
            if (leftValue == nil) {
                strResult = "0"
            }
            setNum(num)
            leftValue = (strResult as NSString).doubleValue
        } else {
            if (rightValue == nil) {
                strResult = "0"
            }
            setNum(num)
            rightValue = (strResult as NSString).doubleValue
        }
        labelResult.setText(strResult)
    }
    
    func setNum(num: Int) {
        if (strResult == "0") {
            strResult = "\(num)"
        } else {
            strResult += "\(num)"
        }
    }
    
    func calculate() {
        switch type
        {
        case .Add:
            leftValue! += rightValue!
        case .Subtract:
            leftValue! -= rightValue!
        case .Multiply:
            leftValue! *= rightValue!
        case .Divide:
            leftValue! /= rightValue!
        default:
            return
        }
        strResult = ("\(leftValue!)")
        labelResult.setText(strResult)
        leftValue = nil
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}

enum CalcType {
    case Divide
    case Multiply
    case Subtract
    case Add
    case Nil
}
