
import UIKit

class ViewController: UIViewController {
    private var isFinishedTypingNumber: Bool = true
    private var displayValue: Double{
        set{
            displayLabel.text = String(newValue)
        }
        get{
            guard let number = Double(displayLabel.text!)else{
                fatalError("Cannot convert a String into Double")
            }
            return number
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let currentMethod = sender.currentTitle{
            
            if let result = calculator.calculate(symbol: currentMethod){
                displayValue = result
            }
            
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle{
            if isFinishedTypingNumber{
                if numValue == "."{
                    displayLabel.text = "0."
                }
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            }else{
                if numValue == "."{
                    if displayLabel.text!.contains("."){
                        return
                    }
                }
                displayLabel.text! += numValue
            }
        }
    }

}

