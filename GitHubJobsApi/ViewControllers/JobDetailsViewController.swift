//
//  JobDetailsViewController.swift
//  GitHubJobsApi
//
//  Created by Hadir Samir on 5/17/20.
//  Copyright © 2020 Hadir Samir. All rights reserved.
//

import UIKit
import SafariServices

class JobDetailsViewController: UIViewController {
    // properties
    var companyUrl = "https://www.google.com/"
    var applyURL = ""
    var htmlText = "<h2><strong>About the position</strong></h2>\n<p>You love web application development and you enjoy seeing businesses grow. You've been in the business for a few years now. You’ve done the whole startup thing and you're ready to find something a little more meaty. Working as one of many developers isn't appealing to you anymore and the commute to San Francisco isn't doing it for you either. You're ready to be part of a team, and you want to own the product vision. You love making great things used by people, not just creating code, but contributing and leading projects to success.</p>\n<p>Helio has shown 20% quarter over quarter sales growth, and we need a senior engineer to shape and grow <a href=\"http://helio.app/\">our Helio platform</a>. Specifically we’re looking for a full stack engineer (Front-end -&gt; Ruby on Rails -&gt; Networking/AWS) who wants to own the vision. We're looking for a driven individual to push development forward, work with our active and passionate customers, and take Helio to the next level.</p>\n<p><strong>Who we are</strong></p>\n<p>We're a team of driven product designers who believe in rapid prototyping, researching on the fly and teaching people how to make better products. We've been around since 1998, creating world-class products that hundreds of millions of people actually use. We believe Design, with a capital \"D\", can change the world, and we’re making it happen. You’ll have the opportunity to build better products that solve problems and meet our customers needs.</p>\n<p>We want to change the way people create products and services to bring behavioral data into everyday creative decisions.</p>\n<p><strong>What Your Day Will Look Like</strong></p>\n<p>Working closely with the team, you’ll spend time planning and developing on the roadmap. Some days you’ll be working on a new feature. Other days you will be deep into code, addressing architecture or fixing a tricky bug. All the while, working with the team to galvanize the momentum we’ve created with our customers.</p>\n<p>You’ll work with our awesome team to learn Progressive Design — ZURB’s flagship design process — and how it applies to Helio. At the end of the day, you'll find that you are more than just a developer, you’re working with a world-class design organization, helping millions of people design for people and making a difference in the product community -- and that's pretty awesome.</p>\n<h3><strong>What You Bring To The Table</strong></h3>\n<ul>\n<li>5-10 years of development experience working in a startup, independent contractor, or similar environment.</li>\n<li>Should be comfortable in the full stack (Front-end -&gt; Ruby on Rails -&gt; Networking/AWS). You’ll need a solid grasp of Ruby on Rails.</li>\n<li>Very comfortable with SQL (We use PostgreSQL and MySQL).</li>\n<li>Very comfortable with at least one modern front-end framework (React, VueJS, Angular). We use VueJS and AngularJS as well as Stimulus.</li>\n<li>Should be familiar with common software design patterns (observer pattern, facade pattern) .</li>\n<li>Should be familiar with server security updates, <a href=\"https://www.ruby-lang.org/en/\">Ruby security patches</a>, and support third party audits.</li>\n<li>Familiarity with AWS (EC2/RDS/VPC/IAM/etc).</li>\n<li>Familiarity with video encoding and prototyping tools.</li>\n<li>Familiarity with CI/CD (Continuous Integration/Continuous Deploy), we use CircleCI.</li>\n<li>Familiarity with generating financial reports, participant payouts and dealing with GDPR requests for removal.</li>\n</ul>\n<h3><strong>Other skills we’re looking for</strong></h3>\n<ul>\n<li>Natural sense of curiosity, and maintains a strong point of view. You enjoy sharing your ideas and listening to the ideas of your teammates. You write well.</li>\n<li>Experience delivering solid products over and over again.</li>\n<li>An enthusiasm for coaching and teaching people on our team.</li>\n</ul>\n<h3><strong>A little more about us</strong></h3>\n<p>ZURB is a close-knit product design team based in Campbell, CA. We've been around since 1998, have helped more than 500 startups design some kick-ass online products and created many of our own products, like Foundation. Our customers range from large, well-known companies (Netflix, Hulu, eBay, Samsung, Mozilla, Facebook, Columbia) to start-ups. They all came to us because of our reputation for delivering killer ideas that work.</p>\n"
    var pinch = UIPinchGestureRecognizer()
    //outlets
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
        btn.tag = 0
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 15
        btn.addTarget(self, action: #selector(openLink), for: .touchUpInside)
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
        descpTextView.backgroundColor = UIColor(named: "textViewBackground")
        descpTextView.isEditable = false
        descpTextView.layer.cornerRadius = 12
        
        
        return descpTextView
    }()
    
    let applyButton : UIButton = {
        
        let btn = UIButton(type: .system)
        btn.tag = 1
        btn.setTitle("Apply", for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 15
        btn.addTarget(self, action: #selector(openApplyLink), for: .touchUpInside)
        
        return btn
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor =  UIColor(named: "backgroundColor")
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
        descriptionTextView.attributedText = convertHtml(attributedString: &descriptionTextView.attributedText, htmlText)
        pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchText))
        descriptionTextView.addGestureRecognizer(pinch)
     
    }
    

    @objc func openLink(sender : UIButton){
        if companyUrl == "" {
            let alertVC = UIAlertController(title: "", message: "Link is not available!", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertVC,animated: true)
        }
        guard let url = URL(string: companyUrl) else {
            return
        }
        let safariVC = SFSafariViewController(url:url)
        self.present(safariVC,animated: true)
    }
    @objc func openApplyLink(){
           if applyURL == "" {
               let alertVC = UIAlertController(title: "", message: "Link is not available!", preferredStyle: .alert)
               alertVC.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertVC,animated: true)
           }
           guard let url = URL(string: applyURL) else {
               return
           }
           let safariVC = SFSafariViewController(url:url)
           self.present(safariVC,animated: true)
       }
    func convertHtml (attributedString: inout NSAttributedString,_ text: String) -> NSAttributedString{
        let data = Data(text.utf8)
        let options : [NSAttributedString.DocumentReadingOptionKey:Any] = [.documentType:NSAttributedString.DocumentType.html,.characterEncoding:String.Encoding.utf8.rawValue]
        
        if let attributrdText = try? NSMutableAttributedString(data: data, options: options, documentAttributes: nil){
            attributedString = attributrdText
            return attributrdText
        }
        return attributedString
    }
    @objc func pinchText(sender: UIPinchGestureRecognizer){
        var pointSize = descriptionTextView.font?.pointSize
        pointSize = ((sender.velocity > 0) ? 1 : -1 ) * 1 + pointSize!
        descriptionTextView.font = UIFont(name: "arial", size: (pointSize)!)
        
    }

}
