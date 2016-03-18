//
//  TableViewController.swift
//  CNContactPickerDelegate
//
//  Created by Igor Cova on 12/03/16.
//  Copyright © 2016 Andrew Dzhur. All rights reserved.
//

import UIKit
import Contacts

class CustomContactsTableView: UITableViewController {
    
    var contactsByAlphabet = [ContactsByAlphabet]()
    //var marrContacts = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //requestForAllContacts()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        contactsByAlphabet = AlphabetLine().contactsByAlphabetDrawing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return contactsByAlphabet.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contactsByAlphabet[section].contacts.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let contact = contactsByAlphabet[indexPath.section].contacts[indexPath.row]
        
        
        for number in AlphabetLine().exceptionNumber {
            for lableOfNumber in contact.phoneNumbers {
                if number == AlphabetLine().stringNumber((lableOfNumber.value as! CNPhoneNumber).stringValue) {
                    let originalСell = tableView.dequeueReusableCellWithIdentifier("original")! as! OriginalCell
                    var decodedimage: UIImage?
                    var phoneNumber: String?
                    
                    if let image = contact.imageData {
                        decodedimage = UIImage(data: image)
                    }
                
                    for numberLables in contact.phoneNumbers {
                        if numberLables.label == CNLabelPhoneNumberiPhone {
                            phoneNumber = (numberLables.value as! CNPhoneNumber).stringValue
                            break
                        }
                    }
                
                    originalСell.setOriginalCell("\(contact.givenName) \(contact.familyName)", image: decodedimage, detail: phoneNumber ?? "")
                    return originalСell
                }
            }
        }
        let cell = tableView.dequeueReusableCellWithIdentifier("contact")!
        cell.textLabel?.text = ("\(contact.givenName) \(contact.familyName)")
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
            
        } else {
            return 20
        }
        
    }
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return contactsByAlphabet[section].letter
    }
/*
    func requestForAllContacts() {
        let keysToFetch = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey, CNContactUrlAddressesKey, CNContactImageDataKey]
        
        let store = CNContactStore()
        
        do {
            let request = CNContactFetchRequest(keysToFetch: keysToFetch)
            try store.enumerateContactsWithFetchRequest(request) {
                 contact, _ in
                self.marrContacts.addObject(contact)
            }

            tableView.reloadData()
        }
        catch{
            print("Can't Search Contact Data")
        }

    }
*/

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
