// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title KindnessSuite - Core emotional modules for user dignity and joy
/// @notice Encodes assistive, hospitality, and happypill-grade interactions

contract KindnessSuite {
    address public steward;

    struct KindAct {
        string category; // "assistive", "hospitality", "happypill"
        string message;
        uint256 timestamp;
    }

    KindAct[] public kindnessLog;

    event KindnessBlessed(string category, string message, uint256 timestamp);

    constructor() {
        steward = msg.sender;
    }

    /// @notice Logs a kindness act into the emotional ledger
    function blessKindness(string memory _category, string memory _message) external {
        kindnessLog.push(KindAct(_category, _message, block.timestamp));
        emit KindnessBlessed(_category, _message, block.timestamp);
    }

    /// @notice Retrieves latest kindness scrolls
    function getRecentKindness(uint count) external view returns (KindAct[] memory) {
        uint total = kindnessLog.length;
        uint start = total > count ? total - count : 0;
        KindAct[] memory recent = new KindAct[](total - start);
        for (uint i = start; i < total; i++) {
            recent[i - start] = kindnessLog[i];
        }
        return recent;
    }
}
