//
//  ViewController.swift
//  Calc
//
//  Created by Liuqing Du on 21/05/2015.
//  Copyright (c) 2015 JuneDesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var strResult = "0"
    var type: CalcType = .Nil
    var leftValue: Double?
    var rightValue: Double?
    var isCalc = false
    
    @IBOutlet weak var labelResult: UILabel!

    @IBAction func btnDot() {
        if (strResult.componentsSeparatedByString(".").count < 2) {
            strResult += "."
            labelResult.text = strResult
        }
    }
    
    @IBAction func btns(sender: UIButton) {
        addNum(Int(sender.titleLabel!.text!)!)
    }
//    @IBAction func btn0() {
//        addNum(0)
//    }
//    @IBAction func btn1() {
//        addNum(1)
//    }
//    @IBAction func btn2() {
//        addNum(2)
//    }
//    @IBAction func btn3() {
//        addNum(3)
//    }
//    @IBAction func btn4() {
//        addNum(4)
//    }
//    @IBAction func btn5() {
//        addNum(5)
//    }
//    @IBAction func btn6() {
//        addNum(6)
//    }
//    @IBAction func btn7() {
//        addNum(7)
//    }
//    @IBAction func btn8() {
//        addNum(8)
//    }
//    @IBAction func btn9() {
//        addNum(9)
//    }
    @IBAction func btnC() {
        strResult = "0"
        type = .Nil
        leftValue = nil
        rightValue = nil
        labelResult.text = strResult
    }
    @IBAction func btnN() {
        let num = (strResult as NSString).doubleValue
        strResult = "\(num * -1)"
        if (Int(strResult.componentsSeparatedByString(".")[1]) == 0) {
            strResult = (strResult.componentsSeparatedByString(".")[0])
        }
        labelResult.text = strResult
    }
    @IBAction func btnH() {
        let num = (strResult as NSString).doubleValue
        strResult = "\(num / 100)"
        if (Int(strResult.componentsSeparatedByString(".")[1]) == 0) {
            strResult = (strResult.componentsSeparatedByString(".")[0])
        }
        labelResult.text = strResult
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
        labelResult.text = strResult
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
        if (Int(strResult.componentsSeparatedByString(".")[1]) == 0) {
            strResult = (strResult.componentsSeparatedByString(".")[0])
        }
        labelResult.text = strResult
        leftValue = nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
//58 x 58 AppIconiPhone29x29@2x.png, 87 x 87 AppIconiPhone29x29@3x.png, 80 x 80 AppIconiPhone40x40@2x.png, 120 x 120 AppIconiPhone40x40@3x.png, 120 x 120 AppIconiPhone60x60@2x.png, 180 x 180 AppIconiPhone60x60@3x.png, 29 x 29 AppIconiPad29x29@1x.png, 58 x 58 AppIconiPad29x29@2x.png, 40 x 40 AppIconiPad40x40@1x.png, 80 x 80 AppIconiPad40x40@2x.png, 76 x 76 AppIconiPad76x76@1x.png, 152 x 152 AppIconiPad76x76@2x.png

enum CalcType {
    case Divide
    case Multiply
    case Subtract
    case Add
    case Nil
}
