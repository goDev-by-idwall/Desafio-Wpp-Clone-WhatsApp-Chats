//
//  ContactsTableViewCell.swift
//  WhatsAoo Chats
//
//  Created by Felipe Brigagão de Almeida on 25/03/22.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    static let identifier = "ContactsTableViewCell"
    
    lazy var contactImageView: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(systemName: "person.fill")
        image.contentMode = .scaleAspectFit
        image.tintColor = .blue
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var contactNameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Contact Name"
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var contactMessageLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Some message sent by the contact, using to see the fit on the TableViewCell design test."
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var contactDateTimeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "25/03/22"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var verticalStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.spacing = 4
        stack.contentMode = .top
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.spacing = 4
        stack.contentMode = .left
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(contactImageView)
        addSubview(verticalStackView)
        addSubview(horizontalStackView)
        setupConstraints()
        
        horizontalStackView.addArrangedSubview(contactNameLabel)
        horizontalStackView.addArrangedSubview(contactDateTimeLabel)
        verticalStackView.addArrangedSubview(horizontalStackView)
        verticalStackView.addArrangedSubview(contactMessageLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            contactImageView.widthAnchor.constraint(equalToConstant: 30),
            contactImageView.heightAnchor.constraint(equalToConstant: 30),
            contactImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            contactImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            verticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            verticalStackView.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 15),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -25)
        ])
    }
}
