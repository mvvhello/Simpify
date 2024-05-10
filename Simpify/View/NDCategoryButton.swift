//
//  NDCategoryButton2.swift
//  Simpify
//
//  Created by Vlad on 10/05/2024.
//

import UIKit

final class NDCategoryButton: UIView {
    
    var title = UILabel()
    var subTitle = UILabel()
    let settingsButton = UIButton(type: .system)
    var upperStackView = UIStackView()
    var userCategory = Category()
    
    init(categoryName: String, buttonBackgroundColor: CategoryBackgroundColor) {
        super.init(frame: .zero)
        userCategory.name = categoryName
        self.backgroundColor = buttonBackgroundColor.rawValue
        configure()
        categoryButtonGestureRecognizer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        // Adding views to the NDCategoryButton
        upperStackView.addArrangedSubview(title)
        upperStackView.addArrangedSubview(settingsButton)
        addSubview(upperStackView)
        addSubview(subTitle)
        
        // cornerRadius of NDCategoryButton
        self.layer.cornerRadius = 20
        
        // Configuring title
        title.text = userCategory.name
        title.textColor = .white
        title.textAlignment = .natural
        title.numberOfLines = 1
        title.lineBreakMode = .byTruncatingTail
        title.font = UIFont.preferredFont(forTextStyle: .title2)
        
        // Configuring settingsButton
        
//        settingsButton.configuration = settingsButtonConfigure()
        let image = UIImage(systemName: "gearshape.fill")
        settingsButton.setImage(image, for: .normal)
        settingsButton.tintColor = .white
        
        // Configuration of subtitle
        subTitle.text = String(Int(userCategory.amount))
        subTitle.textColor = .white
        subTitle.textAlignment = .right
        subTitle.numberOfLines = 1
        subTitle.adjustsFontSizeToFitWidth = true
        subTitle.minimumScaleFactor = 0.7
        subTitle.font = UIFont.preferredFont(forTextStyle: .title1)
        
        //Enable Auto Layout for everything? Should I do it for everything or only for the main view?
        self.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        upperStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Configuring upperStackView
        upperStackView.axis = .horizontal
        upperStackView.spacing = 4
        upperStackView.distribution = .fillProportionally
        upperStackView.alignment = .top
        
        // Auto Layout of button's elements

        NSLayoutConstraint.activate([
            settingsButton.widthAnchor.constraint(equalToConstant: 28),
            
            upperStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            upperStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            upperStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -9),
            
            subTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            subTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            subTitle.topAnchor.constraint(equalTo: upperStackView.bottomAnchor, constant: 16),
            subTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12)
        ])
    }
    
    // settingsButton configuring function
//    private func settingsButtonConfigure() -> UIButton.Configuration {
//        var settingsButtonConfig = UIButton.Configuration.plain()
//        settingsButtonConfig.image = UIImage(systemName: "gearshape.fill")
//        settingsButtonConfig.imagePlacement = .all
//        settingsButtonConfig.buttonSize = .medium
//        settingsButtonConfig.baseForegroundColor = .white
//        settingsButtonConfig.contentInsets = NSDirectionalEdgeInsets()
//
//        return settingsButtonConfig
//    }
//
    // Tap gesture for category button
    private func categoryButtonGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(categoryButtonTap(_:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    // Gesture functional and animation of tapping
    @objc private func categoryButtonTap (_ sender: UITapGestureRecognizer) {
        // Animation of tapping
        let animation = UIViewPropertyAnimator(duration: 0.2, curve: UIView.AnimationCurve.easeInOut)
        animation.addAnimations {
            self.alpha = 0.8
        }
        animation.addCompletion { position in
            if position == .end {
                UIView.animate(withDuration: 0.4) {
                    self.alpha = 1
                }
            }
        }
        animation.startAnimation()
        animation.stopAnimation(false)
        animation.finishAnimation(at: UIViewAnimatingPosition.end)
        
        //TODO: Gesture functional (opening CategoryViewController)
    }

}

#Preview {
    let button = NDCategoryButton(categoryName: "Rent", buttonBackgroundColor: .systemBlue)
    return button
    
//    let vc = ExpensesViewController()
//    return vc
}
