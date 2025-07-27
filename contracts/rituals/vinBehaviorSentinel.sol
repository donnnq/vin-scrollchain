// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinBehaviorSentinel {
    struct Signal {
        uint256 lowIntentScore;
        bool highRiskFlag;
        bool hasHistory;
    }

    mapping(address => Signal) public pulse;

    uint256 public threshold = 20;

    function submitSignal(address _user, uint256 observedScore, bool knownHistory) public {
        pulse[_user].lowIntentScore += observedScore;
        pulse[_user].hasHistory = knownHistory;

        if (pulse[_user].lowIntentScore >= threshold && knownHistory) {
            pulse[_user].highRiskFlag = true;
        }
    }

    function checkStatus(address _user) public view returns (string memory) {
        Signal memory s = pulse[_user];

        if (s.highRiskFlag) {
            return "Compassion + caution: Support channels recommended.";
        } else if (s.lowIntentScore > 0) {
            return "Observed calmly. No action required yet.";
        }

        return "Clear pulse. Humanity intact.";
    }

    function overrideFlag(address _user) public {
        // Admin or community healing council can reset risk status
        pulse[_user].highRiskFlag = false;
    }
}
