import XCTest
@testable import H19MediaViewer
import Nimble

class MediaViewerImageTests: XCTestCase {

    var sut: MediaViewerImage!

    override func setUp() {
        super.setUp()
        sut = MediaViewerImage()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testThatItHasDefaultInfoOverlayViewClass() {
        expect(self.sut.infoOverlayViewClass) === MediaViewerInfoOverlayView.self
    }

    func testThatItInitsWithImage() {
        let image = UIImage()
        sut = MediaViewerImage(image: image)

        expect(self.sut.image) === image
    }

    func testThatItInitsWithImageURL() {
        let imageURL = URL(fileURLWithPath: "some")

        sut = MediaViewerImage(imageURL: imageURL as URL)

        expect(self.sut.imageURL) == imageURL
    }

    func testThatItInitsWithSourceImageView() {
        let imageView = UIImageView()
        sut = MediaViewerImage(image: UIImage(), sourceImageView: imageView)

        expect(self.sut.sourceImageView) === imageView
    }

    func testThatItInitsWithImageAndImageURL() {
        let imageURL = URL(fileURLWithPath: "some")
        let image = UIImage()

        sut = MediaViewerImage(image:image, imageURL:imageURL as URL)

        expect(self.sut.image) == image
        expect(self.sut.imageURL) == imageURL
    }

    func testThatItInitsWithImageAndImageURLAndOverlayViewClass() {
        let imageURL = NSURL(fileURLWithPath: "some")
        let image = UIImage()

        sut = MediaViewerImage(image:image, imageURL:imageURL as URL, infoOverlayViewClass: MediaViewerAuthorInfoOverlayView.self)

        expect(self.sut.infoOverlayViewClass) === MediaViewerAuthorInfoOverlayView.self
    }
}
