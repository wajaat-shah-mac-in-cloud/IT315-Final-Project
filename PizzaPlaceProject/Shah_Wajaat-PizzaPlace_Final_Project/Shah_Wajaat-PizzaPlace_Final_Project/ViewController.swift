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
        pizzaImage.image = UIImage(named: ReceivingPizza.img)
    }

    var ReceivingPizza:Pizza = Pizza()
}

