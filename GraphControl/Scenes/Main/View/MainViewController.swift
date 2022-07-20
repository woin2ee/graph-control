//
//  MainViewController.swift
//  GraphControl
//
//  Created by Jaewon on 2022/07/18.
//

import UIKit

final class MainViewController: UIViewController {
    
    private var viewModel: MainViewModel = MainViewModel()
    
    @IBOutlet weak var sliderBar: UISlider! {
        didSet {
            sliderBar.minimumValue = 0.00001
        }
    }
    
    @IBOutlet weak var graphContainerView: UIView!
    @IBOutlet weak var graphHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didChangeValueOfSliderBar(_ sender: UISlider) {
        viewAnimation(value: CGFloat(sender.value))
        print(self.graphHeightConstraint.multiplier)
    }
    
    func viewAnimation(value: CGFloat) {
        UIView.animate(withDuration: 0.5) {
            NSLayoutConstraint.updateMultiplier(of: &self.graphHeightConstraint, value)
            self.graphContainerView.layoutIfNeeded()
        }
    }
}
