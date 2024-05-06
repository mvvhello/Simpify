//
//  NDCategoryCircle.swift
//  Simpify
//
//  Created by Vlad on 06/05/2024.
//

import UIKit

final class NDCategoryCircle: UIView {
    
    let userData = Category()

    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = userData.color.rawValue
        self.layer.cornerRadius = self.layer.bounds.width / 2
        self.clipsToBounds = true
    }
}

#Preview {
    let circle = NDCategoryCircle()
    return circle
}
