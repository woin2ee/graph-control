//
//  MainViewController.swift
//  GraphControl
//
//  Created by Jaewon on 2022/07/18.
//

import UIKit
import RxSwift
import RxCocoa

final class MainViewController: UIViewController {
    
    private var viewModel: MainViewModel = MainViewModel()
    private let disposeBag = DisposeBag.init()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sliderBar: UISlider! {
        didSet {
            sliderBar.minimumValue = Float(Graph.minValue) + 0.00001
            sliderBar.maximumValue = Float(Graph.maxValue)
            sliderBar.value = 50
        }
    }
    @IBOutlet weak var graphContainerView: UIView!
    @IBOutlet weak var graphHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel() {
        let input = MainViewModel.Input.init(
            changedValue: sliderBar.rx.value.asDriver(),
            typedText: textField.rx.text.asDriver()
        )
        let output = viewModel.transform(input: input)
        
        output.graph
            .map { $0.value / Graph.maxValue }
            .drive(
                onNext: {
                    self.updateConstraint(multiplier: CGFloat($0))
                }
            )
            .disposed(by: disposeBag)
        
        output.graph
            .drive(
                onNext: {
                    self.sliderBar.value = $0.value
                }
            )
            .disposed(by: disposeBag)
        
        output.graph
            .drive(
                onNext: {
                    self.textField.text = String(Int($0.value))
                }
            )
            .disposed(by: disposeBag)
    }
    
    private func updateConstraint(multiplier: CGFloat) {
        UIView.animate(withDuration: 0.5) {
            NSLayoutConstraint.updateMultiplier(of: &self.graphHeightConstraint, multiplier)
            self.graphContainerView.layoutIfNeeded()
        }
    }
}
