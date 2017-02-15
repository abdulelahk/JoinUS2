//
//  FirstViewController.swift
//  TappedApp
//
//  Created by Abdulelah Almaniei on 2/14/17.
//  Copyright © 2017 Abdulelah Almaniei. All rights reserved.
//

import UIKit
import Firebase
class MyProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func Logout(_ sender: Any) {
        
        let firebaseAuth = FIRAuth.auth()
        let spinner = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        spinner.center = self.view.center
        spinner.hidesWhenStopped = true
        spinner.activityIndicatorViewStyle = .whiteLarge
        self.view.addSubview(spinner)
        spinner.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()

        
        do {
            
            
            try firebaseAuth?.signOut()
            
            spinner.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            
            self.performSegue(withIdentifier: "GoToLogin", sender: self)
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
            
            spinner.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            
            let alert = UIAlertController(title: nil, message: "Error while logging out! Try Again!", preferredStyle: .alert)
            
            
            self.present(alert, animated: true, completion: {
                if #available(iOS 10.0, *) {
                    Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { (timer) in
                        alert.dismiss(animated: true, completion: nil)
                        
                    })
                } else {
                    // Fallback on earlier versions
                }
                
            })
        }

        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

