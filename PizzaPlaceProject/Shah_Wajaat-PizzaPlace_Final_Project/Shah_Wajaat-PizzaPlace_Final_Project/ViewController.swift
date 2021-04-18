//
//  ViewController.swift
//  Shah_Wajaat-PizzaPlace_Final_Project
//
//  Created by user195769 on 4/17/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pizzaName: UILabel!
    @IBOutlet weak var pizzaImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pizzaName.text = ReceivingPizza.name
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

