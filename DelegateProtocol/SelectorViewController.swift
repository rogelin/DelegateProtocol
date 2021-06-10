//
//  Selector.swift
//  DelegateProtocol
//
//  Created by Rogelin Farias on 10/06/21.
//

import UIKit

protocol WorkPlaceSelectionDelegate {
    func disSelectWorkPlace(image: UIImage, name: String)
}

class SelectorViewController: UIViewController {
    
    var workPlaceSelectionDelegate: WorkPlaceSelectionDelegate!
    
    var option1: UIButton = {
        let button = UIButton(type: .detailDisclosure)
        button.setImage(UIImage(systemName: "house.fill"), for: .normal)
        button.setTitle("Home", for: .normal)
        button.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        button.backgroundColor = .white
        return button
    }()
    
    var option2: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setImage(UIImage(systemName: "building.fill"), for: .normal)
        button.setTitle("Office", for: .normal)
        button.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
        button.backgroundColor = .white
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        view.backgroundColor = .green
        view.addSubview(option1)
        view.addSubview(option2)
        
        option1.translatesAutoresizingMaskIntoConstraints = false
        option2.translatesAutoresizingMaskIntoConstraints = false
        
        option1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        option1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20).isActive = true
        option1.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        option2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        option2.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20).isActive = true
        option2.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
    @objc func button1Tapped() {
        print("Button 1 tapped")
        workPlaceSelectionDelegate.disSelectWorkPlace(image: UIImage(systemName: "house.fill")!, name: "Work from home, Yay!")
        dismiss(animated: true) {
            print("Dismissed")
        }
    }
    @objc func button2Tapped() {
        print("Button 2 tapped")
        workPlaceSelectionDelegate.disSelectWorkPlace(image: UIImage(systemName: "building.fill")!, name: "Work at the Office, Nay!")
        dismiss(animated: true) {
            print("Dismissed")
        }
    }
}
