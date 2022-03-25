//
//  NewViewController.swift
//  WhatsAoo Chats
//
//  Created by Felipe Brigagão de Almeida on 25/03/22.
//

import UIKit

class NewViewController: UIViewController {
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        
        button.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "New Chat"
        view.backgroundColor = .systemBackground
        
        view.addSubview(closeButton)
        setupConstraints()
    }
    
    @objc func closeModal() {
        dismiss(animated: true)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
    }
}
