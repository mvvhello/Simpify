//
//  NDTextField.swift
//  Nomaday
//
//  Created by Vlad on 10/03/2024.
//

import UIKit

class NDTextField: UITextField {
    
    private let padding = UIEdgeInsets(top: 8, left: 13, bottom: 8, right: 6)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func borderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.x -= padding.right
        return rect
    }

    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .left
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        
        textAlignment = .natural
        
//        leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: 10, height: self.frame.height))
//        leftViewMode = .always
    }
    
    func showAndHidePassword() {
        if self.isSecureTextEntry == true {
//            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 5, height: self.bounds.height))
            let button = UIButton(type: .custom)
            button.setImage(UIImage(systemName: "eye"), for: .normal)
            button.setImage(UIImage(systemName: "eye.slash"), for: .selected)
            button.addTarget(self, action: #selector(toggleInvisibility(_:)), for: .touchUpInside)
            
            rightView = button
            rightViewMode = .whileEditing
        }
    }
    
    @objc private func toggleInvisibility(_ sender: UIButton) {
        sender.isSelected.toggle()
        self.isSecureTextEntry.toggle()
    }
}
