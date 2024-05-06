//
//  NDLineBarStackView.swift
//  Simpify
//
//  Created by Vlad on 13/04/2024.
//

import UIKit

final class NDLineBarStackView: UIStackView {
    
    let userData = User(userId: 1, userMail: "something")
    
    init() {
        super.init(frame: .zero)
        configureStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureStackView() {
        self.translatesAutoresizingMaskIntoConstraints = false
                
        for (index, category) in userData.userCategories.enumerated() {
            let categoryLineBarView = UIView()
            categoryLineBarView.translatesAutoresizingMaskIntoConstraints = false
            categoryLineBarView.backgroundColor = category.color.rawValue
            self.addArrangedSubview(categoryLineBarView)
            
            // Calculate the whole width of StackView
            let relativeWidth = CGFloat((userData.totalAmountOfExpenses * userData.userCategories[index].amount) / 100)
            
            //Adding height and width constraints to each view
            categoryLineBarView.heightAnchor.constraint(equalToConstant: 32).isActive = true
            categoryLineBarView.widthAnchor.constraint(equalToConstant: relativeWidth).isActive = true
            
            //Adjusting cornerRadius
            if index == 0 {
                categoryLineBarView.layer.cornerRadius = 15
                categoryLineBarView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
            } else if index == userData.userCategories.count - 1 {
                categoryLineBarView.layer.cornerRadius = 15
                categoryLineBarView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
            }
        }
        
        // Configuring lineBarStackView
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fillProportionally
        self.spacing = 0
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
    }
}

#Preview {
    let lineBar = NDLineBarStackView()
    return lineBar
}
