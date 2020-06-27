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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func restartclicked(_ sender: Any) {
        performSegue(withIdentifier: "restart", sender: self)
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
