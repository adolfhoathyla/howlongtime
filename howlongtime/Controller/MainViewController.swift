//
//  MainViewController.swift
//  howlongtime
//
//  Created by Adolfho Athyla on 31/05/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var startTextField: UITextField!
    @IBOutlet weak var endTextField: UITextField!
    
    var start: Date?
    var end: Date?
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configDatePicker()
        configTextFields()
        
        startTextField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - picker date
    private func configDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        datePicker.addTarget(self, action: #selector(MainViewController.datePickerValueChanged), for: .valueChanged)
    }
    
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        if startTextField.isFirstResponder {
            startTextField.text = sender.date.brazilianFormatStringDate()
            start = sender.date
        } else {
            endTextField.text = sender.date.brazilianFormatStringDate()
            end = sender.date
        }
    }
    
    // MARK: - text field
    private func configTextFields() {
        startTextField.delegate = self
        endTextField.delegate = self
        startTextField.inputView = datePicker
        endTextField.inputView = datePicker
    }
    
    // MARK: - text field delegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if startTextField.isFirstResponder && startTextField.text != "" {
            datePicker.date = start!
        } else if endTextField.isFirstResponder && endTextField.text != "" {
            datePicker.date = end!
        }
    }
    
    
    // MARK: - actions
    @IBAction func doneAction(_ sender: UIButton) {
        if let _ = start, let _ = end {
            if start!.isPrevThan(date: end!) {
                self.performSegue(withIdentifier: "GO_TO_YEARS_VIEW_CONTROLLER", sender: nil)
            } else {
                let alert = UIAlertController(title: "Oops!", message: "Initial date must be before end date.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        } else {
            let alert = UIAlertController(title: "Oops!", message: "Fill the fields.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let yearsVC = segue.destination as? YearsViewController
        yearsVC?.start = self.start
        yearsVC?.end = self.end
    }
    
}
