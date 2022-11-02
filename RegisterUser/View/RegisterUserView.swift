//
//  RegisterUserView.swift
//  RegisterUser
//
//  Created by Carki on 2022/11/02.
//

import UIKit

import SnapKit

class RegisterUserView: BaseView {
    
    let nameTextField: UITextField = {
        let view = UITextField()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = .white
        view.placeholder = "닉네임을 입력해주세요"
        return view
    }()
    
    let idTextField: UITextField = {
        let view = UITextField()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = .white
        view.placeholder = "이메일을 입력해주세요"
        return view
    }()
    
    let passwordTextField: UITextField = {
        let view = UITextField()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = .white
        view.placeholder = "비밀번호를 입력해주세요"
        return view
    }()
    
    let submitButton: UIButton = {
        let view = UIButton()
        view.setTitle("등록하기", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = .white
        return view
    }()
    
    let signUpButton: UIButton = {
        let view = UIButton()
        view.setTitle("로그인", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = .white
        return view
    }()
    
    override func configureUI() {
        [nameTextField, idTextField, passwordTextField, submitButton, signUpButton].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(45)
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(40)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(45)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(40)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(45)
        }
        
        submitButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(40)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(60)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(60)
        }
        
        
    }
}
