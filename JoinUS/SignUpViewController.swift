//
//  ViewController.swift
//  JoinUS
//
//  Created by Abdulelah Almaniei on 2/12/17.
//  Copyright © 2017 Abdulelah Almaniei. All rights reserved.
//

import UIKit
import Firebase
class SignUpViewController: UIViewController {
    
    //datePicker
    @IBOutlet weak var datePicker: UITextField!
    let datepicker = UIDatePicker()
    //DatePicker
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //DatePicker
        CreateDatePicker()
        //DatePicker
        // Do any additional setup after loading the view, typically from a nib.
        
     //   self.navigationController?.isNavigationBarHidden = false

    }
    
    //DatePicker - Start
    func CreateDatePicker(){
        
        datepicker.datePickerMode = .date
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let DoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([DoneButton], animated: false)

        datePicker.inputAccessoryView = toolbar
        datePicker.inputView = datepicker
    }
    func donePressed() {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .short
        dateFormater.timeStyle = .none
        datePicker.text = dateFormater.string(from: datepicker.date)
        self.view.endEditing(true)
    }
    //DatePicker - End
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

