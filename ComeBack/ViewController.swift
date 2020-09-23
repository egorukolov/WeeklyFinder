//
//  ViewController.swift
//  ComeBack
//
//  Created by Egor Ukolov on 20.09.2020.
//  Copyright © 2020 Egor Ukolov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var monthTextField: UITextField!
    @IBOutlet var yearTextField: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    
    
    @IBAction func findDay(_ sender: Any) {
        
        let calendar = Calendar.current
        
        guard let day = dateTextField.text, let month = monthTextField.text, let year = yearTextField.text else { return }
        
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "EEEE"
        
        guard let date = calendar.date(from: dateComponents) else { return }
        
        
        let weekday = dateFormatter.string(from: date)
        let capitalizedWeekday = weekday.capitalized
        
        resultLabel.text = capitalizedWeekday
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

