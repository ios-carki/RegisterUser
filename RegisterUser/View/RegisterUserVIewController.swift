//
//  RegisterUserVIewController.swift
//  RegisterUser
//
//  Created by Carki on 2022/11/02.
//

import UIKit

import Toast

final class RegisterUserVIewController: UIViewController {
    
    let mainView = RegisterUserView()
    let modelView = APIServiceModel()
    
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        naviSetting()
        submitButtonEvent()
        loginButtonEvent()
    }
    
    func naviSetting() {
        self.title = "회원가입"
    }
    
    func submitButtonEvent() {
        mainView.submitButton.addTarget(self, action: #selector(submitButtonClicked), for: .touchUpInside)
    }
    
    func checkLoginButtonCondition(condition: Bool) {
        
        if condition {
            self.mainView.signUpButton.isEnabled = true
            self.mainView.signUpButton.backgroundColor = .white
            self.mainView.signUpButton.setTitleColor(.black, for: .normal)
        } else {
            self.mainView.signUpButton.isEnabled = false
            self.mainView.signUpButton.backgroundColor = .gray
            self.mainView.signUpButton.setTitleColor(.lightGray, for: .normal)
        }
        
    }
    
    @objc func submitButtonClicked() {
        guard let userID = mainView.nameTextField.text else { return }
        guard let userEmail = mainView.idTextField.text else { return }
        guard let userPW = mainView.passwordTextField.text else { return }
        let vc = LoginViewController()
        
        modelView.signup(name: userID, email: userEmail, password: userPW) { code in
            if 200 <= code && code < 300 {
                self.mainView.makeToast("사용 가능한 아이디 입니다.")
                self.checkLoginButtonCondition(condition: true)
            } else {
                self.mainView.makeToast("올바르지 않은 회원가입 속성입니다.\n(비밀번호는 최소 8글자 이상이여야 합니다)")
            }
        }
        print(userID)
        print(userEmail)
        print(userPW)
    }
    
    func loginButtonEvent() {
        checkLoginButtonCondition(condition: false)
        mainView.signUpButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
    }
    
    @objc func loginButtonClicked() {
        modelView.login(userEmail: mainView.idTextField.text ?? "이메일 오류", userPassword: mainView.passwordTextField.text ?? "비밀번호 오류")
        
        let vc = LoginViewController()
        let nav = UINavigationController(rootViewController: vc)
        
        UserDefaults.standard.set(true, forKey: "oldUser")
        
        //navigationController?.pushViewController(vc, animated: true)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true)
        
    }
}
