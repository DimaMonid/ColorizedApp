//
//  ColorizedViewController.swift
//  ColorizedApp
//
//  Created by Дима Монид on 16.01.25.
//

import UIKit

final class ColorizedViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    weak var delegate: ColorizedViewControllerDelegate!
    var viewColor: UIColor!
    
    // MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        colorView.backgroundColor = viewColor
        setValue(for: redSlider, greenSlider, blueSlider)
        setValue(for: redLabel, greenLabel, blueLabel)
        setColor()
        
        
        redLabel.text = value(from: redSlider)
        greenLabel.text = value(from: greenSlider)
        blueLabel.text = value(from: blueSlider)

    }
    
    // MARK: - IB Actions
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
    
    @IBAction func doneButtonAction() {
        delegate?.setColor(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    
    // MARK: - Private func
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
    
    private func setValue(for labels: UILabel...){
        labels.forEach { label in
            switch label {
            case redLabel: label.text = value(from: redSlider)
            case greenLabel: label.text = value(from: greenSlider)
            default: label.text = value(from: blueSlider)
            }
        }
    }
    
    private func setValue(for colorSliders: UISlider...){
        let ciColor = CIColor(color: viewColor)
        colorSliders.forEach { slider in
            switch slider{
            case redSlider: slider.value = Float(ciColor.red)
            case greenSlider: slider.value = Float(ciColor.green)
            default: blueSlider.value = Float(ciColor.blue)
            }
        }
    }

}

