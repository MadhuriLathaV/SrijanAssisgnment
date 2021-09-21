//
//  LoginViewModel.swift
//  Assignment
//
//  Created by Madhuri Latha Valluri on 20/09/21.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel {
  
  let usernameSubject = BehaviorRelay<String?>(value: "")
  let passwordSubject = BehaviorRelay<String?>(value: "")
  let disposeBag = DisposeBag()

  
  var isValidDataForm: Observable<Bool> {
    return Observable.combineLatest(usernameSubject, passwordSubject) {name, password
      in
      guard name != nil && password != nil else{
        return false
      }
      return name!.validateUsername() && password!.validatePassword()
    }
  }
  
  var isValidUsername: Observable<Bool> {
    return usernameSubject.map { $0!.validateUsername() }
  }
  
  var isValidPassword: Observable<Bool> {
    return passwordSubject.map { $0!.validatePassword() }
  }
}

extension String {
    func validateUsername() -> Bool {
        let usernameRegex = "[A-Z0-9a-z]{1,}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", usernameRegex)
        return predicate.evaluate(with: self)
    }
  
  func validatePassword() -> Bool {
//      let passwordRegex = "[A-Z0-9a-z@!?_]{5,}"
    let passwordRegex = "(?=^.{5,}$)(?=.*\\d)(?=.*[!@?_]+)(?=.*[A-Z])(?=.*[a-z]).*$"
      let predicate = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
      return predicate.evaluate(with: self)
  }
}
