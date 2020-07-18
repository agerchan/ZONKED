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
    
    @IBOutlet weak var rules: UILabel!
    
    //which variables we may have to take from game
    var truthtable = [false]
    var filth = 1
    var irl = true
    var paranoiaMode = false
    var deck = [[String]]()
    //var paranoiaDeck = [[String]]()
    var currentcard = ["1", "no"]
    var exitbutton: UIButton!
    var backbutton: UIButton!
    var nextcardbutton: UIButton!
    
    @IBOutlet weak var gamesetupbutton: UIButton!
    @IBOutlet weak var gamesetuptriangle: UIImageView!
    @IBOutlet weak var gamesetuptriangleh: UIImageView!
    @IBOutlet weak var gamerulesbutton: UIButton!
    @IBOutlet weak var gamerulestriangle: UIImageView!
    @IBOutlet weak var gamerulestriangleh: UIImageView!
    @IBOutlet weak var disclaimerbutton: UIButton!
    @IBOutlet weak var disclaimertriangle: UIImageView!
    @IBOutlet weak var disclaimertriangleh: UIImageView!

    @IBOutlet weak var memobutton: UIButton!
    @IBOutlet weak var memotriangle: UIImageView!
    @IBOutlet weak var memotriangleh: UIImageView!
    
    
    func gameSetup () {
        rules.text = "On the extension page, you get to customize what cards you'll get while playing the game. \n\n" + "The filth meter indicates how dirty you want the questions to be. Spray bottle is completely clean, the middle is normal, and the trash can is very dirty. \n\n" + "Select as many expansion packs and features as you'd like. To see their names, hold down the buttons. They will turn green when their extension pack is selected. \n\n" + "The graduation cap is the college themed expansion pack.\n\n" + "The earth is the distance feature, removing any questions that must be played in real life.\n\n" + "The skull is the brutal expansion pack, with questions that are sometimes just straight up mean.\n\n" + "The virus is the coronavirus themed expansion pack.\n\n" + "Once you are satisfied with your selections, press go to begin the game."
        gamesetuptriangle?.isHidden = false
        gamerulestriangle?.isHidden = true
        disclaimertriangle?.isHidden = true
        memotriangle?.isHidden = true
        gamesetuptriangleh?.isHidden = false
        gamerulestriangleh?.isHidden = true
        disclaimertriangleh?.isHidden = true
        memotriangleh?.isHidden = true
    }
    func gameRules () {
        rules.text = "Pass the phone around in a circle, with each person pulling one card. There are 4 categories of cards, each of which has its own rules.\n\n\n" + "CENSUS: If the card applies to you, whether or not you were the one who pulled the card or not, drink. \n\n" + "WHO: The group votes on who the statement applies to most. That person drinks. \n\n" + "TOD: Stands for truth or dare or drink. Person who pulled the card either does what the card says or drinks. \n\n" + "MISC: Cards should be self explanatory. Unless otherwise stated, this card will apply to the person who pulled it \n\n" + "PARANOIA (minigame): Initiated by one of the MISC cards. One by one, press next card, but don't let the rest of the group see the phone. Answer the question with the name of a person in the group, other than yourself. Flip the coin. If it's heads, reveal the question. If it's tails, keep it secret."
        gamesetuptriangle?.isHidden = true
        gamerulestriangle?.isHidden = false
        disclaimertriangle?.isHidden = true
        memotriangle?.isHidden = true
        gamesetuptriangleh?.isHidden = true
        gamerulestriangleh?.isHidden = false
        disclaimertriangleh?.isHidden = true
        memotriangleh?.isHidden = true
    }
    func disclamir () {
        rules.text = "Disclaimer! \n\nDo not drink if you are not of legal drinking age. \n\n\nYou can still play ZONKED as a social icebreaker game. To do so, replace drinks with points. The person with the most points at the end loses!\n"
        gamesetuptriangle?.isHidden = true
        gamerulestriangle?.isHidden = true
        disclaimertriangle?.isHidden = false
        memotriangle?.isHidden = true
        gamesetuptriangleh?.isHidden = true
        gamerulestriangleh?.isHidden = true
        disclaimertriangleh?.isHidden = false
        memotriangleh?.isHidden = true
    }
    func memo () {
        rules.text = "Gabriella Ardiles and Anna Gerchanovsky would like to thank our friends for helping us create this game. " +
            "Thank you Myles Winston, Brooke Gunter, Izzy Gloria, Neil Brydon for giving your input and opinions! " +
        "Special thanks to Izzy Gloria, for inpsiring the game, transcribing the cards, and promising to get the bug tattooed on her <3. " +
        "Sorry Cal McCullough and Alice Zilberberg that you cannot get this game on your phone :( " +
        "Sending love to everybody mentioned as well as Luke Arney, Jason Ledon, Rowan Dunlop, Max Robbins, Benjamin Stern, Garret Irwin, Palak Jain, and everybody else who made this possible."
        gamesetuptriangle?.isHidden = true
        gamerulestriangle?.isHidden = true
        disclaimertriangle?.isHidden = true
        memotriangle?.isHidden = false
        gamesetuptriangleh?.isHidden = true
        gamerulestriangleh?.isHidden = true
        disclaimertriangleh?.isHidden = true
        memotriangleh?.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if previouspage == "start" || previouspage == "game" {
            gameRules()
        }
        else if previouspage == "extension" {
            gameSetup()
        }
        else {gameRules()}
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is GameController {
            //returning info back to the game
            let game = segue.destination as! GameController
            game.truthtable = truthtable
            game.paranoiaMode = paranoiaMode
            game.deck = deck
            //game.paranoiaDeck = paranoiaDeck
            game.waspaused = true
            game.currentcard = currentcard
            game.exitbutton = exitbutton
            game.backbutton = backbutton
            game.nextcardbutton = nextcardbutton
        }
    }
    
    //figuring out where to return based on information that was passed in
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
    
    @IBAction func gameSetupPressed(_ sender: Any) {
        gameSetup()
    }
    
    @IBAction func gameRulesPressed(_ sender: Any) {
        gameRules()
    }
    @IBAction func disclamirPressed(_ sender: Any) {
        disclamir()
    }
    @IBAction func memoPressed(_ sender: Any) {
        memo()
    }
    @IBAction func secretPressed(_ sender: Any) {
        rules.text = "Hi Gaby!\nThis is an extra special thank you from me. " +
        "Thank you for oranizing this project and giving me something to do this summer! " +
        "I had so much fun doing this and there's nobody I'd rather work on a project with! " +
        "Thank you for always being here for me cutie ;)"
    }
    
}
