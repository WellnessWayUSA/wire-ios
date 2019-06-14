// Wire
// Copyright (C) 2019 Wire Swiss GmbH
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

import Foundation

extension ZClientViewController: ZMUserObserver {
    public func userDidChange(_ changeInfo: UserChangeInfo) {
        if changeInfo.legalHoldStatusChanged  {
            notifyAboutLegalHoldStatusIfNeeded(for: ZMUser.selfUser())
        }

        if changeInfo.accentColorValueChanged {
            UIApplication.shared.keyWindow?.tintColor = UIColor.accent()
        }
    }

    @objc func notifyAboutLegalHoldStatusIfNeeded(for user: ZMUser) {
        guard user.needsToAcknowledgeLegalHoldStatus else {
            return
        }

        switch user.legalHoldStatus {
        case .enabled:
            // show legal hold is now enabled
            break

        case .disabled:
            // presentLegalHoldDeactivatedAlert()

        case .pending(let request):
            presentLegalHoldLegalHoldRequestAlert(for: user, request: request)
        }
    }

    private func presentLegalHoldLegalHoldRequestAlert(for user: ZMUser, request: LegalHoldRequest) {
        presentLegalHoldActivationAlert(for: request, user: user)

    }

    @objc func setupUserChangeInfoObserver() {
        guard let userSession = ZMUserSession.shared() else { return }
        userObserverToken = UserChangeInfo.add(userObserver:self, for: ZMUser.selfUser(), userSession: userSession)
    }

}
