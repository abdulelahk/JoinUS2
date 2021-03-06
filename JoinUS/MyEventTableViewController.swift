//
//  MyEventTableViewController.swift
//  JoinUS
//
//  Created by Moath Alkhulaifi on 5/21/1438 AH.
//  Copyright © 1438 Abdulelah Almaniei. All rights reserved.
//

import UIKit
import Firebase
class MyEventTableViewController: UITableViewController {

    @IBOutlet var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.backgroundView = UIImageView(image: UIImage(named: "BG.png"))
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
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
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    var cellNumber = 1
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! cellTableViewCell
        
        cell.EventImage.layer.borderWidth = 1
        cell.EventImage.layer.masksToBounds = false
        cell.EventImage.layer.borderColor = UIColor.black.cgColor
        cell.EventImage.layer.cornerRadius = cell.EventImage.frame.height/4
        cell.EventImage.clipsToBounds = true
        cell.EventImage.contentMode = .scaleToFill
        cell.EventImage.image = UIImage(named:"EX.png")
        
        cell.EventName.text = "Event \(cellNumber)"
        cell.Des.text = "this is short Description of this Events .. but how we will chose it?"
        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
        cellNumber += 1
        //cell.label.text = "this is cell Number : \(cellNumber)"

        // Configure the cell...

        return cell
    }
 

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
