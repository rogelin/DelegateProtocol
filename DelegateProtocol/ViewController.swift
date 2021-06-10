//
//  ViewController.swift
//  DelegateProtocol
//
//  Created by Rogelin Farias on 10/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    let cover: UIImageView = {
        let cover = UIImageView()
        cover.image = UIImage(systemName: "questionmark.square")
        return cover
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "waiting for selection"
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Choose one", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.backgroundColor = .white
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        setUpViews()
    }
    
    func createViews() {
        view.addSubview(cover)
        view.addSubview(label)
        view.addSubview(button)
    }
    
    func setUpViews() {
        cover.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        cover.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        cover.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        label.topAnchor.constraint(equalTo: cover.topAnchor, constant: 50).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        button.topAnchor.constraint(equalTo: label.topAnchor, constant: 50).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    @objc func buttonTapped() {
        print("Touched")
        let selectorViewController = SelectorViewController()
        selectorViewController.workPlaceSelectionDelegate = self
        present(selectorViewController, animated: true) {
            print("Presented New View Cotroller")
        }
    }
}

extension ViewController: WorkPlaceSelectionDelegate {
    func disSelectWorkPlace(image: UIImage, name: String) {
        cover.image = image
        label.text = name
    }
}

