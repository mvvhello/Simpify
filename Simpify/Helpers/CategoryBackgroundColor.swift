//
//  CategoryBackgroundColor.swift
//  Simpify
//
//  Created by Vlad on 07/04/2024.
//

import Foundation
import UIKit

enum CategoryBackgroundColor {
    case systemRed
    case systemGreen
    case systemYellow
    case systemBlue
    case systemIndigo
    case systemOrange
    case systemPink
    case systemPurple
    case systemTeal
    case systemBrown
    case systemGray
    case systemMint
    
    var rawValue: UIColor {
        switch self {
            
        case .systemRed:
            return UIColor.systemRed
        case .systemGreen:
            return UIColor.systemGreen
        case .systemYellow:
            return UIColor.systemYellow
        case .systemBlue:
            return UIColor.systemBlue
        case .systemIndigo:
            return UIColor.systemIndigo
        case .systemOrange:
            return UIColor.systemOrange
        case .systemPink:
            return UIColor.systemPink
        case .systemPurple:
            return UIColor.systemPurple
        case .systemTeal:
            return UIColor.systemTeal
        case .systemBrown:
            return UIColor.systemBrown
        case .systemGray:
            return UIColor.systemGray
        case .systemMint:
            return UIColor.systemMint
        }
    }
}
