//
//  ViewController.swift
//  ZOYA
//
//  Created by Anna Gerchanovsky on 6/26/20.
//  Copyright © 2020 GAAG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is HelpController {
            //keeps track of what the previous page was when back going from help
            let help = segue.destination as! HelpController
            help.previouspage = "start"
        }
    }

    @IBAction func startpressed(_ sender: Any) {
        performSegue(withIdentifier: "forward1", sender: self)
    }
    @IBAction func helppressed(_ sender: Any) {
        performSegue(withIdentifier: "starttohelp", sender: self)
    }
    
}

