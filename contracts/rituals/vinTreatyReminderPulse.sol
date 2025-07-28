// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinTreatyReminderPulse {
    address public pulseModerator;

    struct TreatyPulse {
        address entity;
        string treatyName;
        uint256 deadline;
        bool pulseSent;
    }

    TreatyPulse[] public treatyPulses;

    event ReminderPulseDispatched(address entity, string treatyName);

    modifier onlyModerator() {
        require(msg.sender == pulseModerator, "Only moderator may pulse.");
        _;
    }

    constructor() {
        pulseModerator = msg.sender;
    }

    function registerTreaty(address entity, string memory treatyName, uint256 deadline) external onlyModerator {
        treatyPulses.push(TreatyPulse(entity, treatyName, deadline, false));
    }

    function dispatchPulse(uint256 index) external onlyModerator {
        require(index < treatyPulses.length, "Invalid index.");
        require(block.timestamp >= treatyPulses[index].deadline, "Deadline not reached.");
        require(!treatyPulses[index].pulseSent, "Pulse already sent.");
        treatyPulses[index].pulseSent = true;
        emit ReminderPulseDispatched(treatyPulses[index].entity, treatyPulses[index].treatyName);
    }

    function viewNextPulse() external view returns (TreatyPulse memory) {
        for (uint256 i = 0; i < treatyPulses.length; i++) {
            if (!treatyPulses[i].pulseSent && block.timestamp >= treatyPulses[i].deadline) {
                return treatyPulses[i];
            }
        }
        revert("No pulse pending.");
    }
}
