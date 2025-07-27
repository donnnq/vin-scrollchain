// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinForwardProtocol {
    enum AttentionMode { PastAnalysis, PresentHealing, FutureGoals }

    struct NationalFocus {
        AttentionMode currentMode;
        uint256 timeSpentOnRetrospection;
        uint256 timeAllocatedToGoals;
        bool legacyReviewPaused;
    }

    mapping(string => NationalFocus) public nationState;

    event ModeShift(string nation, AttentionMode newMode);
    event GoalActivated(string nation, string initiative);

    function calibrateMode(string memory _nation, uint256 pastHours, uint256 goalHours) public {
        NationalFocus storage n = nationState[_nation];

        n.timeSpentOnRetrospection = pastHours;
        n.timeAllocatedToGoals = goalHours;

        if (goalHours >= pastHours * 2) {
            n.currentMode = AttentionMode.FutureGoals;
            n.legacyReviewPaused = true;
            emit ModeShift(_nation, AttentionMode.FutureGoals);
            emit GoalActivated(_nation, "Focus shifted to sustainable development and civic healing.");
        } else {
            n.currentMode = AttentionMode.PresentHealing;
            emit ModeShift(_nation, AttentionMode.PresentHealing);
        }
    }

    function getFocusStatus(string memory _nation) public view returns (string memory) {
        NationalFocus memory n = nationState[_nation];

        if (n.currentMode == AttentionMode.FutureGoals) return "Nation is building forward. Past dissection paused.";
        if (n.currentMode == AttentionMode.PresentHealing) return "Balancing introspection with healing.";
        return "Still anchored in legacy reviews. Suggest goal reorientation.";
    }
}
