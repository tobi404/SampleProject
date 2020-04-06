//
//  BottomControls.swift
//  SlideUpBar
//
//  Created by Beka Demuradze on 2/29/20.
//  Copyright © 2020 Beka Demuradze. All rights reserved.
//

import UIKit

class BottomControls: UIStackView {
    
    static func createButton(image: UIImage, text: String) -> UIStackView {
        let button = UIButton(type: .system)
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.tintColor = .systemPink
        let label = UILabel()
        label.text = text
        label.textColor = .systemPink
        let stackView = UIStackView(arrangedSubviews: [button,label])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = -40
        return stackView
    }
    
    let homeButton = createButton(image: UIImage(named: "Home")!, text: "Home")
    let userButton = createButton(image: UIImage(named: "User")!, text: "User")
    let bookmarksButton = createButton(image: UIImage(named: "Save")!, text: "Bookmark")
    let favouriteButton = createButton(image: UIImage(named: "Love")!, text: "Favourite")

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        distribution = .fillEqually
        
        heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        [homeButton, userButton, bookmarksButton, favouriteButton].forEach { (btn) in
            addArrangedSubview(btn)
        }
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
