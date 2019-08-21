//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Michelle Cueva on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var backgroundColor: Color!{
        didSet {
            self.updateBackgroundColor()
        }
    }

    var crayon: Crayon!
    

    
    @IBOutlet weak var colorNameLabel: UILabel!
    
    @IBOutlet weak var redValueLabel: UILabel!
    
    @IBOutlet weak var greenValueLabel: UILabel!
    
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var alphaValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var alphaStepper: UIStepper!
    
    
    @IBAction func redSliderTouched(_ sender: UISlider) {
        backgroundColor.changeRed(red: CGFloat(sender.value))
        redValueLabel.text = sender.value.roundTo(places: 2).description
        updateBackgroundColor()
        
        
    }
    
    @IBAction func greenSliderTouched(_ sender: UISlider) {
        backgroundColor.changeGreen(green: CGFloat(sender.value))
        greenValueLabel.text = sender.value.roundTo(places: 2).description
        updateBackgroundColor()
    }
    
    @IBAction func blueSliderTouched(_ sender: UISlider) {
        backgroundColor.changeBlue(blue: CGFloat(sender.value))
        blueValueLabel.text = sender.value.roundTo(places: 2).description
        updateBackgroundColor()
    }
    
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        backgroundColor.changeAlpha(alpha: CGFloat(sender.value))
        alphaValueLabel.text = sender.value.roundTo(places: 2).description
        updateBackgroundColor()
        if sender.value < 0.5 {
            changeColor(color: UIColor.white)
        } else {
            changeColor(color: UIColor.black)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialValues()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    }
    
    func updateBackgroundColor() {
        self.view.backgroundColor = backgroundColor.getColor()
        
       
        
        
    }
    
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        setInitialValues()
    }
    
    func setInitialValues() {
        backgroundColor = Color(red: CGFloat(crayon.red/255)
            , green: CGFloat(crayon.green/255), blue: CGFloat(crayon.blue/255), alpha: 1)
        
       
        
        colorNameLabel.text = crayon.name
        redValueLabel.text = (crayon.red/255).roundTo(places: 2).description
        blueValueLabel.text = (crayon.red/255).roundTo(places: 2).description
        greenValueLabel.text = (crayon.red/255).roundTo(places: 2).description
        alphaValueLabel.text = "1"
        redSlider.value = Float(crayon.red/255).roundTo(places: 2)
        greenSlider.value = Float(crayon.red/255).roundTo(places: 2)
        blueSlider.value = Float(crayon.red/255).roundTo(places: 2)
        
    }
    
    func changeColor(color: UIColor) {
        colorNameLabel.textColor = color
        redValueLabel.textColor = color
        blueValueLabel.textColor = color
        greenValueLabel.textColor = color
        alphaValueLabel.textColor = color
    }
    

}
