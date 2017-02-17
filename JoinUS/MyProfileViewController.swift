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
    
    
    //image
    @IBOutlet var profileImg: UIImageView!
    var popupImageView = UIImageView()
    var ispopUpShowing = false
    //!image

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //image
            self.navigationController?.navigationItem.title = NSLocalizedString("PAC-fk-MtE", comment: "Class = \"UINavigationItem\"; title = \"Home\"; ObjectID = \"PAC-fk-MtE\";")
            let profileImageGesture = UITapGestureRecognizer(target: self, action: #selector(MyProfileViewController.showProfileImage))
            profileImg.addGestureRecognizer(profileImageGesture)
            profileImg.layer.borderWidth = 1
            profileImg.layer.masksToBounds = false
            profileImg.layer.borderColor = UIColor.black.cgColor
            profileImg.layer.cornerRadius = profileImg.frame.height/2
            profileImg.clipsToBounds = true
            profileImg.image = UIImage(named: "File_000.jpeg")
            popupImageView = UIImageView(frame: CGRect(x: 0, y: -500, width: UIScreen.main.bounds.height * 0.35, height: UIScreen.main.bounds.height * 0.35))
            popupImageView.image = profileImg.image
            popupImageView.contentMode = .scaleToFill
            popupImageView.layer.masksToBounds = false
            popupImageView.isUserInteractionEnabled = true
            popupImageView.layer.borderWidth = 2
            popupImageView.layer.borderColor = UIColor.black.cgColor
            popupImageView.layer.cornerRadius = popupImageView.frame.height/2
            popupImageView.clipsToBounds = true
            self.view.addSubview(popupImageView)
            //!image
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
    
    func showProfileImage(){
        if !ispopUpShowing{
            UIView.animate(withDuration: 0.3, animations: {
                self.popupImageView.center = self.view.center
            })
            ispopUpShowing = !ispopUpShowing
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("Screen Touched!")
        
        if (touches.first!).view == popupImageView{
            
            UIView.animate(withDuration: 0.3, animations: {
                self.popupImageView.frame.origin = CGPoint(x: 0, y: -500)
            })
            
            ispopUpShowing = !ispopUpShowing
        }
    }
    
    
    
}

