//
//  GameOverController.swift
//  ZOYA
//
//  Created by Anna Gerchanovsky on 6/27/20.
//  Copyright © 2020 GAAG. All rights reserved.
//

import UIKit

class GameOverController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func restartclicked(_ sender: Any) {
        performSegue(withIdentifier: "restart", sender: self)
    }

}
