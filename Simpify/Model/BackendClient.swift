//
//  BackendClient.swift
//  Simpify
//
//  Created by Vlad on 12/04/2024.
//

import Foundation

class BackendClient{
    func getCategories(clientId: String) -> Array<NDCategoryButton> {
        // request GET
        let fake1 = NDCategoryButton(categoryName: "Rent", buttonBackgroundColor: .systemBlue)
        let fake2 = NDCategoryButton(categoryName: "Cafe", buttonBackgroundColor: .systemMint)
        return [fake1, fake2]
    }
}
