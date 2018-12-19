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

import UIKit

extension UIViewController {

    /// Returns whether the view controller can be dismissed.
    var canBeDismissed: Bool {
        return self.presentingViewController?.presentedViewController == self
            || (navigationController != nil && navigationController?.presentingViewController?.presentedViewController == navigationController)
    }

    /// Dismisses the view controller if needed before performing the specified actions.
    func dismissIfNeeded(animated: Bool, completion: (() -> Void)? = nil) {
        if canBeDismissed {
            dismiss(animated: animated, completion: completion)
        } else {
            completion?()
        }
    }

}
