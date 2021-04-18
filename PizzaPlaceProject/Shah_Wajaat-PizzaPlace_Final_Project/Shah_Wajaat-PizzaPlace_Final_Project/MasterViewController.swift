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
        let endPoint = "https://raw.githubusercontent.com/wajaat-shah-mac-in-cloud/IT315-Final-Project/master/objects.json"
        let endPointURL = URL(string: endPoint)
        let jsonData = try? Data(contentsOf: endPointURL!)
        print(jsonData ?? "Error. No Data to Print. EndPoint returned null.")
        if (jsonData != nil){
            let dictionary:NSDictionary = try! JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
            print(dictionary)
            
            let pizzaDictionary = dictionary["Pizza"]! as! [[String:AnyObject]]
            for index in 0...pizzaDictionary.count - 1 {
                let eachPizza = pizzaDictionary[index]
                let pizza = Pizza()
                pizza.name = eachPizza["name"] as! String
                pizza.size = eachPizza["size"] as! String
                pizza.price = eachPizza["price"] as! String
                pizza.img = eachPizza["img"] as! String
                pizzaArr.append(pizza)
            }
        }
    }
    
    func convertStringToImage(imageName:String) -> UIImage{
        let imageURL = URL(string: imageName)
        let imageData = try? Data(contentsOf: imageURL!)
        print(imageData ?? "Error. Failed to retrieve Image Data")
        let img = UIImage(data: imageData!)
        return img!
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
        let imageName = selectedPizza.img
        cell.imageView!.image = convertStringToImage(imageName: imageName)
        return cell
    }
    
    
}
