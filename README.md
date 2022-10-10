# LoginForm

ios 앱에서 로그인 구현하기

<div>
    <span>
        <img src="https://user-images.githubusercontent.com/75922558/194800000-e755f72e-a1b5-4ba1-a2bc-77fe9641f27e.png" width="180"/>
    </span>
    <span>
        <img src="https://user-images.githubusercontent.com/75922558/194800003-3f45b468-960f-4682-beab-e8ab71204852.png" width="180"/>
    </span>
    <span>
        <img src="https://user-images.githubusercontent.com/75922558/194800010-0aa42ae8-be7d-4c7e-b514-6fd3b0fa2490.png" width="180"/>
    </span>
    <span>
        <img src="https://user-images.githubusercontent.com/75922558/194800011-366d415c-c77f-46f7-93e9-0433411bba3e.png" width="180"/>
    </span>
    <span>
        <img src="https://user-images.githubusercontent.com/75922558/194800013-44dae101-c1ee-4c36-8bbe-176a82396dc7.png" width="180"/>
    </span>
    <span>
        <img src="https://user-images.githubusercontent.com/75922558/194800014-5a0a3821-edee-4087-ad45-77754d1a5fdf.png" width="180"/>
    </span>
</div>

<br/>

## 📋 구현 요소

- 아이디, 비밀번호 Validation 체크

  ```txt
  ⭐️ 정규 표현식 사용
  ```

  ```Swift
  // 이메일 형식 체크
  func isValidEmail(value: String) -> Bool {
  	let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
  	let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)

  	return emailTest.evaluate(with: value)
  }

  // 전화번호 형식 체크
  func isValidPhone(value: String) -> Bool {
  	let PHONE_REGEX = #"[0-9]{3}\-[0-9]{4}\-[0-9]{4}"#
  	let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)

  	return phoneTest.evaluate(with: value)
  }

  // 이메일 형식이거나 전화번호 형식일때 true 반환
  func isValidId(value: String) -> Bool {
  	return isValidEmail(value: value) || isValidPhone(value: value)
  }

  // 비밀번호 체크
  // 숫자+문자 8자리~20자리
  func isValidPassword(value: String) -> Bool {
  	let passwordRegEx =  ("(?=.*[A-Za-z])(?=.*[0-9]).{8,20}")
  	let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)

  	return passwordTest.evaluate(with: value)
  }
  ```

  참고 : https://stackoverflow.com/questions/27998409/email-phone-validation-in-swift

    <br/>

  ```txt
  ⭐️ 정의해 놓은 함수를 UITextFieldDelegate 프로토콜의 textFieldDidEndEditing 메서드 안에서 사용하여 validation 관련 ui를 구현함
  ```

  ```Swift
  func textFieldDidEndEditing(_ textField: UITextField) {
    // MARK: 아이디 valid 체크
  	if textField == emailTextField {
  		guard let id = textField.text else { return }

  		if isValidId(value: id) {
  			emailValidationLabel.textColor = .green
  			emailValidationLabel.text = "올바른 형식입니다."
  		} else {
  			emailValidationLabel.textColor = .red
  			emailValidationLabel.text = "올바른 이메일 또는 전화번호 형식이 아닙니다."
  		}
  	}

  	// MARK: 비밀번호 valid 체크
  	if textField == passwordTextField {
  		guard let pw = textField.text else { return }

  		if isValidPassword(value: pw) {
  			passwordValidationLabel.textColor = .green
  			passwordValidationLabel.text = "올바른 형식입니다."
  		} else {
  			passwordValidationLabel.textColor = .red
  			passwordValidationLabel.text = "숫자+문자 포함해서 8~20글자 사이로 입력하세요."
  		}
  	}
  }
  ```

    <br/>

- 얼럿창 구현

  ```txt
  ⭐️ 스위프트의 UIAlertController 사용
  ```

  ```Swift
    let alert = UIAlertController(title: "로그인 되었습니다", message: nil, preferredStyle: .alert)

  	let success = UIAlertAction(title: "확인", style: .default)

  	alert.addAction(success)

  	present(alert, animated: true)
  ```

  <br/>

- 텍스트필드에 값 입력시 ui 스타일 변경

  ```txt
  ⭐️ UITextFieldDelegate 프로토콜을 채택하여, textFieldDidBeginEditing 과 textFieldDidEndEditing 메서드를 활용하여 구현함
  ```

  ```Swift
  func textFieldDidBeginEditing(_ textField: UITextField) {
    // 이메일 텍스트필드에 입력할 경우
  	if textField == emailTextField {
  		emailTextFieldView.backgroundColor = .gray
  		emailInfoLabel.font = .systemFont(ofSize: 11)
  		emailInfoLabelCenterYConstraint.constant = -13
  	}

    // 비밀번호 텍스트필드에 입력할 경우
  	if textField == passwordTextField {
  		passwordTextFieldView.backgroundColor = .gray
  		passwordInfoLabel.font = .systemFont(ofSize: 11)
  		passwordInfoLabelCenterYConstraint.constant = -13
  	}

    // constraint 변경시 애니메이션 효과 처리
  	UIView.animate(withDuration: 0.3) {
  		self.view.layoutIfNeeded()
  	}
  }
  ```

  <br/>

- 로그인 버튼 활성화

  ```txt
    ⭐️ 아이디와 비밀번호 모두 입력되어 있고, 입력된 값이 정규표현식에 맞는 경우에만 로그인 버튼이 활성화된다.
  ```

  ```Swift
  guard let email = emailTextField.text, !email.isEmpty, isValidId(value: email), let password = passwordTextField.text, !password.isEmpty, isValidPassword(value: password) else {
    loginButton.backgroundColor = .clear
    loginButton.isEnabled = false
    return
  }

  loginButton.backgroundColor = .red
  loginButton.isEnabled = true
  ```

 <br/>

- 비밀번호 표시/숨김 구현

  ```txt
    ⭐️ UITextField의 속성중 isSecureTextEntry를 toggle 시켜준다.
  ```

  ```Swift
  passwordTextField.isSecureTextEntry.toggle()
  ```
