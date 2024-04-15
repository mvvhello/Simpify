//
//  NDButton.swift
//  Nomaday
//
//  Created by Vlad on 02/03/2024.
//

import UIKit

final class NDButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero) // TODO: adjust the size of the standart category button
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure() {
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        
        layer.cornerRadius = 5
        translatesAutoresizingMaskIntoConstraints = false
    }

}
