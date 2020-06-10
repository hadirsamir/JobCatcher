//
//  ErrorMessage.swift
//  GitHubJobsApi
//
//  Created by Hadir Samir on 6/6/20.
//  Copyright © 2020 Hadir Samir. All rights reserved.
//

import Foundation
enum ErrorMessage : String,Error{
    case invalidData = "Sorry. Something went wrong!, try again later"
    case invalidResponse = "Server Error. please modify your search and try again !"

}
