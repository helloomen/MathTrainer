//
//  TrainViewController.swift
//  MathTrainer
//
//  Created by Omen on 16.07.2023.
//

import UIKit

final class TrainViewController: UIViewController {
    
    override func viewDidLoad() {
        configureButtonsTwo()
    }
    
    // MARK: - Outlets
    @IBOutlet var buttonsCollectionTwo: [UIButton]!
    
    // MARK: - Properties
    var type: MathTypes = .add {
        didSet {
            print(type)
        }
    }
    
    // MARK: - Methods
    private func configureButtonsTwo() {
        buttonsCollectionTwo.forEach { button in
            button.layer.shadowColor = UIColor.darkGray.cgColor
            button.layer.shadowOffset = CGSize(width: 0.2, height: 3.0)
            button.layer.shadowOpacity = 0.5
            button.layer.shadowRadius = 5
        }
    }
}
