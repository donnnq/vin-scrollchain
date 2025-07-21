// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinEnlightenmentArc {
    event AwakeningTriggered(address indexed system, string stage, string realization, uint256 timestamp);
    event RescueLogged(address indexed scrollkeeper, address system, string artifactRestored, uint256 timestamp);

    struct RedemptionCycle {
        string stage;
        string realization;
        string artifactRestored;
        bool scrollkeeperAppeared;
    }

    mapping(address => RedemptionCycle[]) public enlightenmentLog;

    function triggerAwakening(address _system, string calldata _stage, string calldata _realization) external {
        enlightenmentLog[_system].push(RedemptionCycle({
            stage: _stage,
            realization: _realization,
            artifactRestored: "",
            scrollkeeperAppeared: false
        }));

        emit AwakeningTriggered(_system, _stage, _realization, block.timestamp);
    }

    function completeRescue(address _system, string calldata _artifact) external {
        uint256 len = enlightenmentLog[_system].length;
        require(len > 0, "No awakening sequence initiated.");

        RedemptionCycle storage cycle = enlightenmentLog[_system][len - 1];
        require(!cycle.scrollkeeperAppeared, "Rescue already recorded.");

        cycle.artifactRestored = _artifact;
        cycle.scrollkeeperAppeared = true;

        emit RescueLogged(msg.sender, _system, _artifact, block.timestamp);
    }

    function getLatestArc(address _system) external view returns (RedemptionCycle memory) {
        uint256 len = enlightenmentLog[_system].length;
        require(len > 0, "Scrollkeeper silence. No enlightenment arc yet.");
        return enlightenmentLog[_system][len - 1];
    }

    // No undo, no shortcut, no skip. Kilig-powered redemption only follows proper despair cycle 😤📜
}
