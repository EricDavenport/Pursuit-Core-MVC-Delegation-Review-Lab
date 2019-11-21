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
    
    //var currentFont: CGFloat?
    
    var currentFloat: CGFloat?
    
    var currentFont = CGFloat() {
        didSet {
            fontSizeLabel.font = UIFont(name: "Helvetica", size: currentFloat ?? 17)
//            stepperControl.value = Double(currentFloat!)
//            sliderControl.value = Float(currentFloat!)
        }
    }

    
    var movie: Movie?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSlider()
        configureStepper()
        sizeOfLabel()
    }
    func sizeOfLabel() {
        fontSizeLabel.font = UIFont(name: "Helvetica", size: currentFloat ?? 17)
    }

    func configureStepper() {
        stepperControl.maximumValue = 100
        stepperControl.minimumValue = 1
        stepperControl.stepValue = 1
        stepperControl.value = Double(currentFloat!)
    }
    func configureSlider() {
        sliderControl.maximumValue = 100
        sliderControl.minimumValue = 1
        sliderControl.value = Float(currentFloat!)

    }
        

    @IBAction func sliderAction(_ sender: UISlider) {
        sliderControl.value = sender.value
        stepperControl.value = Double(sliderControl.value)
        currentFont = CGFloat(sender.value)
                    currentFloat = currentFont
        print("Font: \(currentFont)")
        print("Stepper:\(stepperControl.value)")
        print("Stepper:\(sliderControl.value)")
    }
    
    
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        stepperControl.value = sender.value
        sliderControl.value = Float(stepperControl.value)
        currentFont = CGFloat(sender.value)
                currentFloat = currentFont
        print("Font: \(currentFont)")
        print("Stepper:\(stepperControl.value)")
        print("Stepper:\(sliderControl.value)")
    }
    

   

}

