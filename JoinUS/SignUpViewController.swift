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
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var city: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //DatePicker
        CreateDatePicker()
        //!DatePicker
        //screen move with keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        //!screen move with keyboard
        // Do any additional setup after loading the view, typically from a nib.
        
     //   self.navigationController?.isNavigationBarHidden = false

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
    func RemoveInitialText(sender : UITextField){
        
        if  ((sender.text == "Name") ||  (sender.text == "Email") ||  (sender.text == "Password") ||  (sender.text == "City") ||  (sender.text == "Password")){
            
            sender.text = ""
        }
    }
    
    //clear Field
    @IBAction func nameField(_ sender: Any) {
        RemoveInitialText(sender: sender as! UITextField)
    }
    @IBAction func emailField(_ sender: Any) {
         RemoveInitialText(sender: sender as! UITextField)
    }

    @IBAction func passField(_ sender: Any) {
         RemoveInitialText(sender: sender as! UITextField)
    }
    @IBAction func cityField(_ sender: Any) {
         RemoveInitialText(sender: sender as! UITextField)
    }
    //!clear Field
    

    
    
    
}

