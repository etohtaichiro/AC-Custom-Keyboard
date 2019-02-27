//
//  KeyboardViewController.swift
//  AC Keyboard
//
//  Created by 江藤太一郎 on 2019/02/26.
//  Copyright © 2019 Taichiro Etoh. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!

    //  i   ɪ   e   ə   ɛ   ɜ   u   ʊ   o   ɔ
    //  æ   ʌ   ɑ   ɒ   p   b   t   d   ʧ   ʤ
    //  f   v   θ   ð   s   z    ʃ  ʒ   k   g
    //  m   n   ŋ   h   l   r   w   j
    //  ↑   🌐  <sp>    ː   ◌̀  ◌́    <cr>    <bs>

    // シフトした画面
    //  1   2   3   4   5   6   7   8   9   0
    //  +   -   /   ¥   :   ;   (   )   &
    //  .   ,   ?   !   '   <bs>
    //  🌐  ↑   <sp>    <cr>

    
    private let LATIN_SMALL_LETTER_AE = "æ"
    private let LATIN_SMALL_LETTER_OPEN_E = "ɛ"
    private let LATIN_LETTER_SMALL_CAPITAL_I = "ɪ"
    private let LATIN_SMALL_LETTER_I = "i"
    private let SMALL_LETTER_OPEN_O = "ɔ"
    private let SMALL_LETTER_ALPHA = "ɑ"
    private let SMALL_LETTER_TURNED_ALPHA = "ɒ"
    private let TURNED_V = "ʌ"
    private let REVERSED_OPEN_E = "ɜ"
    private let LATIN_SMALL_LETTER_SCHWA = "ə"
    private let MODIFIER_LETTER_TRIANGULAR_COLON = "ː"
    private let LATIN_SMALL_LETTER_UPSILON = "ʊ"
    private let COMBINING_GRAVE_ACCENT = "◌̀"
    private let COMBINING_ACUTE_ACCENT = "◌́"
    
    //var deleteBtn = UIButton(type: .system)
    //var keyboardView: UIView

    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)

        // following codes be moved in function viewDidApear()
        //self.view.addSubview(self.nextKeyboardButton)
        
        //self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        //self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        createInterface()
    }

    func createInterface() {
        tryStackView2()
    }

    func tryCurrent() {
        //let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        //view.backgroundColor = UIColor.white
        
        /// Instantiate StackView and configure it
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(stackView)
        //view.addSubview(stackView)
        
        /// Setup StackView's constraints to its superview
        view.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        
        /// Add subviews
        let switchh = UISwitch()
        switchh.isOn = true
        switchh.backgroundColor = UIColor.cyan
        stackView.addArrangedSubview(switchh)
        
        let label = UILabel()
        label.backgroundColor = UIColor.magenta
        label.text = "label"
        stackView.addArrangedSubview(label)
        
        let button = UIButton(type: .infoDark)
        button.backgroundColor = UIColor.yellow
        stackView.addArrangedSubview(button)
    }

    func tryStackView0() {
        // for AC Custom Keyboard
        //let buttonTitles = ["Q", "W", "E", "R", "T", "Y"]
        //let buttons = createButtons(titles: buttonTitles)
        //let topRow = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        
        //for button in buttons {
        //    topRow.addSubview(button)
        //}
        //self.view.addSubview(topRow)
        
        //addConstraints(buttons: buttons, containingView: topRow)
        
        //self.deleteBtn.translatesAutoresizingMaskIntoConstraints = false
        //deleteBtn.addTarget(self, action: #selector(self.deleteDown), for: .touchDown)
        //deleteBtn.addTarget(self, action: #selector(self.deleteUp), for: [.touchUpInside, .touchUpOutside])
        //self.view.addSubview(self.deleteBtn)
    }
    
    func tryStackView1() {
        // StackViewをつくる
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 8
        
        // StackViewに入れるサブビュー、部品を作る
        //let label = UILabel()
        //label.text = "ラベル"
        //label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        //label.translatesAutoresizingMaskIntoConstraints = false
        
        //let deleteButton = UIButton(type: UIButton.ButtonType.roundedRect)
        //deleteButton.setTitle("ボタン", for: UIControl.State.normal)
        //deleteButton.addTarget(self, action: Selector(("pushButton:")), for: UIControl.Event.touchUpInside)
        //deleteButton.translatesAutoresizingMaskIntoConstraints = false

        // StackViewにサブビューを追加
        //stack.addArrangedSubview(label)
        //stack.addArrangedSubview(deleteButton)

        // StackViewを画面など好きなところに
        self.view.addSubview(stack)
    }

    func tryStackView2() {
        // StackViewをつくる
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false

        // StackViewに入れるサブビュー、部品を作る
        let buttonTitles = ["Q", "W", "E", "R", "T", "Y", "E", "T", "O", "H"]
        let buttons = createButtons(titles: buttonTitles)
        
        // StackViewにサブビューを追加
        for button in buttons {
            stack.addArrangedSubview(button)
        }
        // StackViewを画面など好きなところに
        self.view.addSubview(stack)
    }

    func createButtons(titles: [String]) -> [UIButton] {
        var buttons = [UIButton]()
        for title in titles {
            let button = createLetterButton(title: title)
            buttons.append(button)
        }
        return buttons
    }

    func createLetterButton(title: String) -> UIButton {
        let button = UIButton(type: UIButton.ButtonType.system)

        button.setTitle(title, for: UIControl.State.normal)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        button.setTitleColor(UIColor.black, for: UIControl.State.normal)
        button.layer.cornerRadius = 3.0
        button.layer.masksToBounds = true

        button.addTarget(self, action: #selector(keyPressed(_:)), for: .touchUpInside)
        
        return button
    }

    //func addConstraints(buttons: [UIButton], containingView: UIView){
    //
    //    for (index, button) in zip(buttons.indices, buttons) {
    //
    //        let topConstraint = NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: containingView, attribute: .top, multiplier: 1.0, constant: 1)
    //
    //        let bottomConstraint = NSLayoutConstraint(item: button, attribute: .bottom, relatedBy: .equal, toItem: containingView, attribute: .bottom, multiplier: 1.0, constant: -1)
    //
    //        var leftConstraint : NSLayoutConstraint!
    //        if index == 0 {
    //
    //            leftConstraint = NSLayoutConstraint(item: button, attribute: .left, relatedBy: .equal, toItem: containingView, attribute: .left, multiplier: 1.0, constant: 1)
    //
    //        } else {
    //
    //            leftConstraint = NSLayoutConstraint(item: button, attribute: .left, relatedBy: .equal, toItem: buttons[index-1], attribute: .right, multiplier: 1.0, constant: 1)
    //
    //            let widthConstraint = NSLayoutConstraint(item: buttons[0], attribute: .width, relatedBy: .equal, toItem: button, attribute: .width, multiplier: 1.0, constant: 0)
    //
    //            containingView.addConstraint(widthConstraint)
    //        }
    //
    //        var rightConstraint : NSLayoutConstraint!
    //        if index == buttons.count - 1 {
    //
    //            rightConstraint = NSLayoutConstraint(item: button, attribute: .right, relatedBy: .equal, toItem: containingView, attribute: .right, multiplier: 1.0, constant: -1)
    //
    //        } else {
    //
    //            rightConstraint = NSLayoutConstraint(item: button, attribute: .right, relatedBy: .equal, toItem: buttons[index+1], attribute: .left, multiplier: 1.0, constant: -1)
    //
    //        }
    //
    //        containingView.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
    //    }
    //}

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //if (self.needsInputModeSwitchKey) {
        //    self.view.addSubview(self.nextKeyboardButton)
        //
        //    self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        //    self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        //}
    }

    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

    @objc func keyPressed(_ sender: UIButton) {
        let button = sender
        let title = button.title(for: UIControl.State.normal)
        self.textDocumentProxy.insertText(title!)
    }

    @objc func pushA() {
        self.textDocumentProxy.insertText("A")
    }

    @objc func delete() {
        self.textDocumentProxy.deleteBackward()
    }
    
    @objc func spacePressed(button: UIButton) {
        (textDocumentProxy as UIKeyInput).insertText(" ")
    }

    @objc func returnPressed(button: UIButton) {
        (textDocumentProxy as UIKeyInput).insertText("\n")
    }

    var deleteTimer: Timer?
    var deleteStartTime: Date!
    
    @objc func deleteDown() {
        let proxy = self.textDocumentProxy
        proxy.deleteBackward()
        deleteStartTime = Date()
        deleteTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
            let span: TimeInterval = timer.fireDate.timeIntervalSince(self.deleteStartTime!)
            if span > 0.4 {
                proxy.deleteBackward()
                //self.proxy.deleteBackward()
            }
        })
    }
    
    @objc func deleteUp() {
        deleteTimer?.invalidate()
    }

}
