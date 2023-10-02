//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Joel Espinal (JoelEspinal) on 5/9/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var personCount: UILabel!
    
    var totalPerPerson: Float = 0
    var personSplitted: Int = 0
    var tipPersentage: String = "0%"
    var message: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        personCount.text = String(totalPerPerson)
        settingsLabel.text = message
    }
    
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
