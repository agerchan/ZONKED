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
    var labletable = ["college", "brutal", "internet", "us"]
    //keeping track of which options correspond to which filenames
    var filth = 1
    //var clean = false
    var irl = true
    var waspaused = false
    //to keep track if the game just began or if returning from the help page
    var paranoiaMode = false
    var whosleft = 0
    var flipped = false
    
    var deck = [[String]]()
    
    let colors = [[UIColor.init(displayP3Red: 1, green: 0.84, blue: 0.04, alpha: 1), UIColor.white, "PinkNextButton", "PinkExitButton"],
                  
                  [UIColor.init(displayP3Red: 0.51, green: 0.22, blue: 0.93, alpha: 1), UIColor.white, "BlueNextButton", "BlueExitButton"],
                  
                  [UIColor.init(displayP3Red: 0.23, green: 0.53, blue: 1, alpha: 1), UIColor.white, "OrangeNextButton", "OrangeExitButton"],
                  
                  [UIColor.init(displayP3Red: 1, green: 0, blue: 0.43, alpha: 1), UIColor.white, "YellowNextButton", "YellowExitButton"],
                  
                  [ UIColor.init(displayP3Red: 0.98, green: 0.34, blue: 0.03, alpha: 1), UIColor.white, "PurpleNextButton", "PurpleExitButton"]]
    
    let labels = ["CENSUS", "WHO", "MISC", "ToD", "paranoia"]
    let modeicons = ["book", "person", "yarn", "lips", "coin"]
    
    var currentcard = ["5", "Welcome!"]

    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var nextcardbutton: UIButton!
    @IBOutlet weak var card: UILabel!
    @IBOutlet weak var exitbutton: UIButton!
    @IBOutlet weak var backbutton: UIButton!
    @IBOutlet weak var icon: UIButton!
    
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
                let newitem = item.components(separatedBy: ":")
                if newitem[0] == "2" { whosleft += 1}
                attribute.append(newitem)
               }
               attribute.remove(at: attribute.count-1)
        return attribute
    }
    
    //takes a card, and adjusts the interface accordingly
    func generateCard(newcard: [String]){
        card.text = newcard[1]
        var kind = 0
        if paranoiaMode { kind = 4 }
        else { kind = (Int(newcard[0]) ?? 4) - 1 }
        let image = UIImage(named: colors[kind][2] as! String )! as UIImage
        let image2 = UIImage(named: colors[kind][3] as! String )! as UIImage
        icon.setImage(UIImage(named: modeicons[kind])! as UIImage, for: .normal)
        self.view.backgroundColor = colors[kind][0] as? UIColor
        category.textColor = colors[kind][1] as? UIColor
        category.text = labels[kind]
        card.textColor = colors[kind][1] as? UIColor
        nextcardbutton.setImage(image, for: .normal)
        exitbutton.setImage(image2, for: .normal)
        
        //if the current card is the paranoia card
        if newcard.count == 3 {
            if newcard[2].contains("p"){
                let image = UIImage(named: "ParanoiaButton" )! as UIImage
                nextcardbutton.setImage(image, for: .normal)
                paranoiaMode = true
            }
        }
        //if we already are in paranoia mode
        else if paranoiaMode {
            backbutton.isEnabled = true
            backbutton.isHidden = false
            icon.setImage(UIImage(named: "coin")! as UIImage, for: .normal)
        }
        
    }
    
    //gets a new card, based on what the mode is (used in viewDidLoad and nextcardpressed)
    func pickNewCard(){
        if paranoiaMode == true {
            if whosleft == 0 {
                paranoiaMode = false
                backbutton.isEnabled = false
                backbutton.isHidden = true
                pickNewCard()
            }
            else {
                var card = ["0", "0", "0"]
                var index = 0
                while card[0] != "2" {
                    index = Int.random(in: 0...(deck.count-1))
                    card = deck[index]
                }
                currentcard = card
                deck.remove(at: index)
                whosleft -= 1
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
            if currentcard[0] == "2" { whosleft -= 1}
            deck.remove(at: index)
            //if we ran out of paranoia cards and returned without pressing back
            if currentcard.count == 3 && currentcard[2].contains("p") && whosleft == 0 {
                pickNewCard()
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
            //adding extension packs
            for i in 1...truthtable.count {
                let ex = truthtable[i-1]
                if ex { deck += makeDeck(fname: labletable[i-1]) }
            }
            if (filth == 2) {
                //add filthy deck
                deck += makeDeck(fname: "dirty")
            }
            //cleaning the deck
            else if (filth == 0) {
                var i = 0
                while i < deck.count {
                    if deck[i].count == 3 && deck[i][2].contains("x") {
                        if deck[i][0] == "2" { whosleft -= 1}
                        deck.remove(at: i)
                    }
                    else { i += 1 }
                }
            }
            if (irl == false) {
                //remove irl cards
                var i = 0
                while i < deck.count {
                    if deck[i].count == 3 && deck[i][2].contains("i") {
                        if deck[i][0] == "2" { whosleft -= 1}
                        deck.remove(at: i)
                    }
                    else { i += 1 }
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
            help.currentcard = currentcard
            help.exitbutton = exitbutton
            help.backbutton = backbutton
            help.nextcardbutton = nextcardbutton
            help.filth = filth
            help.irl = irl
        }
    }
    
    @IBAction func exitpressed(_ sender: Any) {
        performSegue(withIdentifier: "backward", sender: self)
    }
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
        flipped = false

    }
   
    @IBAction func coinflipped(_ sender: Any) {
        if currentcard[0] == "2" && paranoiaMode && flipped == false {
            flipped = true
            let flip = Int.random(in: 0...1)
            if flip == 0 {icon.setImage(UIImage(named: "heads")! as UIImage, for: .normal)}
            else {icon.setImage(UIImage(named: "tails")! as UIImage, for: .normal)}
        }
    }
    
}
