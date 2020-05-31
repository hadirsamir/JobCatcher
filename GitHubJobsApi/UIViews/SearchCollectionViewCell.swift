//
//  SearchCollectionViewCell.swift
//  GitHubJobsApi
//
//  Created by Hadir Samir on 5/16/20.
//  Copyright © 2020 Hadir Samir. All rights reserved.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    let logoImageView : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 5
        iv.image = UIImage(named: "github")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let companyTitle : UILabel = {
       let companyLabel = UILabel()
        companyLabel.text = "CompanyName"
        companyLabel.font = .boldSystemFont(ofSize: 16)
        companyLabel.numberOfLines = 0
        companyLabel.textColor = .label // responsive to dark mode
        return companyLabel
    }()
    let titleLabel : UILabel = {
          let companyLabel = UILabel()
           companyLabel.text = "iOSDeveloper"
           companyLabel.font = .boldSystemFont(ofSize: 16)
           companyLabel.numberOfLines = 0
           companyLabel.textColor = .label // responsive to dark mode
           return companyLabel
       }()
    let locationLabel : UILabel = {
       let companyLabel = UILabel()
        companyLabel.text = "Location"
        companyLabel.font = .boldSystemFont(ofSize: 16)
        companyLabel.numberOfLines = 0
        companyLabel.textColor = .label // responsive to dark mode
        return companyLabel
    }()
    
    
    override init(frame:CGRect){
        super.init(frame: frame)
        self.backgroundColor = .red
        self.addSubview(logoImageView)
        logoImageView.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left:10 , bottom: 0, right: 10), size: .init(width: 80, height: 100))
        let labelsStackView = UIStackView(arrangedSubviews:[companyTitle,titleLabel,locationLabel])
        self.addSubview(labelsStackView)
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 10
        labelsStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: logoImageView.leadingAnchor, padding: .init(top: 10, left:20 , bottom: 0, right: 20), size: .init(width: 80, height: 100))
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

