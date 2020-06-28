//
//  HelpController.swift
//  ZOYA
//
//  Created by Anna Gerchanovsky on 6/27/20.
//  Copyright © 2020 GAAG. All rights reserved.
//

import UIKit

class HelpController: UIViewController {
    
    var previouspage = "start"
    
    //which variables we may have to take from game
    var truthtable = [false]
    var paranoiaMode = false
    var deck = [[String]]()
    var paranoiaDeck = [[String]]()
    var currentcard = ["1", "no"]
    var exitbutton: UIButton!
    var backbutton: UIButton!
    var nextcardbutton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let game = segue.destination as! GameController
        //game.truthtable = truthtable
        if segue.destination is GameController {
            let game = segue.destination as! GameController
            //game.previouspage = "start"
            game.truthtable = truthtable
            game.paranoiaMode = paranoiaMode
            game.deck = deck
            game.paranoiaDeck = paranoiaDeck
            game.waspaused = true
            game.currentcard = currentcard
            game.exitbutton = exitbutton
            game.backbutton = backbutton
            game.nextcardbutton = nextcardbutton
        }
    }
    
    @IBAction func backpressed(_ sender: Any) {
        if previouspage == "start" {
            performSegue(withIdentifier: "helptostart", sender: self)
        }
        else if previouspage == "game" {
            performSegue(withIdentifier: "helptogame", sender: self)
        }
        else {
            performSegue(withIdentifier: "helptoextension", sender: self)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
