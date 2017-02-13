//
//  ToDoTableViewController.swift
//  To Do List
//
//  Created by Dom Ronan on 2/11/17.
//  Copyright © 2017 Dom Ronan. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var toDoArray = ["Learn Swift",
                     "Build Apps",
                     "Change the World!"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return toDoArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = toDoArray[indexPath.row]
        
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
        if segue.identifier == "ShowDetail" {
            let indexPath = tableView.indexPathForSelectedRow!
            let destinationViewController = segue.destination as!
            DetailViewController
            let selectToDo = toDoArray[indexPath.row]
            destinationViewController.toDoItem = selectToDo
        }
    
    
    }
 
    
    @IBAction func unwindToTableViewController(sender: UIStoryboardSegue) {
        //check if the method / func is being called by the DetailViewController, check if we can get data out of the Detail View Controller's toDoItem String?
        if let sourceViewController = sender.source as? DetailViewController,
            let toDoItem = sourceViewController.toDoItem {
            
            if let selectIndexPath = tableView.indexPathForSelectedRow {
                toDoArray[selectIndexPath.row] = toDoItem
                tableView.reloadRows(at: [selectIndexPath], with: .none)
            } else { // get the table location where we're going to insert the new toDoItem
                toDoArray.append(toDoItem)
                let newIndexPath = IndexPath(row: toDoArray.count - 1, section: 0)
                
                // add the toDoItem String grabbed from DetailViewController to the end of the toDoArray
                
                // Add the toDoItem to the table
                tableView.insertRows(at: [newIndexPath], with: .bottom)
        }
    }
    }


}
