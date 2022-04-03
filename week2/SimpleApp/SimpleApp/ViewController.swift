//
//  ViewController.swift
//  SimpleApp
//
//  Created by 黃昱崴 on 2022/4/4.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var middleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func showAnotherFunFact(){
        changeBackgroundColor()
        changeMiddleText()
    }
    
    func changeBackgroundColor() {
        let color = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.blue, UIColor.purple, UIColor.systemIndigo]
        self.view.backgroundColor = color.randomElement()
    }
    
    func changeMiddleText() {
        let text = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tempus.",
        "Contrary to popular belief, Lorem Ipsum is not simply random text.",
        "Richard McClintock, a Latin professor at Hampden-Sydney College in ",
        "looked up one of the more obscure Latin words, consectetur",
        "from a Lorem Ipsum passage, and going through the cities of the word",
        "This book is a treatise on the theory of ethics, very popular during the.",
        "The first line of Lorem Ipsum, Lorem ipsum dolor sit amet..",
        ]
        middleLabel.text = text.randomElement()
    }
    
}

