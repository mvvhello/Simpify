//
//  NDHeaderView.swift
//  Simpify
//
//  Created by Vlad on 09/04/2024.
//

import UIKit

final class NDHeaderView: UIStackView {
    
    let dateLabel = UILabel()
    let amountLabel = UILabel()
    let amountBar = NDLineBarStackView()
        
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        // NDHeaderView configuring
        self.translatesAutoresizingMaskIntoConstraints = false
                
        //Labels configuring
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.numberOfLines = 1
        dateLabel.font = UIFont.boldSystemFont(ofSize: 28)
        dateLabel.textColor = UIColor.label
        dateLabel.text = "April 2024"
        
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.numberOfLines = 1
        amountLabel.font = UIFont.boldSystemFont(ofSize: 48)
        amountLabel.textColor = UIColor.label
        //TODO: Solve this architecture problem with data passing through different ViewControllers
        amountLabel.text = "$ " + String(amountBar.userData.totalAmountOfExpenses)
        
        //HeaderStackView configuring
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.distribution = .fill
        self.alignment = .fill
        self.spacing = 8
        //headerStackView.isLayoutMarginsRelativeArrangement = true
        
        self.addArrangedSubview(dateLabel)
        self.addArrangedSubview(amountLabel)
        self.addArrangedSubview(amountBar)
        
        // Spacing between arrangedSubviews
        self.setCustomSpacing(28, after: amountLabel)
    }
}

#Preview {
    let header = NDHeaderView()
    return header
}
