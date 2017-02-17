//
//  ViewController.swift
//  JoinUS
//
//  Created by Abdulelah Almaniei on 2/12/17.
//  Copyright © 2017 Abdulelah Almaniei. All rights reserved.
//

import UIKit
import Firebase
class SignUpViewController: UIViewController ,UITextFieldDelegate{
    
    //datePicker
    @IBOutlet weak var datePicker: UITextField!
    let datepicker = UIDatePicker()
    //!DatePicker
    
    @IBOutlet var gender: UISegmentedControl!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var city: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //DatePicker
        
        CreateDatePicker()
        name.delegate = self
        email.delegate = self
        password.delegate = self
        city.delegate = self
        
        //!DatePicker
        //screen move with keyboard
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        //!screen move with keyboard
        // Do any additional setup after loading the view, typically from a nib.
        
     //   self.navigationController?.isNavigationBarHidden = false

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == name{
            name.resignFirstResponder()
            email.becomeFirstResponder()
            print("Next")
        }else if textField == email {
            email.resignFirstResponder()
            password.becomeFirstResponder()
        }else if textField == password{
            password.resignFirstResponder()
            city.becomeFirstResponder()
        }else{
            city.resignFirstResponder()
        }
        print("Next")

        return true
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    //DatePicker - Start
    func CreateDatePicker(){
        
        datepicker.datePickerMode = .date
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let DoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
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
    //!DatePicker - End
    
    //keyboard return
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        name.resignFirstResponder()
        email.resignFirstResponder()
        password.resignFirstResponder()
        city.resignFirstResponder()
    }
    //!keyboard return
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //clear Field
    
    //!clear Field
    

    
    
    
}

