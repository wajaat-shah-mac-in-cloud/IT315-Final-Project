//
//  ViewController.swift
//  Shah_Wajaat-PizzaPlace_Final_Project
//
//  Created by user195769 on 4/17/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pizzaName: UILabel!
    @IBOutlet weak var pizzaPrice: UILabel!
    @IBOutlet weak var pizzaImage: UIImageView!
    @IBOutlet weak var pizzaSize: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        pizzaName.text = ReceivingPizza.name
        pizzaPrice.text = ReceivingPizza.price
        pizzaSize.text = ReceivingPizza.size
        pizzaImage.image = convertStringToImage(imageName: ReceivingPizza.img)
    }

    var ReceivingPizza:Pizza = Pizza()
    
    
    func convertStringToImage(imageName:String) -> UIImage{
        let imageURL = URL(string: imageName)
        let imageData = try? Data(contentsOf: imageURL!)
        print(imageData ?? "Error. Failed to retrieve Image Data")
        let img = UIImage(data: imageData!)
        return img!
    }
}

