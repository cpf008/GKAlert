//
//  GKAlertMessageCode.swift
//  GKAlert
//
//  Created by GKiOS on 2018/1/19.
//  Copyright © 2018年 GKiOS. All rights reserved.
//

import UIKit

class GKAlertMessageCode: UIView, UITextFieldDelegate {

    private lazy var mainTitleLabel: UILabel = {
        let label = UILabel.init()
        label.textColor = UIColor.textLow
        label.font = UIFont.gk_textFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel.init()
        label.textColor = UIColor.textLow
        label.font = UIFont.gk_textFont(ofSize: 14)
        label.textAlignment = .center
        label.text = "请输入短信验证码"
        return label
    }()
    
    lazy var textField: UITextField = {
        let item = UITextField.init()
        item.textColor = UIColor.textLow
        item.font = UIFont.gk_textFont(ofSize: 14)
        var  style = NSMutableParagraphStyle.init()
        style.alignment = .center
        item.attributedPlaceholder = NSAttributedString.init(string: "请输入短信验证码", attributes:[NSAttributedStringKey.foregroundColor:UIColor.status1, NSAttributedStringKey.font:UIFont.gk_textFont(ofSize: 14), NSAttributedStringKey.paragraphStyle:style])
        item.textAlignment = .center
        item.keyboardType = UIKeyboardType.numberPad
        item.delegate = self
        return item
    }()
    
    private lazy var line: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.line
        return view
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        gk_AddSubViews()
        gk_CreateConstraints()
    }
    
    convenience init(_ title:String?) {
        self.init(frame: .zero)
        mainTitleLabel.text = title
    }
    
    convenience init(attributedTitle:NSAttributedString?) {
        self.init(frame: .zero)
        mainTitleLabel.attributedText = attributedTitle
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 约束 布局
    
    func gk_AddSubViews() {
        addSubview(mainTitleLabel)
        addSubview(subTitleLabel)
        addSubview(textField)
        addSubview(line)
    }
    
    func gk_CreateConstraints() {
        mainTitleLabel.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(mainTitleLabel.snp.bottom)
        }
        
        textField.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(subTitleLabel.snp.bottom).offset(34)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        line.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
    
    
        func textField(_ textField: UITextField,
                       shouldChangeCharactersIn range: NSRange,
                       replacementString string: String) -> Bool {
            
            let location = range.location
            if location <= 5 {
                 return true
            } else {
                return false
            }
        }
    
    
        deinit {
    
        }
    
        override func didMoveToSuperview() {
            super.didMoveToSuperview()
            if textField.isFirstResponder {
                textField.resignFirstResponder()
            } else {
                textField.becomeFirstResponder()
            }
        }

}
