//
//  MasterViewController.swift
//  Shah_Wajaat-PizzaPlace_Final_Project
//
//  Created by user195769 on 4/17/21.
//

import Foundation
import UIKit

class MasterViewController: UITableViewController{
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetail"){
            let indexPath = tableView.indexPathForSelectedRow
            let selectedPizza = pizzaArr[indexPath!.row]
            let controller = segue.destination as! ViewController
            controller.ReceivingPizza = selectedPizza
        }
    }
    
    var pizzaArr = [Pizza]()
    func populateJSONData(){
        let endPoint = "https://raw.githubusercontent.com/wajaat-shah-mac-in-cloud/IT315_PizzaPLace_Final/main/pizzaPlace/pizzaPlace/obj.json"
        let endPointURL = URL(string: endPoint)
        let jsonData = try? Data(contentsOf: endPointURL!)
        print(jsonData ?? "Error. No Data to Print. EndPoint returned null.")
        if (jsonData != nil){
            let dictionary:NSDictionary = try! JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
            print(dictionary)
            
            let pizzaDictionary = dictionary["Pizza"]! as! [[String:AnyObject]]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateJSONData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pizzaArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let selectedPizza = pizzaArr[indexPath.row]
        cell.textLabel!.text = selectedPizza.name
        cell.detailTextLabel?.text = selectedPizza.size
        cell.imageView!.image = UIImage(named: selectedPizza.img)
        return cell
    }
    
    
    
}

/*
 var pizzaArr = [Pizza]()
 func populatePizzas(){
     let p1a = Pizza()
     p1a.name = "New York Style"
     p1a.size = "Small"
     p1a.price = 10.00
     p1a.img = "ny.jpeg"
     pizzaArr.append(p1a)
     
     let p1b = Pizza()
     p1b.name = "New York Style"
     
     p1b.size = "Medium"
     p1b.price = 13.00
     p1b.img = "ny.jpeg"
     pizzaArr.append(p1b)

     let p1c = Pizza()
     p1c.name = "New York Style"
     p1c.size = "Large"
     p1c.price = 15.00
     p1c.img = "ny.jpeg"
     pizzaArr.append(p1c)
     
     let p2a = Pizza()
     p2a.name = "Chicago Style"
     p2a.size = "Small"
     p2a.price = 16.00
     p2a.img = "chi.jpeg"
     pizzaArr.append(p2a)
     
     let p2b = Pizza()
     p2b.name = "Chicago Style"
     p2b.size = "Medium"
     p2b.price = 18.00
     p2b.img = "chi.jpeg"
     pizzaArr.append(p2b)

     let p2c = Pizza()
     p2c.name = "Chicago Style"
     p2c.size = "Large"
     p2c.price = 19.00
     p2c.img = "chi.jpeg"
     pizzaArr.append(p2c)
     
 }
 **/
