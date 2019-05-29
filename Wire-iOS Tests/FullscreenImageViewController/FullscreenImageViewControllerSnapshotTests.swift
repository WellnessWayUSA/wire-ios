//
// Wire
// Copyright (C) 2018 Wire Swiss GmbH
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see http://www.gnu.org/licenses/.
//


import XCTest
@testable import Wire

final class FullscreenImageViewControllerSnapshotTests: ZMSnapshotTestCase {
    
    var sut: FullscreenImageViewController!

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testThatAnimatedGIFToImageView(){///TODO: failed
        sut = createFullscreenImageViewControllerForTest(imageFileName: "animated.gif")

        verify(view: sut.view)
    }


    func testThatGIFToImageView(){///TODO: failed
        sut = createFullscreenImageViewControllerForTest(imageFileName: "not_animated.gif")

        verify(view: sut.view)
    }

    func testThatVeryLargeImageIsLoadedToImageView(){///TODO: failed
        sut = createFullscreenImageViewControllerForTest(imageFileName: "20000x20000.gif")

        verify(view: sut.view)
    }

    func testThatSmallImageIsCenteredInTheScreen(){
        sut = createFullscreenImageViewControllerForTest(imageFileName: "unsplash_matterhorn_small_size.jpg")

        verify(view: sut.view)
    }

    func testThatSmallImageIsScaledToFitTheScreenAfterDoubleTapped(){
        // GIVEN
        sut = createFullscreenImageViewControllerForTest(imageFileName: "unsplash_matterhorn_small_size.jpg")

        // WHEN
        doubleTap(fullscreenImageViewController: sut)

        // THEN
        verify(view: sut.view)
    }
}
