//
//  RoundedImageView.swift
//  vk
//
//  Created by Sergey Tretyakov on 07.04.2020.
//  Copyright © 2020 sergeotretyakov. All rights reserved.
//

import UIKit

import UIKit

@IBDesignable
class RoundedImageView: UIView {
    @IBInspectable var image: UIImage? {
        didSet {
            updateImageView()
        }
    }
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        imageView.layer.borderWidth = 0.1
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(frame: CGRect, image: UIImage) {
        self.image = image
        super.init(frame: frame)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureImageView()
    }
    
    private func configureImageView() {
        backgroundColor = .clear
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        
        layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        layer.shadowOffset = CGSize(width: 2, height: 4)
        layer.shadowOpacity = 0.9
        layer.shadowRadius = 1.5
    }
    
    private func updateImageView() {
        imageView.image = image
        setNeedsDisplay()
    }
}
