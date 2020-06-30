//
//  ExtensionController.swift
//  ZOYA
//
//  Created by Anna Gerchanovsky on 6/26/20.
//  Copyright © 2020 GAAG. All rights reserved.
//

import UIKit

class ExtensionController: UIViewController {
    
    var truthtable = [false, false, false]
    //currently [college pack, us specific pack, corona pack]
    var clean = false
    var mild = false
    var dirty = false

    
    var image = UIImage(named: "dot" )! as UIImage
    
    @IBOutlet weak var cleanbutton: UIButton!
    @IBOutlet weak var mildbutton: UIButton!
    
    @IBOutlet weak var dirtybutton: UIButton!
    
    
    @IBOutlet weak var collegebutton: UIButton!
    @IBOutlet weak var usbutton: UIButton!
    @IBOutlet weak var coronabutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //nothing yet
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
            game.clean = clean
        }
    }
    
    //recording which options are selected and what values in the truthbable are what
    @IBAction func collegeclicked(_ sender: Any) {
        if truthtable[0] {
            truthtable[0] = false
            collegebutton.isSelected = false
        }
        else {
            truthtable[0] = true
            collegebutton.isSelected = true
        }
    }
    @IBAction func usclicked(_ sender: Any) {
        if truthtable[1] {
            truthtable[1] = false
            usbutton.isSelected = false
        }
        else {
            truthtable[1] = true
            usbutton.isSelected = true
        }
    }
    @IBAction func coronaclicked(_ sender: Any) {
        if truthtable[2] {
            truthtable[2] = false
            coronabutton.isSelected = false
        }
        else {
            truthtable[2] = true
            coronabutton.isSelected = true
        }
    }
    
    @IBAction func cleanclicked(_ sender: Any) {
        if clean {
            image = UIImage(named: "dot" )! as UIImage
            clean = false
            cleanbutton.isSelected = false
        }
        else {
            image = UIImage(named: "greenDot" )! as UIImage
            clean = true
            
            cleanbutton.isSelected = true
        }
    cleanbutton.setImage(image, for: .normal)
    }
    
    @IBAction func Mild(_ sender: Any) {
        if mild {
            image = UIImage(named: "dot" )! as UIImage
            mild = false
            mildbutton.isSelected = false
            }
        else {
            image = UIImage(named: "greenDot" )! as UIImage
            mild = true
            mildbutton.isSelected = true
        }
        mildbutton.setImage(image, for: .normal)
        }
    
    
    @IBAction func Dirty(_ sender: Any) {
        if dirty {
            image = UIImage(named: "dot" )! as UIImage
            dirty = false
            dirtybutton.isSelected = false
            }
        else {
            image = UIImage(named: "greenDot" )! as UIImage
            dirty = true
            dirtybutton.isSelected = true
        }
        dirtybutton.setImage(image, for: .normal)
    }
    
    @IBAction func gopressed(_ sender: Any) {
        performSegue(withIdentifier: "forward2", sender: self)
    }
    
    @IBAction func helppressed(_ sender: Any) {
        performSegue(withIdentifier: "extensiontohelp", sender: self)
    }

}
