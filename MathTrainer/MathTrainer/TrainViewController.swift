//
//  TrainViewController.swift
//  MathTrainer
//
//  Created by Omen on 16.07.2023.
//

import UIKit

final class TrainViewController: UIViewController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        configureQuestion()
        configureButtonsTwo()
    }
    
    // MARK: - Outlets
    @IBOutlet var buttonsCollectionTwo: [UIButton]!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var counter: UILabel!
    
    // MARK: - IBActions
    
    @IBAction func leftAction(_ sender: UIButton) {
        check(answer: sender.titleLabel?.text ?? "", for: sender)
    }
    
    @IBAction func rightAction(_ sender: UIButton) {
        check(answer: sender.titleLabel?.text ?? "", for: sender)
    }
    
    // MARK: - Properties
    private var firstNumber = 0
    private var secondNumber = 0
    private var sign: String = ""
    private var count: Int = 0 {
        didSet {
            print("Count \(count)")
        }
    }
        
        var type: MathTypes = .add {
            didSet {
                switch type {
                case .add:
                    sign = "+"
                case .subtract:
                    sign = "-"
                case .multiply:
                    sign = "*"
                case .divide:
                    sign = "/"
                }
            }
        }
        
        private var answer: Int {
            switch type {
            case .add:
                return firstNumber + secondNumber
            case .subtract:
                return firstNumber - secondNumber
            case .multiply:
                return firstNumber * secondNumber
            case .divide:
                return firstNumber / secondNumber
            }
        }
    
        // MARK: - Methods
        private func configureButtonsTwo() {
            
            // снова заменили цвет кнопок на желтый
            buttonsCollectionTwo.forEach { button in
                button.backgroundColor = .systemYellow
            }
            
            // Add shadow
            buttonsCollectionTwo.forEach { button in
                button.layer.shadowColor = UIColor.darkGray.cgColor
                button.layer.shadowOffset = CGSize(width: 0.2, height: 3.0)
                button.layer.shadowOpacity = 0.5
                button.layer.shadowRadius = 5
            }
            
            let isRightButton = Bool.random()
            
            var randomAnswer: Int
            repeat {
                randomAnswer = Int.random(in: (answer - 10)...(answer + 10))
            } while randomAnswer == answer
            
            buttonsCollectionTwo[1].setTitle(isRightButton ? String(answer) : String(randomAnswer), for: .normal)
            buttonsCollectionTwo[0].setTitle(isRightButton ? String(randomAnswer) : String(answer), for: .normal)
        }
        
        private func configureQuestion() {
            firstNumber = Int.random(in: 1...99)
            secondNumber = Int.random(in: 1...99)
            
            questionLabelFunc()
            let question: String = "\(firstNumber) \(sign) \(secondNumber) ="
            questionLabel.text = question
        }
        
    private func questionLabelFunc() {
        if type == .divide {
            repeat {
                firstNumber = Int.random(in: 1...99)
                secondNumber = Int.random(in: 1...firstNumber)
            } while
            firstNumber % secondNumber != 0 || firstNumber == secondNumber
        } else {
            firstNumber = Int.random(in: 1...99)
            secondNumber = Int.random(in: 1...99)
        }
    }
    
    private func check(answer: String, for button: UIButton) {
        let isRightAnswer = Int(answer) == self.answer
        
        button.backgroundColor = isRightAnswer ? .green : .red
        
        if isRightAnswer {
            count += 1
            counter.text = String(count)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                [weak self] in
                self?.configureQuestion()
                self?.configureButtonsTwo()
            }
        }
    }
}
