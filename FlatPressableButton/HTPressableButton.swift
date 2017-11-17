//
//  HTPressableButton.swift
//  FlatPressableButton
//
//  Created by Priyanka Pote on 16/11/17.
//  Copyright © 2017 VamshiKrishna. All rights reserved.
//

import UIKit

enum HTPressableButtonStyle : Int {
    case rect
    case rounded
    case circular
}
class HTPressableButton: UIButton {
    
    var buttonColor: UIColor?
    var shadowColor: UIColor?
    var shadowHeight: CGFloat = 0.0
    var cornerRadius: CGFloat = 0.0
    var disabledButtonColor: UIColor?
    var disabledShadowColor: UIColor?
    var titleFont: UIFont?
    var style:HTPressableButtonStyle?
    
    // MARK: - Init
    convenience override init(frame: CGRect) {
        self.init(frame: frame, buttonStyle: HTPressableButtonStyle.rounded)
    }
    
    init(frame: CGRect, buttonStyle style: HTPressableButtonStyle) {
        super.init(frame: frame)
        setDefaultShadowHeightFor(style)
        setStyle(style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set according to button state
    func setHighlighted(_ highlighted: Bool) {
        if highlighted {
            if style == HTPressableButtonStyle.circular {
                super.titleEdgeInsets = UIEdgeInsetsMake(0, 0, -((shadowHeight / 4) * Constants.HTShadowOffsetWhenPressed), 0)
                super.imageEdgeInsets = UIEdgeInsetsMake(0, 0, -((shadowHeight / 4) * Constants.HTShadowOffsetWhenPressed), 0)
            }
            else {
                super.titleEdgeInsets = UIEdgeInsetsMake(0, 0, -(shadowHeight * Constants.HTShadowOffsetWhenPressed), 0)
                super.imageEdgeInsets = UIEdgeInsetsMake(0, 0, -(shadowHeight * Constants.HTShadowOffsetWhenPressed), 0)
            }
        }
        else {
            super.titleEdgeInsets = UIEdgeInsetsMake(0, 0, shadowHeight, 0)
            super.imageEdgeInsets = UIEdgeInsetsMake(0, 0, shadowHeight, 0)
        }
        setHighlighted(highlighted)
        
    }
    
    func setEnabled(_ enabled: Bool) {
        setEnabled(enabled)

        if !enabled {
            var buttonDisabled: UIImage?
            if style == HTPressableButtonStyle.circular {
                buttonDisabled = UIImage.ht_circularButton(with: disabledButtonColorOrDefault(), size: frame.size, shadowHeight: shadowHeight, shadowColor: disabledShadowColorOrDefault(), cornerRadius: cornerRadius)
            }
            else {
                buttonDisabled = UIImage.ht_button(with: disabledShadowColorOrDefault(), size: frame.size, shadowHeight: shadowHeight, shadowColor: disabledShadowColorOrDefault(), cornerRadius: cornerRadius)
                
            }
            setBackgroundImage(buttonDisabled, for: .disabled)
        }
    }
    
    // MARK: - Set Button Style
    func setButtonColor(_ buttonColor: UIColor) {
        self.buttonColor = buttonColor
        createButton()
    }
    
    func setshadowColor(_ shadowColor: UIColor) {
        self.shadowColor = shadowColor
        createButton()
    }
    
    func setShadowHeight(_ shadowHeight: CGFloat) {
        self.shadowHeight = shadowHeight
        super.titleEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, shadowHeight, 0.0)
        super.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, shadowHeight, 0.0)
        createButton()
    }
    
    func setStyle(_ style: HTPressableButtonStyle) {
        self.style = style
        switch style {
        case HTPressableButtonStyle.rect:
            cornerRadius = 0.0
        case HTPressableButtonStyle.rounded:
            cornerRadius = 10.0
        case HTPressableButtonStyle.circular:
            cornerRadius = frame.size.height / 2
            clipsToBounds = true
        }
        createButton()
    }
    
    func setDisabledButtonColor(_ disabledButtonColor: UIColor) {
        self.disabledButtonColor = disabledButtonColor
        createButton()
    }
    
    func setDisabledShadowColor(_ disabledShadowColor: UIColor) {
        self.disabledShadowColor = disabledShadowColor
        createButton()
    }
    
    func setCornerRadius (_ cornerRadius: CGFloat){
        self.cornerRadius = cornerRadius
        createButton()
    }
    
    func setTitleFont(_ titleFont: UIFont){
        self.titleFont = titleFont
        createButton()
    }
    
    // MARK: - Create Button
    func createButton() {
        titleLabel?.font = titleFontOrDefault()
        var buttonNormal: UIImage?
        var buttonHighlighted: UIImage?
        if style == HTPressableButtonStyle.circular {
            buttonNormal = UIImage.ht_circularButton(with: buttonColorOrDefault(), size: frame.size, shadowHeight: shadowHeight, shadowColor: shadowColorOrDefault(), cornerRadius: cornerRadius)
            buttonHighlighted = UIImage.ht_circularButton(withHighlightedColor: buttonColorOrDefault(), size: frame.size, shadowHeight: shadowHeight, shadowColor: shadowColorOrDefault(), cornerRadius: cornerRadius)
        }
        else{
            // Rectangular or rounded-corner buttons
            buttonNormal = UIImage.ht_button(with: buttonColorOrDefault(), size: frame.size, shadowHeight: shadowHeight, shadowColor: shadowColorOrDefault(), cornerRadius: cornerRadius)
            buttonHighlighted = UIImage.ht_button(withHighlightedColor: buttonColorOrDefault(), size: frame.size, shadowHeight: shadowHeight, shadowColor: shadowColorOrDefault(), cornerRadius: cornerRadius)
        }
        setBackgroundImage(buttonNormal, for: .normal)
        setBackgroundImage(buttonHighlighted, for: .highlighted)
    }
    
    
    
    // MARK: - Set Button Default Style
    func buttonColorOrDefault() -> UIColor {
        return buttonColor ?? UIColor.ht_belizeHoleColor()
    }
    
    func shadowColorOrDefault() -> UIColor {
        return shadowColor ?? UIColor.ht_orangeColor()
    }
    
    func disabledButtonColorOrDefault() -> UIColor {
        return disabledButtonColor ?? UIColor.ht_cloudsColor()
    }
    
    func disabledShadowColorOrDefault() -> UIColor {
        return disabledShadowColor ?? UIColor.ht_midnightBlue()
    }
    
    func titleFontOrDefault() -> UIFont {
        return titleFont ?? UIFont(name: "Avenir", size: 18)!
    }
    
    func setDefaultShadowHeightFor(_ style: HTPressableButtonStyle) {
        if style == HTPressableButtonStyle.circular {
            shadowHeight = frame.size.height * Constants.HTShadowCircularDefaultHeightPercentage
        }
        else {
            shadowHeight = frame.size.height * Constants.HTShadowDefaultHeightPercentage
        }
        super.titleEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, shadowHeight, 0.0)
        super.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, shadowHeight, 0.0)
    }
    
    
    
    
}
