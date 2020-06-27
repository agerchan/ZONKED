//
//  GameController.swift
//  ZOYA
//
//  Created by Anna Gerchanovsky on 6/26/20.
//  Copyright © 2020 GAAG. All rights reserved.
//

import UIKit

class GameController: UIViewController {
    
    var truthtable = [false]
    var labletable = ["college", "us", "corona"]
    
    var paranoiaMode = false
    
    //college, us, corona
    
    //1 = buz'd (green)
    //2 = WHO (purple)
    //3 = misc (blue)
    //4 = ToD (red)
    
    var deck = [[String]]()
    var paranoiaDeck = [[String]]()
    
    let colors = [[UIColor.init(displayP3Red: 0.15, green: 0.35, blue: 0.15, alpha: 1), UIColor.init(displayP3Red: 0.85, green: 1, blue: 0.85, alpha: 1)], [UIColor.init(displayP3Red: 0.35, green: 0.15, blue: 0.35, alpha: 1), UIColor.init(displayP3Red: 1, green: 0.85, blue: 1, alpha: 1)], [UIColor.init(displayP3Red: 0.15, green: 0.15, blue: 0.35, alpha: 1), UIColor.init(displayP3Red: 0.85, green: 0.85, blue: 1, alpha: 1)], [UIColor.init(displayP3Red: 0.35, green: 0.15, blue: 0.15, alpha: 1), UIColor.init(displayP3Red: 1, green: 0.85, blue: 0.85, alpha: 1)], [UIColor.black, UIColor.white]]
    
    let labels = ["BUZ'D", "WHO", "misc", "ToD", "paranoia"]
    
    var currentcard = ["5", "Welcome!"]

    @IBOutlet weak var category: UILabel!
    
    @IBOutlet weak var card: UILabel!
    
    func makeDeck(fname: String) -> Array<Array<String>> {
        
        let fileURLProject = Bundle.main.path(forResource: fname, ofType: "txt")
               var readStringProject = ""
               do {
                   readStringProject = try String(contentsOfFile: fileURLProject!, encoding:String.Encoding.utf8)
               } catch let error as NSError {
                   print("Failed to read file")
                   print(error)
               }
               let lines = readStringProject.components(separatedBy: "\n")
               var attribute = [[String]]()
               for item in lines {
                   //print(item.components(separatedBy: ":"))
                   attribute.append(item.components(separatedBy: ":"))
               }
               attribute.remove(at: attribute.count-1)
                //
        return attribute
    }
    
    func generateCard(newcard: [String]){
        card.text = newcard[1]
        let kind = (Int(newcard[0]) ?? 4) - 1
        //print(kind)
        self.view.backgroundColor = colors[kind][0]
        category.textColor = colors[kind][1]
        category.text = labels[kind]
        card.textColor = colors[kind][1]
    }
    
    //PRE LOADED ON SCREEN
    override func viewDidLoad() {
        //print(truthtable)
        super.viewDidLoad()
        deck += makeDeck(fname: "deck")
        paranoiaDeck += makeDeck(fname: "paranoia")
        for i in 1...truthtable.count {
            let ex = truthtable[i-1]
            if ex {
                deck += makeDeck(fname: labletable[i-1])
            }
        }
        
        //Place First Card
        let index = Int.random(in: 0...(deck.count-1))
        currentcard = deck[index]
        deck.remove(at: index)
        generateCard(newcard: currentcard)
        if currentcard.count == 3 {
            if currentcard[2] == "paranoia"{
                paranoiaMode = true
                   }
               }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //nothing yet
    }
    
    @IBAction func exitpressed(_ sender: Any) {
        performSegue(withIdentifier: "backward", sender: self)
    }
    
    @IBAction func nextcardpressed(_ sender: Any) {
        if paranoiaMode == true {
            let index = Int.random(in: 0...(paranoiaDeck.count-1))
            currentcard = paranoiaDeck[index]
            paranoiaDeck.remove(at: index)
            if paranoiaDeck.count == 0 {
                paranoiaMode = false
            }
        }
        else if deck.count == 0 {
            currentcard = ["5", "GAME OVER"]
        }
        else {
            let index = Int.random(in: 0...(deck.count-1))
            currentcard = deck[index]
            deck.remove(at: index)
        }
        generateCard(newcard: currentcard)
        if currentcard.count == 3 {
            if currentcard[2] == " paranoia"{
                paranoiaMode = true
            }
            
        }
    }
   
}
