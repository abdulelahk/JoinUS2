//
//  MyProfileTableViewController.swift
//  Pods
//
//  Created by Moath Alkhulaifi on 5/21/1438 AH.
//
//

import UIKit
import Firebase

class MyProfileTableViewController: UITableViewController {
    
    
    //image
    @IBOutlet var profileImg: UIImageView!
    var popupImageView = UIImageView()
    var ispopUpShowing = false
    //!image

    @IBOutlet var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.backgroundView = UIImageView(image: UIImage(named: "BG.png"))
        //image
        self.navigationController?.navigationItem.title = NSLocalizedString("PAC-fk-MtE", comment: "Class = \"UINavigationItem\"; title = \"Home\"; ObjectID = \"PAC-fk-MtE\";")
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
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    @IBAction func Logout(_ sender: Any) {
        
        
        let logoutAlert = UIAlertController(title: "Logout", message: "Are you sure you want to logout?", preferredStyle: .alert)
        
        let logoutAction = UIAlertAction(title: "Yes", style: .destructive) { (action) in
            
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
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        logoutAlert.addAction(logoutAction)
        logoutAlert.addAction(cancelAction)
        
        self.present(logoutAlert, animated: false, completion: nil)
        
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
    //!image
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
