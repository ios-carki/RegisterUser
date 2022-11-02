//
//  LoginView.swift
//  RegisterUser
//
//  Created by Carki on 2022/11/02.
//

import UIKit

import SnapKit

class LoginView: BaseView {
    
    let profileImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .green
        return view
    }()
    
    let nickNameLable: UILabel = {
        let view = UILabel()
        view.text = "닉네임"
        view.backgroundColor = .brown
        return view
    }()
    
    let idLable: UILabel = {
        let view = UILabel()
        view.text = "아이디(이메일 형식"
        view.backgroundColor = .cyan
        return view
    }()
    
    override func configureUI() {
        [profileImage, nickNameLable, idLable].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
        
        profileImage.snp.makeConstraints { make in
            make.bottom.equalTo(nickNameLable.snp.top).offset(-40)
            make.centerX.equalToSuperview()
            make.size.equalTo(200)
        }
        
        nickNameLable.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(30)
        }
        
        idLable.snp.makeConstraints { make in
            make.top.equalTo(nickNameLable.snp.bottom).offset(40)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(nickNameLable.snp.height)
        }
    }
    
}
