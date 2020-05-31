//
//  JobDetailsViewController.swift
//  GitHubJobsApi
//
//  Created by Hadir Samir on 5/17/20.
//  Copyright © 2020 Hadir Samir. All rights reserved.
//

import UIKit

class JobDetailsViewController: UIViewController {
  var jobImage = AspectFitImageView(image: UIImage(named: "github"),cornerRadius: 12)
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
    let urlButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("visit company's website", for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 15
        
        return btn
    }()
    
    let locationLabel : UILabel = {
       let companyLabel = UILabel()
        companyLabel.text = "Location"
        companyLabel.font = .boldSystemFont(ofSize: 16)
        companyLabel.numberOfLines = 0
        companyLabel.textColor = .label // responsive to dark mode
        return companyLabel
    }()
    
    let descriptionTextView : UITextView = {
        let descpTextView = UITextView()
        descpTextView.font  = .systemFont(ofSize: 14)
        descpTextView.textAlignment = .left
        descpTextView.backgroundColor = .cyan
        descpTextView.isEditable = false
        descpTextView.layer.cornerRadius = 12
        descpTextView.text = "jjdoeodowedweklfjlwkjflefeofieiehoheufeiugfiugfgdiugiugfiuegiuegfiegiegifgeigfiegfigeigfiegieiugeiufieugfiefiueigfyeg"
        
        return descpTextView
    }()
    
    let applyButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("visit company's website", for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 15
        
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(jobImage)
        jobImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10), size: .init(width: 80, height: 100))
        let stackView = UIStackView(arrangedSubviews: [companyTitle,titleLabel,locationLabel,urlButton])
        view.addSubview(stackView)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: jobImage.leadingAnchor, padding: .init(top: 10, left: 20, bottom: 20, right: 20))
        stackView.axis = .vertical
        stackView.spacing = 10
        view.addSubview(descriptionTextView)
        descriptionTextView.anchor(top: stackView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 10, left: 20, bottom: 20, right: 20))
        view.addSubview(applyButton)
        applyButton.anchor(top: descriptionTextView.bottomAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 10, left: 70, bottom: 30, right: 70))
        
     
    }
    

    

}
