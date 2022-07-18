//
//  MainViewController.swift
//  GraphControl
//
//  Created by Jaewon on 2022/07/18.
//

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet weak var sliderBar: UISlider!
    
    @IBOutlet weak var graphHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didChangeValueOfSliderBar(_ sender: UISlider) {
        UIView.animate(withDuration: 0.5) {
            NSLayoutConstraint.updateMultiplier(of: &self.graphHeightConstraint, CGFloat(sender.value))
            self.view.layoutIfNeeded()
        }
    }
}
