//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Дима Монид on 16.01.25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        setColor()
        
        redLabel.text = value(from: redSlider)
        greenLabel.text = value(from: greenSlider)
        blueLabel.text = value(from: blueSlider)

    }
    
    @IBAction func sliderAction(_ sender: UISlider){
        setColor()
        
        switch sender {
        case redSlider:
            redLabel.text = value(from: redSlider)
        case greenSlider:
            greenLabel.text = value(from: greenSlider)
        default:
            blueLabel.text = value(from: blueSlider)
        }
    }
    
    private func setColor(){
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func value(from slider: UISlider) -> String{
        String(format: "%.2f", slider.value)
    }


}

