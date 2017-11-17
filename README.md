# FlatPressButton
Flat design clickable buttons. All code written in latest Swift4 syntax.
Concept taken from https://famolus.com with code written in Swift4.
Easy to use. Just drag and drop HTPressableButton.Swift, UIColor+HTColor.Swift, UIImage+HTButton.Swift, you are done.

You can add buttons with different styles (Rounded edges, Rectanular edges, Circular button) with

       var frame = CGRect(x: 30, y: 150, width: 260, height: 50)
        let rectButton = HTPressableButton(frame: frame, buttonStyle: HTPressableButtonStyle.rect)
        rectButton.buttonColor = UIColor.ht_alizarinColor()
        rectButton.shadowColor = UIColor.ht_pumpkinColor()
        rectButton.setTitle("Rect", for: .normal)
        view.addSubview(rectButton)
