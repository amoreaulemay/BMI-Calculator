//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Alexandre Moreau-Lemay. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!
    @IBOutlet weak var heightSliderValue: UISlider!
    @IBOutlet weak var weightSliderValue: UISlider!
    
    var bmi = BMI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func heightSlider(_ sender: UISlider) {
        bmi.updateHeight(heightSliderValue.value)
        updateUI()
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        bmi.updateWeigth(weightSliderValue.value)
        updateUI()
    }
    
    @IBAction func calulatePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "mainVCtoResultVC", sender: self)
    }
    
    func updateUI() {
        heightValueLabel.text = String(round(100*bmi.height) / 100) + " m"
        weightValueLabel.text = String(round(10*bmi.weight) / 10) + " kg"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "mainVCtoResultVC") {
            let vc: ResultViewController = segue.destination as! ResultViewController
            vc.bmi = bmi
        }
    }
}

