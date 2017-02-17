//
//  FirstViewController.swift
//  TappedApp
//
//  Created by Abdulelah Almaniei on 2/14/17.
//  Copyright © 2017 Abdulelah Almaniei. All rights reserved.
//

import UIKit
import Firebase
class MyEventsViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.backgroundView = UIImageView(image: UIImage(named: "BG.png"))
        let ref = FIRDatabase.database().reference()
        /*
        newEvent.setValue("Abdulelah")
        newEvent.child("name").setValue("football")
        newEvent.child("location").setValue("45.555346,25.5537753")
        newEvent.child("category").setValue("sport")
 */
        
        /*
       var event = ref.child("events").childByAutoId()
        
        event.setValue(["name":"iOS","location":"338843","category":"programming"])
 */
         /*
        event.child("name").setValue("YourEvent")
        event.child("location").setValue("45.555346,25.5537753")
        event.child("category").setValue("programming")
        
        */
        
        
        ref.child("events").queryOrdered(byChild: "category").queryEqual(toValue: "programming").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            print(value)
        })
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

