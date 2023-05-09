//
//  Constants.swift
//  Salek
//
//  Created by Divo Ayman on 4/22/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import Foundation
struct URLs {
    static let base = "http://ide-hospital.ideaeg.co/api/"
    static let mainCategories = "main_categories"
    static let getDoctors = "favorites/doctors"
    static let deleteDoctor = "favorites/doctors"
    static let userAppointments = "user_appointments"
    static let nursing = "nursing_requests"
    static let addDoctor = "favorites/doctors"
    static let saveUser = "register"
    static let login = "login"
    static let resetPass = "forget_password"
    static let voucher = "vouchers"
    static let addComment = "doctors"
}
struct HeaderKeys {
    static let acceptLanguage = "en"
    static let Authorization = "Authorization"
    static let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiODRhMGNmMDkxMzA1NDk5YTkxMTBiMWFmNzY3NWRiZDU0NzE5Y2E0NGI2YjliYTkwNmU0Zjg0ZmZjZjcwNDcyZjY2MmVlZGZmMmYyMGUxMzkiLCJpYXQiOjE2MDk3ODI2NzIsIm5iZiI6MTYwOTc4MjY3MiwiZXhwIjoxNjQxMzE4NjcyLCJzdWIiOiIxNTEiLCJzY29wZXMiOltdfQ.dNUYsej7eeLtVM25I9ZWBZVQNqsZYgYCrvenTDtm-l2rUKN5hmALSd6x6sYLW-XsDg0nB9AB3ch1cMK6FL-q28vYeeFeZjt428R6w6jftlLfK5KVijl3bDiUhWEcdFctFpaJ6MyhCjcrNBLnZ_5ahvOqr-s9D1vRbVocBqDLFwuvmys8hBM327swrYudS0i9eO5wYeof2LmNGSU_4i6f6ZuGvOB7u_UGxzu-PZ59_aHpGjleZquSK00YLzqVjo8oIpM86DaJjHFDaBcKnnZr2cHHx37W64T_pLCxusCqhH6KxQZEWe3iqQlJrTdWTiBSXoKPL3v_9ZZLxvt6N7JKv-dsVtMx1iqewy4lHRv2WBBPox5xGuRZfKum94ySEij1q3R4F1l_XzQhoYjnib0nw0sOqNvrCJ3y58Ok8igTCJ69kn-OlgXZ5dEXax2A4G9suHzUNY91skbT13YJqVikYE7Po9BxWT_mtB92Sb9DzCAssizrHBpXg_cRbCeyqm7jcga1PCjBLywDJJfJI0di561C_cqODqWtr97MjwWJWmKBhUz5ZH6jIMDqKzUuDKNvp5AZ6Is_3ypgTGWXe-HiKwPzXLtZSpq0Q2JeySEOWmIkxPsDp3Oifefg-tNqW2h3dPM22vrJmOl6xZDts9gmSaedIfMqgy8NFdXxX4ANv7k"
}
struct ParameterKeys {
    static let email = "email"
    static let mobile = "mobile"
    static let name = "name"
    static let message = "message"
    static let main_category_id = "main_category_id"
    static let page = "page"
    static let per_page = "per_page"
    static let specialty_id = "specialty_id"
    static let city_id = "city_id"
    static let region_id = "region_id"
    static let order_by = "order_by"
    static let pass = "password"
    static let doctor_id = "doctor_id"
    static let rating = "rating"
    static let comment = "comment"
 //   static let
}

// MARK:- Storyboards
struct Storyboards {
    static let main = "Main"
    static let Search = "Search"
    static let Favourite = "Favourite"
    static let Appointment = "Appointment"
    static let searchResult = "SearchResult"
    static let map = "Map"
    static let auth = "Auth"
    static let chooseAccount = "Choose"
    static let addComment = "AddComment"
    static let register = "PopAuth"
    static let forgetPassword = "ForgatePassword"
    static let resetPassword = "ResetPassword"
    
}

// View Controllers
struct ViewControllers {
    static let individual = "SignupIndividualVC"
    static let searchVC = "SearchVC"
    static let FavouriteVC = "FavouriteVC"
    static let signupWorkVC = "SignupWorkVC"
    static let mapVC = "MapVC"
    static let searchResultVC = "SearchResultVC"
    static let signUpVc = "SignUpVC"
    static let signInVC = "SignInVC"
    static let forgetPassword = "ForgetPasswordVC"
    static let signupStoreVC = "SignupStoreVC"
    static let chooseAccountVC = "ChooseAccountVC"
    static let verificationCodeVC = "VerificationCodeVC"
    static let resetPasswordVC = "ResetPasswordVC"
    
}
struct Cells {
    static let resultCell = "ResultCell"
    
}

// UserDefaultsKeys
struct UserDefaultsKeys {
    static let token = "UDKToken"
}

// Languages
struct Languages {
    static let english = "en"
    static let arabic = "ar"
}

// NotificationIn
struct NotificationIde {
    static let identifier = "my-morning-Notification"
   
}
