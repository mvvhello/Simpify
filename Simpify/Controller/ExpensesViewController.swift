//
//  ExpensesViewController2.swift
//  Simpify
//
//  Created by Vlad on 10/05/2024.
//

import UIKit

final class ExpensesViewController: UIViewController {

    let testHeader = NDHeaderView()
    let testButton = NDCategoryButton(categoryName: "Renfiewjfweojfowiejfoiewjfoijtfe", buttonBackgroundColor: .systemBlue)
    let test2Button = NDCategoryButton(categoryName: "Cafe", buttonBackgroundColor: .systemMint)
    var buttonsStackView = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonsStackView.addArrangedSubview(testButton)
        buttonsStackView.addArrangedSubview(test2Button)
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.axis = .horizontal
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.alignment = .fill
        buttonsStackView.spacing = 8
        
        view.addSubview(testHeader)
        view.addSubview(buttonsStackView)
        
        view.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            testHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            testHeader.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            testHeader.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: testHeader.bottomAnchor, constant: 16),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
    
    
}

#Preview {
    let vc = ExpensesViewController()
    return vc
}
