
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
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        
        if let currentMethod = sender.currentTitle{
            let calculator = CalculatorLogic(number: displayValue)
            guard let result = calculator.calculator(symbol: currentMethod) else{
                fatalError("The result is nil.")
            }
            displayValue = result
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
