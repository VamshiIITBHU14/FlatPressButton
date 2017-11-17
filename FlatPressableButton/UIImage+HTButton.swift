//
//  UIImage+HTButton.swift
//  FlatPressableButton
//
//  Created by Priyanka Pote on 16/11/17.
//  Copyright © 2017 VamshiKrishna. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    static let HTShadowDefaultHeightPercentage:CGFloat = 0.17
    static let HTShadowCircularDefaultHeightPercentage:CGFloat = HTShadowDefaultHeightPercentage * 0.6
    static let HTShadowOffsetWhenPressed:CGFloat = 0.7;
}

extension UIImage{
    class func ht_button(with buttonColor: UIColor, size: CGSize, shadowHeight: CGFloat, shadowColor: UIColor, cornerRadius: CGFloat) -> UIImage {
        var buttonImage: UIImage?
        //button color
        let frontImage = UIImage.ht_image(with: buttonColor, size: size, cornerRadius: cornerRadius)
        //button's shadow color
        let backImage = UIImage.ht_image(with: shadowColor, size: size, cornerRadius: cornerRadius)
        let rect = CGRect(x: 0, y: 0, width: backImage.size.width, height: backImage.size.height + shadowHeight)
        //Draw button's shadow first (behind) a little lower
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        backImage.draw(at: CGPoint(x: 0, y: shadowHeight))
        frontImage.draw(at: CGPoint(x: 0, y: 0))
        buttonImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return buttonImage!
    }
    
    class func ht_button(withHighlightedColor buttonColor: UIColor, size: CGSize, shadowHeight: CGFloat, shadowColor: UIColor, cornerRadius: CGFloat) -> UIImage {
        var buttonHighlightedImage: UIImage?
        let frontImage = UIImage.ht_image(with: buttonColor, size: size, cornerRadius: cornerRadius)
        let backImage = UIImage.ht_image(with: shadowColor, size: size, cornerRadius: cornerRadius)
        let rect = CGRect(x: 0, y: 0, width: frontImage.size.width, height: frontImage.size.height + shadowHeight)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        backImage.draw(at: CGPoint(x: 0, y: shadowHeight))
        frontImage.draw(at: CGPoint(x: 0, y: shadowHeight * Constants.HTShadowOffsetWhenPressed))
        buttonHighlightedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return buttonHighlightedImage!
    }
    class func ht_circularButton(with buttonColor: UIColor, size: CGSize, shadowHeight: CGFloat, shadowColor: UIColor, cornerRadius: CGFloat) -> UIImage {
        var buttonImage: UIImage?
        let frontImage = UIImage.ht_image(with: buttonColor, size: size, cornerRadius: cornerRadius)
        let backImage = UIImage.ht_image(with: shadowColor, size: size, cornerRadius: cornerRadius)
        //Make the rectangular a little bigger than the button
        let rect = CGRect(x: 0, y: 0, width: backImage.size.width + shadowHeight + (shadowHeight / 2), height: backImage.size.height + shadowHeight + (shadowHeight / 2))
        //Both images are moved away from the borders to show the circular shape (round)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        backImage.draw(at: CGPoint(x: (shadowHeight / 2) + 2.5, y: shadowHeight))
        frontImage.draw(at: CGPoint(x: (shadowHeight / 2) + 2.5, y: shadowHeight / 4))
        buttonImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return buttonImage!
    }
    

    class func ht_circularButton(withHighlightedColor buttonColor: UIColor, size: CGSize, shadowHeight: CGFloat, shadowColor: UIColor, cornerRadius: CGFloat) -> UIImage {
        var buttonHighlightedImage: UIImage?
        let frontImage = UIImage.ht_image(with: buttonColor, size: size, cornerRadius: cornerRadius)
        let backImage = UIImage.ht_image(with: shadowColor, size: size, cornerRadius: cornerRadius)
        let rect = CGRect(x: 0, y: 0, width: frontImage.size.width + shadowHeight + (shadowHeight / 2), height: frontImage.size.height + shadowHeight + (shadowHeight / 2))
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        backImage.draw(at: CGPoint(x: (shadowHeight / 2) + 2.5, y: shadowHeight))
        frontImage.draw(at: CGPoint(x: (shadowHeight / 2) + 2.5, y: shadowHeight * Constants.HTShadowOffsetWhenPressed))
        buttonHighlightedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return buttonHighlightedImage!
        
    }

    class func ht_image(with color: UIColor, size: CGSize, cornerRadius: CGFloat) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        let context: CGContext? = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageView = UIImageView(image: image)
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, 0)
        UIBezierPath(roundedRect: imageView.bounds, cornerRadius: cornerRadius).addClip()
        image?.draw(in: imageView.bounds)
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imageView.image!
    }
}
