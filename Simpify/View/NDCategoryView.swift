//
//  NDCategoryView.swift
//  Simpify
//
//  Created by Vlad on 03/04/2024.
//

import UIKit

final class NDCategoryView: UIView {
    
    var title = UILabel()
    var subTitle = UILabel()
    let settingsButton = UIImageView()
    var userCategory = Category()
    
    
    // TODO: make choice of background colours only from system colours (and not white). Now user can pick any from UIColor
    init(categoryName: String, buttonBackgroundColor: UIColor) {
        super.init(frame: CGRect(x: 0, y: 0, width: 176, height: 104))
        userCategory.name = categoryName
        self.backgroundColor = buttonBackgroundColor
        configure()
        categoryButtonGestureRecognizer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        addSubview(title)
        addSubview(settingsButton)
        addSubview(subTitle)
        
        // cornerRadius of NDCategoryButton
        self.layer.cornerRadius = 20
        
        // Configuring title
        title.text = userCategory.name
        title.textColor = .white
        title.textAlignment = .left
        title.numberOfLines = 2
        title.lineBreakMode = .byTruncatingTail
        //title.adjustsFontSizeToFitWidth = true
        //title.minimumScaleFactor = 0.8
        title.font = UIFont.preferredFont(forTextStyle: .title2)
        self.addSubview(title)
        
        // Configuring settingsButton
        settingsButton.image = UIImage(systemName: "gearshape.fill")
        settingsButton.contentMode = .right
        settingsButton.tintColor = .white
        
        
        // Configuration of subtitle
        subTitle.text = String(Int(userCategory.expenses))
        subTitle.textColor = .white
        subTitle.textAlignment = .right
        subTitle.numberOfLines = 1
        subTitle.adjustsFontSizeToFitWidth = true
        subTitle.minimumScaleFactor = 0.7
        subTitle.font = UIFont.preferredFont(forTextStyle: .title1)
        
        //Enable Auto Layout for everything? Should I do it for everything or only for the main view?
        self.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Auto Layout of button's elements
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 7),
            title.widthAnchor.constraint(equalToConstant: 120),
            title.heightAnchor.constraint(greaterThanOrEqualToConstant: 44)
        ])
                
        NSLayoutConstraint.activate([
            settingsButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            settingsButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            settingsButton.leadingAnchor.constraint(equalTo: title.trailingAnchor, constant: 4)
        ])
        
        NSLayoutConstraint.activate([
            subTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            subTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            subTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12)
        ])
        
    }
    
//    // settingsButton configuring function
//    private func settingsButtonConfigure() -> UIButton.Configuration {
//        var settingsButtonConfig = UIButton.Configuration.plain()
//        settingsButtonConfig.image = UIImage(systemName: "gearshape.fill")
//        settingsButtonConfig.imagePlacement = .all
//        settingsButtonConfig.contentInsets = .zero
//        settingsButtonConfig.buttonSize = .medium
//        settingsButtonConfig.baseForegroundColor = .white
//        settingsButtonConfig.background.edgesAddingLayoutMarginsToBackgroundInsets = .all
//        
//        return settingsButtonConfig
//    }
    
    // Tap gesture for category button
    private func categoryButtonGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(categoryButtonTap(_:)))
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
                UIView.animate(withDuration: 0.2) {
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
    let button = NDCategoryView(categoryName: "Rent", buttonBackgroundColor: .systemBlue)
    return button
}

