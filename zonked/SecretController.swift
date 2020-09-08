//
//  SecretController.swift
//  ZOYA
//
//  Created by Anna Gerchanovsky on 7/5/20.
//  Copyright © 2020 GAAG. All rights reserved.
//

import UIKit

class SecretController: UIViewController {

    @IBOutlet weak var textbox: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        textbox.text = "Gabriella Ardiles and Anna Gerchanovsky would like to thank our friends for helping us create this game. " +
            "Thank you Myles Winston, Brooke Gunter, Izzy Gloria, Neil Brydon for giving your input and opinions! " +
        "Special thanks to Izzy Gloria, for inpsiring the game, transcribing the cards, and promising to get the bug tattooed on her <3. " +
        "Sorry Cal McCullough and Alice Zilberberg that you cannot get this game on your phone :( " +
        "Sending love to everybody mentioned as well as Luke Arney, Jason Ledon, Rowan Dunlop, Max Robbins, Benjamin Stern, Garret Irwin, Palak Jain, and our wonderful housemate Gavin :)."

        // Do any additional setup after loading the view.
    }
    
    @IBAction func bonuspressed(_ sender: Any) {
        textbox.text = "Hi Gaby!\nThis is an extra special thank you from me. " +
        "Thank you for oranizing this project and giving me something to do this summer! " +
        "I had so much fun doing this and there's nobody I'd rather work on a project with! " +
        "Thank you for being here all summer cutie ;)"
    }
    

}
