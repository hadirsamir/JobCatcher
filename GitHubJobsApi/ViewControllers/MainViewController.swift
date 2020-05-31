//
//  ViewController.swift
//  GitHubJobsApi
//
//  Created by Hadir Samir on 5/16/20.
//  Copyright © 2020 Hadir Samir. All rights reserved.
//

import UIKit

class MainViewController: UICollectionViewController,UISearchBarDelegate {
//MARK:- propertties
    var cellId = "searchCellId"
   var searchController = UISearchController(searchResultsController: nil)
   var locationSearchBar = UISearchBar()
   let citySearchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.white
        self.title = "GitHub Job Search"
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        setupSearchBar()
        // Do any additional setup after loading the view.
    }
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupSearchBar(){
        
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        searchController.searchBar.delegate = self
        let textfieldSearchBar = searchController.searchBar.value(forKey: "searchField") as? UITextField
        textfieldSearchBar?.textColor = .black
        textfieldSearchBar?.placeholder = "Position"
        searchController.view.addSubview(citySearchBar)
        citySearchBar.frame = CGRect(x: 10, y: searchController.searchBar.frame.height + 20, width: view.frame.size.width - 30, height: 50)
        searchController.view.backgroundColor = .lightGray
        citySearchBar.placeholder = "Location"
        citySearchBar.delegate = self
        citySearchBar.layer.cornerRadius = 12
        
    }
    
}
extension MainViewController : UICollectionViewDelegateFlowLayout{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchCollectionViewCell
        cell.layer.cornerRadius = 12
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: 180)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 1.0, bottom: 10, right: 1)
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailController = JobDetailsViewController()
        navigationController?.pushViewController(detailController, animated: true)
    }
}
