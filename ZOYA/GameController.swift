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
    
    //1 = buz'd (green)
    //2 = WHO (purple)
    //3 = misc (blue)
    //4 = ToD (red)
    
    var deck = [[String]]()
    
    let colors = [[UIColor.init(displayP3Red: 0.15, green: 0.35, blue: 0.15, alpha: 1), UIColor.init(displayP3Red: 0.85, green: 1, blue: 0.85, alpha: 1)], [UIColor.init(displayP3Red: 0.35, green: 0.15, blue: 0.35, alpha: 1), UIColor.init(displayP3Red: 1, green: 0.85, blue: 1, alpha: 1)], [UIColor.init(displayP3Red: 0.15, green: 0.15, blue: 0.35, alpha: 1), UIColor.init(displayP3Red: 0.85, green: 0.85, blue: 1, alpha: 1)], [UIColor.init(displayP3Red: 0.35, green: 0.15, blue: 0.15, alpha: 1), UIColor.init(displayP3Red: 1, green: 0.85, blue: 0.85, alpha: 1)], [UIColor.black, UIColor.white]]
    
    let labels = ["BUZ'D", "WHO", "misc", "ToD", ""]
    
    var currentcard = ["5", "Welcome!"]

    @IBOutlet weak var category: UILabel!
    
    @IBOutlet weak var card: UILabel!
    
    func makeDeck(fname: String){
        let fileURLProject = Bundle.main.path(forResource: fname, ofType: "txt")
               var readStringProject = ""
               do {
                   readStringProject = try String(contentsOfFile: fileURLProject!, encoding:String.Encoding.utf8)
               } catch let error as NSError {
                   //print("Failed to read file")
                   //print(error)
               }
               let lines = readStringProject.components(separatedBy: "\n")
               var attribute = [[String]]()
               for item in lines {
                   //print(item.components(separatedBy: ":"))
                   attribute.append(item.components(separatedBy: ":"))
               }
               attribute.remove(at: attribute.count-1)
               deck += attribute
               
    }
    
    /*
     func paranoiaDeck(Deck: [[String]]) -> [String] {
        var subDeck = [[String]] ()
        for card in Deck{
        if card[0] == labels[1]{
            subDeck.append(contentOf: [card])
            }
        print(subDeck)
        return subDeck
     }
     */
    
    override func viewDidLoad() {
        //print(truthtable)
        
        super.viewDidLoad()
        makeDeck(fname: "deck")
        for i in 1...truthtable.count {
            let ex = truthtable[i-1]
            if ex {
                makeDeck(fname: String(i))
            }
        }
        let index = Int.random(in: 0...(deck.count-1))
        currentcard = deck[index]
        deck.remove(at: index)
        card.text = currentcard[1]
        let kind = (Int(currentcard[0]) ?? 4) - 1
        //print(kind)
        self.view.backgroundColor = colors[kind][0]
        category.textColor = colors[kind][1]
        category.text = labels[kind]
        card.textColor = colors[kind][1]
        if currentcard.count == 3 {
                   if currentcard[2] == "paranoia"{
                       //run paranoia Deck function
                        print("Use who Deck")
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
        //print(kind)
        self.view.backgroundColor = colors[kind][0]
        category.textColor = colors[kind][1]
        category.text = labels[kind]
        card.textColor = colors[kind][1]
        
        if currentcard.count == 3 {
            if currentcard[2] == " paranoia"{
                print("Use who Deck")
                //run paranoia Deck function
            }
        }
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
