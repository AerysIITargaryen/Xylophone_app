//
//  ViewController.swift
//  Xylophone
//
//  Created by Иван Станкин on 19.07.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    lazy var buttonC: UIButton = {
        let button = UIButton()
        button.setTitle("C", for: .normal)
        button.backgroundColor = .red
        button.clipsToBounds = true
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonD: UIButton = {
        let button = UIButton()
        button.setTitle("D", for: .normal)
        button.backgroundColor = .orange
        button.clipsToBounds = true
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonE: UIButton = {
        let button = UIButton()
        button.setTitle("E", for: .normal)
        button.backgroundColor = .systemYellow
        button.clipsToBounds = true
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonF: UIButton = {
        let button = UIButton()
        button.setTitle("F", for: .normal)
        button.backgroundColor = .systemGreen
        button.clipsToBounds = true
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonG: UIButton = {
        let button = UIButton()
        button.setTitle("G", for: .normal)
        button.backgroundColor = .systemPurple
        button.clipsToBounds = true
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonA: UIButton = {
        let button = UIButton()
        button.setTitle("A", for: .normal)
        button.backgroundColor = .systemBlue
        button.clipsToBounds = true
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonB: UIButton = {
        let button = UIButton()
        button.setTitle("B", for: .normal)
        button.backgroundColor = .purple
        button.clipsToBounds = true
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 10
        
        stack.addArrangedSubview(buttonC)
        stack.addArrangedSubview(buttonD)
        stack.addArrangedSubview(buttonE)
        stack.addArrangedSubview(buttonF)
        stack.addArrangedSubview(buttonG)
        stack.addArrangedSubview(buttonA)
        stack.addArrangedSubview(buttonB)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(stack)
        setConstraints()
        
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            buttonD.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 5),
            buttonD.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -5),
            
            buttonE.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 10),
            buttonE.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -10),
            
            buttonF.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 15),
            buttonF.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -15),
            
            buttonG.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 20),
            buttonG.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -20),
            
            buttonA.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25),
            buttonA.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -25),
            
            buttonB.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 30),
            buttonB.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -30)
        ])
    }
    
    @objc func buttonTapped(sender: UIButton) {
        
        sender.alpha = 0.5
        
        guard let title = sender.title(for: .normal) else {return}
        playSound(soundName: title)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            sender.alpha = 1
        }
        
    }

    func playSound(soundName: String) {
        
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }

}

