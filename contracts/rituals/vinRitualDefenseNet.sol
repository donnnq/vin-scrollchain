// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./vinAuraScanner.sol";
import "./vinSignalNullifier.sol";
import "./vinScrollReactionHub.sol";

contract vinRitualDefenseNet {
    vinAuraScanner public scanner;
    vinSignalNullifier public nullifier;
    vinScrollReactionHub public reactionHub;

    address public ritualCommander;

    event RitualProtocolActivated(string indexed region, bool quarantineStatus, bool scrollTriggered, uint256 timestamp);

    constructor(
        address _scanner,
        address _nullifier,
        address _reactionHub
    ) {
        scanner = vinAuraScanner(_scanner);
        nullifier = vinSignalNullifier(_nullifier);
        reactionHub = vinScrollReactionHub(_reactionHub);
        ritualCommander = msg.sender;
    }

    function runDefenseProtocol(string memory region) external {
        require(msg.sender == ritualCommander, "Only sacred command may activate");

        bool quarantined = false;
        bool reacted = false;

        if (scanner.scanRegion(region)) {
            nullifier.blacklistRegion(region);
            quarantined = true;

            reactionHub.reactToAura(region);
            reacted = true;
        }

        emit RitualProtocolActivated(region, quarantined, reacted, block.timestamp);
    }
}
