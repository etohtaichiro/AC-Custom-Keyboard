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

        let height: CGFloat = 200.0
        let constraintH = NSLayoutConstraint(item: self.view, attribute: .height,
                                             relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,
                                             multiplier: 1.0, constant: height)
        constraintH.priority = UILayoutPriority(rawValue: 990)
        self.view.addConstraints([constraintH])
    }

    func createInterface() {
        let mainStackView = UIStackView(frame: .zero)
        mainStackView.axis = .vertical
        mainStackView.alignment = .center
        mainStackView.distribution = .fill
        mainStackView.spacing = 5
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainStackView)

        // 1行目
        let stackView1 = createHolizontalStackView()
        for button in createButtons(titles: ["i", "ɪ", "e", "ə", "ɛ", "ɜ", "u", "ʊ", "o", "ɔ"]) {
            stackView1.addArrangedSubview(button)
        }
        mainStackView.addArrangedSubview(stackView1)

        // 2行目
        let stackView2 = createHolizontalStackView()
        for button in createButtons(titles: ["æ", "ʌ", "ɑ", "ɒ", "p", "b", "t", "d", "ʧ", "ʤ"]) {
            stackView2.addArrangedSubview(button)
        }
        mainStackView.addArrangedSubview(stackView2)

        // 3行目
        let stackView3 = createHolizontalStackView()
        for button in createButtons(titles: ["f", "v", "θ", "ð", "s", "z", "ʃ", "ʒ", "k", "g"]) {
            stackView3.addArrangedSubview(button)
        }
        mainStackView.addArrangedSubview(stackView3)

        // 4行目
        let stackView4 = createHolizontalStackView()
        for button in createButtons(titles: ["m", "n", "ŋ", "h", "l", "r", "w", "j"]) {
            stackView4.addArrangedSubview(button)
        }
        mainStackView.addArrangedSubview(stackView4)

        // 5行目
        let stackView5 = createHolizontalStackView()
        for button in createButtons(titles: ["↑", "🌐", "<sp>", "ː", "◌̀", "◌́", "<cr>", "<bs>"]) {
            stackView5.addArrangedSubview(button)
        }
        mainStackView.addArrangedSubview(stackView5)

    }

    func createHolizontalStackView() -> UIStackView {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
