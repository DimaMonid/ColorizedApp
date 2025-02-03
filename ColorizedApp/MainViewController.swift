//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Дима Монид on 3.02.25.
//

import UIKit

protocol ColorizedViewControllerDelegate: AnyObject{
    func setColor(_ color: UIColor)
}

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorizedVC = segue.destination as? ColorizedViewController else {return}
        colorizedVC.delegate = self
        colorizedVC.viewColor = view.backgroundColor
    }

}

// MARK: - ColorizedViewControllerDelegate
extension MainViewController: ColorizedViewControllerDelegate{
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
