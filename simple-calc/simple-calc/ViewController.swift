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
    public final let possibleOperands: [String] = ["+", "-", "/", "%", "x", "count", "avg", "fact"]
    
    public var currentOperator: ((Int, Int) -> Int)? = nil
    
    @IBAction func numberPressed(_ sender: Any) {
        let number = (sender as AnyObject).titleLabel!!.text
        addNum(number!)
    }
    
    func addNum(_ num: String) {
        if calcDisplay.text! == "0" {
            calcDisplay.text = num
        } else {
            calcDisplay.text! += num
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
        calcDisplay.text! = "0"
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
        
        if arg.contains("count") || arg.contains("avg") || arg.contains("fact") {
            let numString: [String] = arg.characters.split(separator: " ").map(String.init)
            var numbers: [Int] = []
            for i in 0...numString.count - 1 {
                if !possibleOperands.contains(numString[i]) {
                    numbers.append(Int(numString[i])!)
                }
            }
            
            if arg.contains("count") {
                calcDisplay.text = String(count(nums: numbers))
            } else if arg.contains("avg") {
                calcDisplay.text = String(average(nums: numbers))
            } else if arg.contains("fact") {
                calcDisplay.text = String(factorial(num: numbers[0]))
            }
        } else if arg.contains("+") || arg.contains("-") || arg.contains("/") || arg.contains("%") || arg.contains("x") {
            let numbers = arg.characters.split(separator: " ")
            let left: Int = Int(String(numbers[0]))!
            let right: Int = Int(String(numbers[2]))!
            calcDisplay.text! = String(operate(left: left, right: right, operation: currentOperator!))
        }
        
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

