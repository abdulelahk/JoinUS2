//
//  ViewController.swift
//  JoinUS
//
//  Created by Abdulelah Almaniei on 2/12/17.
//  Copyright © 2017 Abdulelah Almaniei. All rights reserved.
//

import UIKit
import Firebase



class LoginViewController: UIViewController , UITextFieldDelegate {
    
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.email.delegate = self
        self.email.returnKeyType = .done
        self.password.delegate = self
        self.password.returnKeyType = .done

        // Do any additional setup after loading the view, typically from a nib.
    }

    func RemoveInitialText(sender : UITextField){
       
        if  sender.text == "Email" ||  sender.text == "Password"{
            
        sender.text = ""
    }
    }
    
    @IBAction func EmailFieldTouched(_ sender: Any) {
        RemoveInitialText(sender: sender as! UITextField)
    }
    
    @IBAction func PasswordFieldTouched(_ sender: Any) {
        RemoveInitialText(sender: sender as! UITextField)

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      
        email.resignFirstResponder()
        password.resignFirstResponder()
        
        return true
    }
    
    @IBAction func signin(_ sender: Any) {
        
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z.-]{2,3}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        if  !emailTest.evaluate(with: email.text) || password.text == "" {
            // Wrong email format OR empty password!

            let alert = UIAlertController(title: "Wrong input!", message: "Please check the entered data. ", preferredStyle: .alert)
         
            
            self.present(alert, animated: true, completion: {
                if #available(iOS 10.0, *) {
                    Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { (timer) in
                        alert.dismiss(animated: true, completion: nil)
                        
                    })
                } else {
                    // Fallback on earlier versions
                }
                
            })
        
        
        }else{
            // correct input
            // login process should be here
            
            let spinner = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            spinner.center = self.view.center
            spinner.hidesWhenStopped = true
            spinner.activityIndicatorViewStyle = .whiteLarge
            self.view.addSubview(spinner)
            spinner.startAnimating()
            UIApplication.shared.beginIgnoringInteractionEvents()
            
            
            FIRAuth.auth()?.signIn(withEmail: email.text!, password: password.text!, completion: { (user, error) in
                
                spinner.stopAnimating()
                UIApplication.shared.endIgnoringInteractionEvents()
                
                if error != nil {
                    // incorrect email OR password
                    
                    let alert = UIAlertController(title: nil, message: "Incorrect Email or password!", preferredStyle: .alert)
                    
                    
                    self.present(alert, animated: true, completion: {
                        if #available(iOS 10.0, *) {
                            Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { (timer) in
                                alert.dismiss(animated: true, completion: nil)
                                
                            })
                        } else {
                            // Fallback on earlier versions
                        }
                        
                    })

                }else{
                    // correct login!
                    
                   currentUser = user
                    
                    self.performSegue(withIdentifier: "GoToHome", sender: self)
                }
                
            })
            
        }
        
    }
    
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
         email.resignFirstResponder()
        password.resignFirstResponder()
    }
       


}

