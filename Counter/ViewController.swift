//
//  ViewController.swift
//  Counter
//
//  Created by Vitek on 12/11/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButtton: UIButton!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var resetQuantity: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewConstraints()
        setHistoryTextView()
        addHistory("История изменений:")
        
    }
    
    func quantyLabel() {
        quantity.text = "\(counter)"
    }
    
    func setHistoryTextView() {
        historyTextView.isEditable = false
        historyTextView.isScrollEnabled = true
        historyTextView.text = ""
        }
    
    func addHistory(_ text: String) {
        historyTextView.text += text + "\n"
        scrollBottom()
    }
    
    func scrollBottom(){
        let range = NSRange(location: historyTextView.text.count - 1, length: 1)
        historyTextView.scrollRangeToVisible(range)
    }
    
    func currentDateTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter.string(from: Date())
    }

    @IBAction func resetCounter(_ sender: UIButton) {
        if counter > 0 {
            counter = 0
            quantyLabel()
            addHistory("[\(currentDateTime())]: значение сброшено")
        }
    }
    
    @IBAction func plusCounter(_ sender: UIButton) {
        counter += 1
        quantyLabel()
        addHistory("[\(currentDateTime())]: значение изменено на +1")
    }
    
    @IBAction func minusCounter(_ sender: UIButton) {
        if counter > 0 {
            counter -= 1
            quantyLabel()
            addHistory("[\(currentDateTime())]: значение сброшено")
        }
        
    }
}

