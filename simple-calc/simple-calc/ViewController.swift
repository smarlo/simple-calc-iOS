//
//  ViewController.swift
//  simple-calc
//
//  Created by Sabrina Niklaus on 4/14/17.
//  Copyright © 2017 Sabrina Niklaus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var calcDisplay: UILabel!
    public var currentOperator: ((Int, Int) -> Int)? = nil
    
    @IBAction func onePressed(_ sender: Any) {
        addNum(1)
    }
    
    @IBAction func twoPressed(_ sender: Any) {
        addNum(2)
    }
    
    @IBAction func threePressed(_ sender: Any) {
        addNum(3)
    }
    
    @IBAction func fourPressed(_ sender: Any) {
        addNum(4)
    }
    
    @IBAction func fivePressed(_ sender: Any) {
        addNum(5)
    }
    
    @IBAction func sixPressed(_ sender: Any) {
        addNum(6)
    }
    
    @IBAction func sevenPressed(_ sender: Any) {
        addNum(7)
    }
    
    @IBAction func eightPressed(_ sender: Any) {
        addNum(8)
    }
    
    @IBAction func ninePressed(_ sender: Any) {
        addNum(9)
    }
    
    @IBAction func zeroPressed(_ sender: Any) {
        if calcDisplay.text != nil && calcDisplay.text! != "" {
            calcDisplay.text! += "0"
        }
    }
    
    func addNum(_ num: Int) {
        if calcDisplay.text! == "0" {
            calcDisplay.text = String(num)
        } else {
            calcDisplay.text! += String(num)
        }
    }
    
    @IBAction func add(_ sender: Any) {
        currentOperator = add
        calcDisplay.text! += " + "
    }
    
    @IBAction func subtract(_ sender: Any) {
        currentOperator = subtract
        calcDisplay.text! += " - "
    }
    
    @IBAction func multiply(_ sender: Any) {
        currentOperator = multiply
        calcDisplay.text! += " x "
    }
    
    @IBAction func divide(_ sender: Any) {
        currentOperator = divide
        calcDisplay.text! += " / "
    }
    
    @IBAction func modulo(_ sender: Any) {
        currentOperator = modulo
        calcDisplay.text! += " % "
    }
    
    @IBAction func count(_ sender: Any) {
        //currentOperator = count
        calcDisplay.text! += " count "
    }
    
    @IBAction func average(_ sender: Any) {
        calcDisplay.text! += " avg "
    }
    
    @IBAction func factorial(_ sender: Any) {
        calcDisplay.text! += " fact "
    }
    
    @IBAction func clear(_ sender: Any) {
        calcDisplay.text! = ""
    }
    
    func operate(left: Int, right: Int, operation: (Int, Int) -> Int) -> Int {
        return operation(left, right)
    }
    
    func add(left: Int, right: Int) -> Int {
        return left + right
    }
    
    func subtract(left: Int, right: Int) -> Int {
        return left - right
    }
    
    func multiply(left: Int, right: Int) -> Int {
        return left * right
    }
    
    func divide(left: Int, right: Int) -> Int {
        return left / right
    }
    
    func modulo(left: Int, right: Int) -> Int {
        return left % right
    }
    
    func count(nums: [Int]) -> Int {
        return nums.count
    }
    
    func average(nums: [Int]) -> Int {
        var sum = 0
        for num in nums {
            sum += num
        }
        return sum / nums.count
    }
    
    func factorial(num: Int) -> Int {
        if (num < 0) {
            return -1
        } else if (num == 1 || num == 0) {
            return 1
        }
        
        return num * factorial(num: (num - 1))
    }
    
    @IBAction func calculate(_ sender: Any) {
        let arg = calcDisplay.text!
        var result: Int = 0
        
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

