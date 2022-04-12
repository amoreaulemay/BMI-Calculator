//
//  Result.swift
//  BMI Calculator
//
//  Created by Alexandre Moreau-Lemay on 29/01/2021.
//  Copyright © 2021 Alexandre Moreau-Lemay. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    var bmi: BMI = BMI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateResult()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateResult()
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func updateResult() {
        resultLabel.text = String(round(10*bmi.bmiValue)/10)
        messageLabel.text = bmi.message
        self.view.backgroundColor = bmi.bgColor
    }
}
