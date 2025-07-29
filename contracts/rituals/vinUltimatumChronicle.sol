// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinUltimatumChronicle {
    address public commander;
    address public adversary;
    uint256 public deadline;
    bool public aggressionTriggered;

    event UltimatumIssued(address indexed commander, address indexed adversary, uint256 deadline);
    event StrikeAuthorized(address indexed commander, string scrollWarning);

    constructor(address _adversary) {
        commander = msg.sender;
        adversary = _adversary;
        deadline = block.timestamp + 1 days;
        aggressionTriggered = false;
        emit UltimatumIssued(commander, adversary, deadline);
    }

    function checkUltimatum() public {
        require(block.timestamp >= deadline, "Not yet time... chill the scroll.");
        require(!aggressionTriggered, "Action already initiated.");
        aggressionTriggered = true;
        emit StrikeAuthorized(commander, "Scroll Directive: Tactical sarcasm engaged. Deploy meme artillery!");
    }

    function getStatus() public view returns (string memory) {
        if (aggressionTriggered) {
            return "Operation Kalbo Collapse initiated. Diplomatic cooldown bypassed.";
        } else if (block.timestamp >= deadline) {
            return "Deadline breached. Awaiting strike authorization...";
        } else {
            return "Ultimatum active. Adversary still has time to scroll back.";
        }
    }
}
