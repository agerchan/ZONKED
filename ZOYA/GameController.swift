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
    //keeping track of which options correspond to which filenames
    var clean = false
    var waspaused = false
    //to keep track if the game just began or if returning from the help page
    var paranoiaMode = false
    
    var deck = [[String]]()
    var paranoiaDeck = [[String]]()
    //initializing decks
    
    let colors = [[UIColor.init(displayP3Red: 1, green: 0.84, blue: 0.04, alpha: 1), UIColor.white, "PinkNext", "PinkExit"],
                  
                  [UIColor.init(displayP3Red: 0.51, green: 0.22, blue: 0.93, alpha: 1), UIColor.white, "BlueNext", "BlueExit"],
                  
                  [UIColor.init(displayP3Red: 0.23, green: 0.53, blue: 1, alpha: 1), UIColor.white, "OrangeNext", "OrangeExit"],
                  
                  [UIColor.init(displayP3Red: 1, green: 0, blue: 0.43, alpha: 1), UIColor.white, "YellowNext", "YellowExit"],
                  
                  [ UIColor.init(displayP3Red: 0.98, green: 0.34, blue: 0.03, alpha: 1), UIColor.white, "PurpleNext", "PurpleExit"]]
    
    let labels = ["BUZ'D", "WHO", "MISC", "ToD", "paranoia"]
    
    //IMAGES FOR BUTTON SWITCH
    //let image = UIImage(named: "paranoiaButton")! as UIImage
    //let image2 = UIImage(named: "nextCardButton")! as UIImage
    
    //1 = buz'd (green)
    //2 = WHO (purple)
    //3 = misc (blue)
    //4 = ToD (red)
    //5 = paranoia
    //colors might be changed
    
    var currentcard = ["5", "Welcome!"]

    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var nextcardbutton: UIButton!
    @IBOutlet weak var card: UILabel!
    @IBOutlet weak var exitbutton: UIButton!
    @IBOutlet weak var backbutton: UIButton!
    
    //takes a filename, returns an array of cards
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
        return attribute
    }
    
    //takes a card, and adjusts the interface accordingly
    func generateCard(newcard: [String]){
        card.text = newcard[1]
        let kind = (Int(newcard[0]) ?? 4) - 1
        let image = UIImage(named: colors[kind][2] as! String )! as UIImage
        let image2 = UIImage(named: colors[kind][3] as! String )! as UIImage
        self.view.backgroundColor = colors[kind][0] as? UIColor
        category.textColor = colors[kind][1] as? UIColor
        category.text = labels[kind]
        card.textColor = colors[kind][1] as? UIColor
        nextcardbutton.setImage(image, for: .normal)
        exitbutton.setImage(image2, for: .normal)
    
        //colors[kind][2]
        
        //if the current card is the paranoia card
        if newcard.count == 3 {
            if newcard[2] == " paranoia"{
                let image = UIImage(named: "OrangeNextP" )! as UIImage
                nextcardbutton.setImage(image, for: .normal)
                //nextcardbutton.setImage("paranoiaButton": UIImage?, for: .normal)
                //nextcardbutton.setTitle("begin paranoia", for: .normal)
                paranoiaMode = true
            }
        }
        //if we already are in paranoia mode
        else if paranoiaMode {
            backbutton.isEnabled = true
            backbutton.isHidden = false
        }
    }
    
    //gets a new card, based on what the mode is (used in viewDidLoad and nextcardpressed)
    func pickNewCard(){
        if paranoiaMode == true {
            let index = Int.random(in: 0...(paranoiaDeck.count-1))
            currentcard = paranoiaDeck[index]
            paranoiaDeck.remove(at: index)
            //making sure you can leave paranoia mode
            
            
            //nextcardbutton.setImage(image2, for: .normal)
            
            
            //nextcardbutton.setTitle("next card", for: .normal)
            if paranoiaDeck.count == 0 {
                paranoiaMode = false
            }
        }
        //if there are no cards left, go to game over screen
        else if deck.count == 0 {
            performSegue(withIdentifier: "GameOver", sender: self)
        }
        //else, choose a card out of the regular deck
        else {
            let index = Int.random(in: 0...(deck.count-1))
            currentcard = deck[index]
            deck.remove(at: index)
            //if we ran out of paranoia cards and returned without pressing back
            if paranoiaDeck.count == 0 {
                backbutton.isEnabled = false
                backbutton.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        backbutton.isHidden = true
        super.viewDidLoad()

        //if the game is beginning, compile decks and select a currentcard
        if waspaused == false {
            //generating the decks
            deck += makeDeck(fname: "deck")
            paranoiaDeck += makeDeck(fname: "paranoia")
            //adding extension packs
            for i in 1...truthtable.count {
                let ex = truthtable[i-1]
                if ex { deck += makeDeck(fname: labletable[i-1]) }
            }
            //cleaning the deck
            if clean {
                var i = 0
                while i < deck.count {
                    if deck[i].count == 3 && deck[i][2] == " x" { deck.remove(at: i) }
                    else { i += 1 }
                }
                var j = 0
                while j < paranoiaDeck.count {
                    if paranoiaDeck[j].count == 3 && paranoiaDeck[j][2] == " x" { paranoiaDeck.remove(at: j) }
                    else { j += 1 }
                }
            }
            pickNewCard()
        }
        generateCard(newcard: currentcard)
        waspaused = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is HelpController {
            //saving information if we are go to help
            let help = segue.destination as! HelpController
            help.previouspage = "game"
            help.truthtable = truthtable
            help.paranoiaMode = paranoiaMode
            help.deck = deck
            help.paranoiaDeck = paranoiaDeck
            help.currentcard = currentcard
            help.exitbutton = exitbutton
            help.backbutton = backbutton
            help.nextcardbutton = nextcardbutton
        }
    }
    
    @IBAction func exitpressed(_ sender: Any) {
        performSegue(withIdentifier: "backward", sender: self)
    }
    //leaving paranoiamode
    @IBAction func backpressed(_ sender: Any) {
        paranoiaMode = false
        if deck.count == 0 {
            performSegue(withIdentifier: "GameOver", sender: self)
        }
        else {
            let index = Int.random(in: 0...(deck.count-1))
            currentcard = deck[index]
            deck.remove(at: index)
            generateCard(newcard: currentcard)
            backbutton.isEnabled = false
            backbutton.isHidden = true
        }

    }
    @IBAction func helppressed(_ sender: Any) {
        performSegue(withIdentifier: "gametohelp", sender: self)
    }
    
    @IBAction func nextcardpressed(_ sender: Any) {
        pickNewCard()
        generateCard(newcard: currentcard)

    }
   
}
