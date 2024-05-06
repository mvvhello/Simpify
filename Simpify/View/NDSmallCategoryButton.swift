//
//  NDSmallCategoryButton.swift
//  Simpify
//
//  Created by Vlad on 29/04/2024.
//

import UIKit

final class NDSmallCategoryButton: UIView {
    
    var circle = UIView()
    var title = UILabel()
    
    // Mock data
    var userCategory = Category()

    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        circle.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = userCategory.color.rawValue
        self.layer.cornerRadius = 10
        
        self.addSubview(circle)
        self.addSubview(title)
        
        // title adjustment
        title.text = "Education"
        title.font = .systemFont(ofSize: 16)
        title.numberOfLines = 1
        title.textColor = .white
        title.textAlignment = .left
        title.lineBreakMode = .byTruncatingTail
        
        // circle adjustment
        circle.clipsToBounds = true
        circle.backgroundColor = .white
        circle.layer.cornerRadius = 5
        
        NSLayoutConstraint.activate([
            
            circle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            circle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            circle.widthAnchor.constraint(equalToConstant: 10),
            circle.heightAnchor.constraint(equalToConstant: 10),
            
            title.leadingAnchor.constraint(equalTo: circle.trailingAnchor, constant: 8),
            title.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            title.trailingAnchor.constraint(greaterThanOrEqualTo: self.trailingAnchor, constant: -12),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
    }
}

#Preview {
    let button = NDSmallCategoryButton()
    return button
}
