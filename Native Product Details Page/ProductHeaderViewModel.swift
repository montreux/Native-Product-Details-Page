//
//  ProductHeaderViewModel.swift
//  Native Product Details Page
//
//  Created by John Holcroft on 22/10/2015.
//  Copyright © 2015 Marks and Spencer. All rights reserved.
//

import Foundation

struct ProductHeaderViewModel {
    
    let productImages: [ProductImage]
    let brand: String
    let name: String
    let price: String
    
    init(product:MSProduct) {
        self.productImages = product.images
        self.brand = product.brand
        self.name = product.name
        self.price = product.priceSummary.description
    }
}

class ProductHeaderView: UIView {
    
    func sutupFromModel(productHeaderModel: ProductHeaderViewModel) {
        
        if let firstImage = productHeaderModel.productImages.first {
            if let imageUrl = NSURL(string: firstImage.normal) {
                self.productImageView.setImageWithURL(imageUrl)
            }
        }
        self.brandLabel.text = productHeaderModel.brand
        self.productNameLabel.text = productHeaderModel.name
        self.productPriceLabel.text = productHeaderModel.price
    }
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
}