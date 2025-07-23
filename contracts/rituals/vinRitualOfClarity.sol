// SPDX-License-Identifier: MythstreamClarity-002
pragma solidity ^0.8.24;

/// @title vinRitualOfClarity
/// @notice Unlocks emotional and informational resistance layers during crypto onboarding
contract vinRitualOfClarity {
    address public scrollkeeper;

    struct ClarityLog {
        string confusionType;
        string ritualMessage;
        uint8 clarityLevel; // 0 = fogged, 1 = warming, 2 = clear
        bool passedThreshold;
        uint256 timestamp;
    }

    mapping(address => ClarityLog) public clarityLedger;
    address[] public awakenedSouls;

    event ClarityPinged(address indexed soul, string message, uint8 level);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function dropClarity(
        address soul,
        string calldata confusionType,
        string calldata message,
        uint8 level
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN may perform awakening rituals");
        require(level <= 2, "Invalid clarity level");

        bool passed = level == 2;
        clarityLedger[soul] = ClarityLog(confusionType, message, level, passed, block.timestamp);
        awakenedSouls.push(soul);
        emit ClarityPinged(soul, message, level);
    }

    function viewClarity(address soul) external view returns (
        string memory confusionType,
        string memory message,
        uint8 level,
        bool passed,
        uint256 timeStamp
    ) {
        ClarityLog memory log = clarityLedger[soul];
        return (log.confusionType, log.ritualMessage, log.clarityLevel, log.passedThreshold, log.timestamp);
    }

    function viewAwakenedSouls() external view returns (address[] memory) {
        return awakenedSouls;
    }
}
