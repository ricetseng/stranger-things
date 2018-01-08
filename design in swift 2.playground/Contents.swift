//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport



class MyViewController : UIViewController {
    
    
    let titleLabel = UILabel()
    let contentImageView = UIImageView()
    let descriptionLabel = UILabel()
    let descriptionLabelTwo = UILabel()
    let bgImageView = UIImageView()
    let maskImageView = UIImageView()
    let cardView = UIView()
    let closeButton = UIButton()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.05442025512, green: 0.08850190789, blue: 0.2161169648, alpha: 1) //by typr color Literal
        
        
        // Title setup
        titleLabel.frame = CGRect(x: 16, y: 12, width: 272, height: 38)
        titleLabel.text = "01. Story"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        // Avatar and content setup
        
        contentImageView.frame = CGRect(x: 16, y: 220, width: 268, height: 36)
        contentImageView.image = UIImage(named: "card_content@2x.png")
        contentImageView.contentMode = .scaleAspectFill

       
        // First story content setup
        let stringValue = "When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces and one strange little girl."
        let attrString = NSMutableAttributedString(string: stringValue)
        let style = NSMutableParagraphStyle()
        descriptionLabel.frame = CGRect(x: 16, y: 50, width: 268, height: 120)
        descriptionLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 10
        style.lineSpacing = 8 // change line spacing between paragraph like 36 or 48
        style.minimumLineHeight = 0 // change line spacing between each line like 30 or 40
        
        // Line spacing attribute
        attrString.addAttribute(NSAttributedStringKey.paragraphStyle, value: style, range: NSRange(location: 0, length: stringValue.characters.count))
        
        // Character spacing attribute
        attrString.addAttribute(NSAttributedStringKey.kern, value: 0, range: NSMakeRange(0, attrString.length))
        
        descriptionLabel.attributedText = attrString
        
        
        // Second story content setup
        let stringValueTwo = "Stranger Things is an American science fiction-horror web television series created, written, directed and co-executive produced by The Duffer Brothers, as well as co-executive produced by Shawn Levy and Dan Cohen."
        let attrStringTwo = NSMutableAttributedString(string: stringValueTwo)
        let styleTwo = NSMutableParagraphStyle()
        descriptionLabelTwo.frame = CGRect(x: 16, y: 175, width: 268, height: 120)
        descriptionLabelTwo.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        descriptionLabelTwo.textColor = .white
        descriptionLabelTwo.numberOfLines = 10
        styleTwo.lineSpacing = 8 // change line spacing between paragraph like 36 or 48
        styleTwo.minimumLineHeight = 0 // change line spacing between each line like 30 or 40
        
        // Line spacing attribute
        attrStringTwo.addAttribute(NSAttributedStringKey.paragraphStyle, value: styleTwo, range: NSRange(location: 0, length: stringValueTwo.characters.count))
        
        // Character spacing attribute
        attrStringTwo.addAttribute(NSAttributedStringKey.kern, value: 0, range: NSMakeRange(0, attrStringTwo.length))
        
        descriptionLabelTwo.attributedText = attrStringTwo
        descriptionLabelTwo.alpha = 0
        
        
        // Background image setup
        bgImageView.frame = CGRect(x: 0, y: 0, width: 375, height: 667)
        bgImageView.image = #imageLiteral(resourceName: "stranger@2x.png")
        bgImageView.contentMode = .scaleAspectFill
        
        
        // mask image setup
        maskImageView.frame = CGRect(x: 0, y: 0, width: 375, height: 667)
        maskImageView.image = #imageLiteral(resourceName: "mask@2x.png")
        maskImageView.contentMode = .scaleAspectFill
        maskImageView.alpha = 0
        
        
        
        // Card view setup
        cardView.frame = CGRect(x: 16, y: 368, width: 300, height: 280)
        cardView.backgroundColor = #colorLiteral(red: 0.09009670466, green: 0.1595661044, blue: 0.3166589141, alpha: 1)
        cardView.layer.cornerRadius = 10
        cardView.layer.shadowOpacity = 0.12
        cardView.layer.shadowOffset = CGSize (width: 0, height: 22)
        cardView.layer.shadowRadius = 16
        
        
        // Close button setup
        closeButton.frame = CGRect(x: 331, y: 30, width: 28, height: 28)
        closeButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4)
        closeButton.layer.cornerRadius = 14
        closeButton.setImage(#imageLiteral(resourceName: "cross_btn@2x.png"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        closeButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(cardViewTapped))
        cardView.addGestureRecognizer(tap)
        cardView.isUserInteractionEnabled = true
        
        view.addSubview(bgImageView)
        view.addSubview(maskImageView)
        view.addSubview(cardView)
        view.addSubview(closeButton)
        cardView.addSubview(titleLabel)
        cardView.addSubview(contentImageView)
        cardView.addSubview(descriptionLabel)
        cardView.addSubview(descriptionLabelTwo)
        
        self.view = view
        
    }
    
    @objc func closeButtonTapped() {
        let animator = UIViewPropertyAnimator(duration: 0.7, dampingRatio: 0.8) {
            self.descriptionLabelTwo.alpha = 0
        }
//        let animator = UIViewPropertyAnimator(duration: 0.7, curve: UIViewAnimationCurve.easeInOut) {
//            self.descriptionLabelTwo.alpha = 0
//        }
        let animatorDelay = UIViewPropertyAnimator(duration: 0.7, dampingRatio: 0.8) {
            self.cardView.frame = CGRect(x: 16, y: 368, width: 300, height: 280)
            self.contentImageView.frame = CGRect (x: 16, y: 220, width: 268, height: 36)
            self.maskImageView.alpha = 0
            self.closeButton.frame = CGRect(x: 331, y: 30, width: 28, height: 28)
            self.closeButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }
        animator.startAnimation()
        animatorDelay.startAnimation(afterDelay: 0.2)
    }
    @objc func cardViewTapped(){
        //insert sth when user tapped card view
        let animator = UIViewPropertyAnimator(duration: 0.7, dampingRatio: 0.8) {
            // End state
            self.cardView.frame = CGRect(x: 32, y: 106, width: 311, height: 455)
            self.contentImageView.frame = CGRect (x: 14, y: 400, width: 268, height: 36)
            self.maskImageView.alpha = 1
            self.closeButton.frame = CGRect(x: 295, y: 125, width: 28, height: 28)
            self.closeButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
        }
        let animatorDelay = UIViewPropertyAnimator(duration: 0.7, dampingRatio: 0.8) {
            self.descriptionLabelTwo.alpha = 1
        }
        animator.startAnimation()
        animatorDelay.startAnimation(afterDelay: 0.2)
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
