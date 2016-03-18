
import UIKit

class MediaViewerInfoOverlayView: UIView {
    func defaultHeight() -> CGFloat {
        return 0.0
    }
}

class MediaViewerContentsView: UIView {
    
    // MARK: properties
        
    var backgroundView: UIView!
    var closeButton: UIButton!
    var interactiveImageView: MediaViewerInteractiveImageView!
    
    var overlayView: MediaViewerInfoOverlayView?

    // MARK: init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UIView
    
    // MARK: public
    
    // MARK: private
    
    private func setupView() {
        setupBackgroundView()
        setupInterActiveImageView()
        setupCloseButton()
        setupOverlayView()
        backgroundColor = UIColor.clearColor()
    }
    
    private func setupInterActiveImageView() {
        interactiveImageView = MediaViewerInteractiveImageView(frame: CGRectMake(0,0,100,100))
        interactiveImageView.alpha = 0.0
        addSubviewAndFullScreenConstraints(interactiveImageView)
    }
    
    private func setupBackgroundView() {
        backgroundView = UIView()
        backgroundView.alpha = 0.0
        backgroundView.backgroundColor = UIColor.blackColor()
        addSubviewAndFullScreenConstraints(backgroundView)
    }
    
    private func setupOverlayView() {
        overlayView = MediaViewerAuthorInfoOverlayView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        overlayView!.alpha = 0.0
        overlayView!.translatesAutoresizingMaskIntoConstraints = false
        addSubview(overlayView!)
//        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("[closeButton(66)]-20-|", options: NSLayoutFormatOptions.AlignAllLeft, metrics: nil, views: ["closeButton" : closeButton]))
//        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[closeButton(33)]", options: NSLayoutFormatOptions.AlignAllLeft, metrics: nil, views: ["closeButton" : closeButton]))
    }
    
    private func setupCloseButton() {
        closeButton = UIButton(type: UIButtonType.RoundedRect)
        closeButton.alpha = 0.0
        closeButton.setTitle(NSLocalizedString("Done", comment: ""), forState: UIControlState.Normal)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.backgroundColor = UIColor.blackColor()
        closeButton.layer.borderColor = UIColor.whiteColor().CGColor
        closeButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        closeButton.layer.cornerRadius = 2.0
        closeButton.layer.borderWidth = 1.0
        addSubview(closeButton)
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("[closeButton(66)]-20-|", options: NSLayoutFormatOptions.AlignAllLeft, metrics: nil, views: ["closeButton" : closeButton]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[closeButton(33)]", options: NSLayoutFormatOptions.AlignAllLeft, metrics: nil, views: ["closeButton" : closeButton]))
    }
}