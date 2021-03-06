//
//  ExtensionController.swift
//  ZOYA
//
//  Created by Anna Gerchanovsky on 6/26/20.
//  Copyright © 2020 GAAG. All rights reserved.
//

import UIKit

class ExtensionController: UIViewController {
    
    var truthtable = [false, false, false, false]
    //currently [college pack, brutal pack, internet pack, us pack]
    var clean = false
    //var mild = false
    //var dirty = false
    var filth = 1
    var irl = true

    
    //var image = UIImage(named: "dot" )! as UIImage
    
    
    @IBOutlet weak var spray: UIImageView!
    
    
    @IBOutlet weak var cleanbutton: UIButton!
    @IBOutlet weak var mildbutton: UIButton!
    @IBOutlet weak var dirtybutton: UIButton!
    
    
    @IBOutlet weak var collegebutton: UIButton!
    @IBOutlet weak var brutalbutton: UIButton!
    @IBOutlet weak var internetbutton: UIButton!
    @IBOutlet weak var distancebutton: UIButton!
    
    @IBOutlet weak var collegetext: UILabel!
    @IBOutlet weak var distancetext: UILabel!
    @IBOutlet weak var brutaltext: UILabel!
    @IBOutlet weak var internettext: UILabel!
    
    
    func secretdeck() {
        if truthtable[3] {
            truthtable[3] = false
            spray.image = UIImage(named: "spraybottle" )
        }
        else {
            truthtable[3] = true
            spray.image = UIImage(named: "spray" )
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mildbutton.setImage(UIImage(named: "GreenDot" )! as UIImage, for: .normal)
        
    
        //making buttons have shadows when selected (temporary)
        collegebutton.layer.shadowColor = UIColor.clear.cgColor
        collegebutton.layer.shadowOffset = CGSize(width: 5, height: 5)
        collegebutton.layer.shadowRadius = 5
        collegebutton.layer.shadowOpacity = 1.0
        
        brutalbutton.layer.shadowColor = UIColor.clear.cgColor
        brutalbutton.layer.shadowOffset = CGSize(width: 5, height: 5)
        brutalbutton.layer.shadowRadius = 5
        brutalbutton.layer.shadowOpacity = 1.0
        
        internetbutton.layer.shadowColor = UIColor.clear.cgColor
        internetbutton.layer.shadowOffset = CGSize(width: 5, height: 5)
        internetbutton.layer.shadowRadius = 5
        internetbutton.layer.shadowOpacity = 1.0
        
        distancebutton.layer.shadowColor = UIColor.clear.cgColor
        distancebutton.layer.shadowOffset = CGSize(width: 5, height: 5)
        distancebutton.layer.shadowRadius = 5
        distancebutton.layer.shadowOpacity = 1.0
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is HelpController {
            //keeps track of what the previous page was when back going from help
            let help = segue.destination as! HelpController
            help.previouspage = "extension"
        }
        else if segue.destination is GameController {
            //conveys information on which extensions and mode are going to be used
            let game = segue.destination as! GameController
            game.truthtable = truthtable
            game.filth = filth
            game.irl = irl
        }
    }
    
    //recording which options are selected and what values in the truthbable are what
    @IBAction func collegetouched(_ sender: Any) {
        collegetext.isHidden = false
    }
    @IBAction func collegeclicked(_ sender: Any) {
        collegetext.isHidden = true
        if truthtable[0] {
            truthtable[0] = false
            collegebutton.isSelected = false
            collegebutton.setImage(UIImage(named: "orange" )! as UIImage, for: .normal)
        }
        else {
            truthtable[0] = true
            collegebutton.isSelected = true
            collegebutton.setImage(UIImage(named: "green" )! as UIImage, for: .normal)
        }
    }

    @IBAction func brutaltouched(_ sender: Any) {
        brutaltext.isHidden = false
    }
    @IBAction func brutalclicked(_ sender: Any) {
        brutaltext.isHidden = true
        if truthtable[1] {
            truthtable[1] = false
            brutalbutton.isSelected = false
            brutalbutton.setImage(UIImage(named: "yellow" )! as UIImage, for: .normal)
        }
        else {
            truthtable[1] = true
            brutalbutton.isSelected = true
            brutalbutton.setImage(UIImage(named: "green" )! as UIImage, for: .normal)
        }
    }
    @IBAction func internettouched(_ sender: Any) {
        internettext.isHidden = false
    }
    @IBAction func internetclicked(_ sender: Any) {
        internettext.isHidden = true
        if truthtable[2] {
            truthtable[2] = false
            internetbutton.isSelected = false
            internetbutton.setImage(UIImage(named: "pink" )! as UIImage, for: .normal)
        }
        else {
            truthtable[2] = true
            internetbutton.isSelected = true
            internetbutton.setImage(UIImage(named: "green" )! as UIImage, for: .normal)

        }
    }
    @IBAction func distancetouched(_ sender: Any) {
        distancetext.isHidden = false
    }
    @IBAction func distanceclicked(_ sender: Any) {
        distancetext.isHidden = true
        if irl {
            irl = false
            distancebutton.isSelected = true
            distancebutton.setImage(UIImage(named: "green" )! as UIImage, for: .normal)
        }
        else {
            irl = true
            distancebutton.isSelected = false
            distancebutton.setImage(UIImage(named: "purple" )! as UIImage, for: .normal)
        }
    }
    
    @IBAction func cleanclicked(_ sender: Any) {
        if filth != 0 {
            cleanbutton.setImage(UIImage(named: "GreenDot" )! as UIImage, for: .normal)
            mildbutton.setImage(UIImage(named: "dot" )! as UIImage, for: .normal)
            dirtybutton.setImage(UIImage(named: "dot" )! as UIImage, for: .normal)
            filth = 0
        }
    }
    @IBAction func college2(_ sender: Any) {
        collegetext.isHidden = true
        secretdeck()
    }
    
    
    @IBAction func Mild(_ sender: Any) {
        if filth != 1 {
            cleanbutton.setImage(UIImage(named: "dot" )! as UIImage, for: .normal)
            mildbutton.setImage(UIImage(named: "GreenDot" )! as UIImage, for: .normal)
            dirtybutton.setImage(UIImage(named: "dot" )! as UIImage, for: .normal)
            filth = 1
        }
    }
    
    
    @IBAction func Dirty(_ sender: Any) {
        if filth != 2 {
            cleanbutton.setImage(UIImage(named: "dot" )! as UIImage, for: .normal)
            mildbutton.setImage(UIImage(named: "dot" )! as UIImage, for: .normal)
            dirtybutton.setImage(UIImage(named: "GreenDot" )! as UIImage, for: .normal)
            filth = 2
        }
    }
    
    @IBAction func gopressed(_ sender: Any) {
        performSegue(withIdentifier: "forward2", sender: self)
    }
    
    @IBAction func helppressed(_ sender: Any) {
        performSegue(withIdentifier: "extensiontohelp", sender: self)
    }

    
}
