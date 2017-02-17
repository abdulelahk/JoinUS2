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
    var ispopUpShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.title = NSLocalizedString("PAC-fk-MtE", comment: "Class = \"UINavigationItem\"; title = \"Home\"; ObjectID = \"PAC-fk-MtE\";")
        leadingConstraint.constant = -140
        let profileImageGesture = UITapGestureRecognizer(target: self, action: Selector("showProfileImage"))
        profileImg.addGestureRecognizer(profileImageGesture)
        profileImg.layer.borderWidth = 1
        profileImg.layer.masksToBounds = false
        profileImg.layer.borderColor = UIColor.black.cgColor
        profileImg.layer.cornerRadius = profileImg.frame.height/2
        profileImg.clipsToBounds = true
        profileImg.image = UIImage(named: "File_000.jpeg")
        popupImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.height * 0.35, height: UIScreen.main.bounds.height * 0.35))
        popupImageView.image = profileImg.image
        popupImageView.frame.origin = profileImg.frame.origin
        popupImageView.isHidden = true
        popupImageView.contentMode = .scaleToFill
        popupImageView.layer.masksToBounds = false
        popupImageView.isUserInteractionEnabled = true
        popupImageView.layer.borderWidth = 2
        popupImageView.layer.borderColor = UIColor.black.cgColor
        popupImageView.layer.cornerRadius = popupImageView.frame.height/2
        popupImageView.clipsToBounds = true
        self.view.addSubview(popupImageView)

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //        self.popupImageView.center = self.view.center

    func showProfileImage(){
        if !ispopUpShowing{
            UIView.animate(withDuration: 0.3, animations: {
                self.popupImageView.center = self.view.center
            })
            popupImageView.isHidden = false
            ispopUpShowing = !ispopUpShowing
        }
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("Screen Touched!")

        if (touches.first!).view == popupImageView{
            
            self.popupImageView.center = self.profileImg.center
            popupImageView.isHidden = true
            ispopUpShowing = !ispopUpShowing
        }
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

