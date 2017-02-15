//
//  FirstViewController.swift
//  TappedApp
//
//  Created by Abdulelah Almaniei on 2/14/17.
//  Copyright © 2017 Abdulelah Almaniei. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    /*
 TableView frame for SE screen:
 
 Width: 320
 Height:458
 X:0
 Y:61
 
 */
    
    @IBOutlet var MenuBtn: UIBarButtonItem!
    
   
    @IBOutlet var leadingConstraint: NSLayoutConstraint!
    
    @IBOutlet var profileImg: UIImageView!
    
    var popupImageView = UIImageView()
    
    var isMenuShowing = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leadingConstraint.constant = -140
        let profileImageGesture = UITapGestureRecognizer(target: self, action: Selector("showProfileImage"))
        profileImg.addGestureRecognizer(profileImageGesture)
        profileImg.layer.borderWidth = 1
        profileImg.layer.masksToBounds = false
        profileImg.layer.borderColor = UIColor.black.cgColor
        profileImg.layer.cornerRadius = profileImg.frame.height/2
        profileImg.clipsToBounds = true
        profileImg.image = UIImage(named: "File_000.jpeg")

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func showProfileImage(){
        
        popupImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.height * 0.35, height: UIScreen.main.bounds.height * 0.35))
        popupImageView.center = self.view.center
        popupImageView.image = profileImg.image
        popupImageView.contentMode = .scaleToFill
        popupImageView.layer.masksToBounds = false
        popupImageView.isUserInteractionEnabled = true
        popupImageView.layer.borderWidth = 2
        popupImageView.layer.borderColor = UIColor.black.cgColor
        popupImageView.layer.cornerRadius = popupImageView.frame.height/2
        popupImageView.clipsToBounds = true
        self.view.addSubview(popupImageView)

        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.popupImageView.removeFromSuperview()

    }
    
    
    @IBAction func sideMenuTrigger(_ sender: Any) {
        
        if isMenuShowing {
            leadingConstraint.constant = -140
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }else{
            leadingConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        
        isMenuShowing = !isMenuShowing

    }
   
   
    
   
    
    
    
}

