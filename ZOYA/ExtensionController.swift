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
    
    //var cmu = false
    //var us = false
    //var corona = false
    
    
    @IBOutlet weak var collegebutton: UIButton!
    @IBOutlet weak var usbutton: UIButton!
    @IBOutlet weak var coronabutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //cmubutton.setTitleColor(UIColor.darkGray, for: .selected)

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let game = segue.destination as! GameController
        game.truthtable = truthtable
        //nothing yet
    }
    
    @IBAction func collegeclicked(_ sender: Any) {
        if truthtable[0] {
            truthtable[0] = false
            collegebutton.isSelected = false
        }
        else {
            truthtable[0] = true
            collegebutton.isSelected = true
        }
        //print(truthtable[0])
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
    

    @IBAction func gopressed(_ sender: Any) {
        performSegue(withIdentifier: "forward2", sender: self)
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
