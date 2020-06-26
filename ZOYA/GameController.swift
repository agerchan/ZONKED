//
//  GameController.swift
//  ZOYA
//
//  Created by Anna Gerchanovsky on 6/26/20.
//  Copyright © 2020 GAAG. All rights reserved.
//

import UIKit

class GameController: UIViewController {
    
    //1 = buz'd (green)
    //2 = WHO (purple)
    //3 = misc (blue)
    //4 = ToD (red)
    var deck = [["1", "if you're wearing jeans"],
                ["1", "if you have an allergy"],
                ["2", "who will get married last"],
                ["2", "who is least athletic"],
                ["3", "play a round of spin the bottle"],
                ["3", "give out a compliment and an insult"],
                ["4", "tell the story of how you lost your virginity"],
                ["4", "who is the least attractive"]]
    
    let colors = [[UIColor.init(displayP3Red: 0.25, green: 0.75, blue: 0.25, alpha: 1), UIColor.init(displayP3Red: 0.5, green: 1, blue: 0.5, alpha: 1)], [UIColor.init(displayP3Red: 0.75, green: 0.25, blue: 0.75, alpha: 1), UIColor.init(displayP3Red: 1, green: 0.5, blue: 1, alpha: 1)], [UIColor.init(displayP3Red: 0.25, green: 0.25, blue: 0.75, alpha: 1), UIColor.init(displayP3Red: 0.5, green: 0.5, blue: 1, alpha: 1)], [UIColor.init(displayP3Red: 0.75, green: 0.25, blue: 0.25, alpha: 1), UIColor.init(displayP3Red: 1, green: 0.5, blue: 0.5, alpha: 1)], [UIColor.black, UIColor.white]]
    
    let labels = ["BUZ'D", "WHO", "misc", "ToD", ""]
    
    var currentcard = ["5", "Welcome!"]

    @IBOutlet weak var category: UILabel!
    
    @IBOutlet weak var card: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        card.text = currentcard[1]
        let kind = (Int(currentcard[0]) ?? 4) - 1
        print(kind)
        self.view.backgroundColor = colors[kind][0]
        category.textColor = colors[kind][1]
        category.text = labels[kind]
        card.textColor = colors[kind][1]

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //nothing yet
    }
    
    @IBAction func exitpressed(_ sender: Any) {
        performSegue(withIdentifier: "backward", sender: self)
    }
    
    @IBAction func nextcardpressed(_ sender: Any) {
        if deck.count == 0 {
            currentcard = ["5", "GAME OVER"]
        }
        else {
            let index = Int.random(in: 0...(deck.count-1))
            currentcard = deck[index]
            deck.remove(at: index)
        }
        card.text = currentcard[1]
        let kind = (Int(currentcard[0]) ?? 4) - 1
        print(kind)
        self.view.backgroundColor = colors[kind][0]
        category.textColor = colors[kind][1]
        category.text = labels[kind]
        card.textColor = colors[kind][1]
        //
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
