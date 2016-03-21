
import UIKit

class MediaViewerInfoOverlayView: UIView {
    func defaultHeight() -> CGFloat {
        return 0.0
    }
}

class MediaViewerContentsView: UIView {
    
    // MARK: properties
    
    var interfaceAlpha: CGFloat = 0.0 {
        didSet {
            backgroundView.alpha = interfaceAlpha
            closeButton.alpha = interfaceAlpha
            if let overlayView = overlayView {
                overlayView.alpha = interfaceAlpha
            }
        }
    }

    var interactiveImageView: MediaViewerInteractiveImageView!

    var backgroundView: UIView!
    var closeButton: UIButton!
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
        interfaceAlpha = 0.0
    }
    
    private func setupInterActiveImageView() {
        interactiveImageView = MediaViewerInteractiveImageView(frame: CGRectMake(0,0,100,100))
        interactiveImageView.alpha = 0.0
        addSubviewAndFullScreenConstraints(interactiveImageView)
    }
    
    private func setupBackgroundView() {
        backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.blackColor()
        addSubviewAndFullScreenConstraints(backgroundView)
    }
    
    private func setupOverlayView() {
        overlayView = MediaViewerAuthorInfoOverlayView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        overlayView!.translatesAutoresizingMaskIntoConstraints = false
        addSubview(overlayView!)
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[overlayView]|", options: NSLayoutFormatOptions.AlignAllLeft, metrics: nil, views: ["overlayView" : overlayView!]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[overlayView(height)]|", options: NSLayoutFormatOptions.AlignAllLeft, metrics: ["height": overlayView!.defaultHeight()], views: ["overlayView" : overlayView!]))
    }
    
    private func setupCloseButton() {
        closeButton = UIButton(type: UIButtonType.RoundedRect)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.1)
        closeButton.layer.borderColor = UIColor.whiteColor().CGColor
        closeButton.layer.cornerRadius = 6.0
        closeButton.tintColor = UIColor.whiteColor()
        closeButton.setImage(UIImage(named: "button-close-white"), forState: .Normal)
        addSubview(closeButton)
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("[closeButton(36)]-9-|", options: NSLayoutFormatOptions.AlignAllLeft, metrics: nil, views: ["closeButton" : closeButton]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-12-[closeButton(36)]", options: NSLayoutFormatOptions.AlignAllLeft, metrics: nil, views: ["closeButton" : closeButton]))
    }
    
}
