//
//  SettingsViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Eric Davenport on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var sliderControl: UISlider!
    @IBOutlet weak var stepperControl: UIStepper!
    @IBOutlet weak var fontSizeLabel: UILabel!
    
    var currentFont: Double?

    
    var movie: Movie?
   
    override func viewDidLoad() {
        super.viewDidLoad()
//        configureSlider()
//        configureStepper()
    }
//
//    func configureStepper() {
//        stepperControl.maximumValue = 32
//        stepperControl.minimumValue = 4
//        stepperControl.stepValue = 1
//    }
//    func configureSlider() {
//        sliderControl.maximumValue = 32
//        sliderControl.minimumValue = 4
//
//    }
        

    @IBAction func sliderAction(_ sender: UISlider) {
        sliderControl.value = sender.value
        sliderControl.value = Float(stepperControl.value)
        currentFont = Double(sliderControl.value)
        print(currentFont)
    }
    
    
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        stepperControl.value = sender.value
        stepperControl.value = Double(sliderControl.value)
        currentFont = Double(stepperControl.value)
        print(currentFont)
    }
    

   

}

