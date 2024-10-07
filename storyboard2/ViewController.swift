//
//  ViewController.swift
//  storyboard2
//
//  Created by Сергей Грицаев on 07.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var isAnimated = false
    let topLabel = UILabel()
    let midLabel = UILabel()
    let button = UIButton()
    
    lazy var clicks:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    func setupLayout() {
        configureButton()
        configureTopLabel()
        configureMidLabel()
    }
    
    func configureTopLabel() {
        view.addSubview(topLabel)
        topLabel.textColor = .black
        topLabel.text = "clicks amount"
        topLabel.font = topLabel.font.withSize(50)
        
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configureMidLabel() {
        view.addSubview(midLabel)
        midLabel.textColor = .black
        midLabel.text = String(clicks)
        midLabel.font = midLabel.font.withSize(100)
        
        midLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            midLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            midLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configureButton() {
        view.addSubview(button)
        button.setTitle("+1", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.layer.cornerRadius = 50
    }
    
    @objc func buttonPressed() {
        clicks+=1
        midLabel.text = String(clicks)
    }
}

