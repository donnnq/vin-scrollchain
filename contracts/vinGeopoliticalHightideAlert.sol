// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinGeopoliticalHightideAlert
/// @dev Emits strategic alerts when trust levels exceed thresholds or ritual alignments activate regional harmony

contract vinGeopoliticalHightideAlert {
    address public analyst;
    uint256 public alertThreshold = 85;

    struct TideSignal {
        string allyNation;
        uint256 trustScore;
        bool treatyActive;
        bool moonAligned;
        string alertMessage;
        uint256 timestamp;
    }

    TideSignal[] public alerts;

    event HightideAlert(string allyNation, uint256 trustScore, string alertMessage);

    modifier onlyAnalyst() {
        require(msg.sender == analyst, "Only diplomatic analyst may trigger alerts");
        _;
    }

    constructor() {
        analyst = msg.sender;
    }

    function evaluateTrust(
        string memory nation,
        uint256 score,
        bool treaty,
        bool moonAlignment
    ) public onlyAnalyst {
        string memory msgPayload;
        if (score >= alertThreshold && treaty && moonAlignment) {
            msgPayload = "🌕 High Trust Surge — activate peace rituals and alliance protocols!";
        } else if (score >= alertThreshold && !moonAlignment) {
            msgPayload = "⚠️ Trust High but Ritual Misaligned — hold deployment, activate diplomatic prayer.";
        } else if (score < alertThreshold && treaty) {
            msgPayload = "🔍 Treaty active but trust low — initiate restoration scroll.";
        } else {
            msgPayload = "🧊 Trust low and treaty inactive — hold silence, avoid provocation.";
        }

        alerts.push(TideSignal(nation, score, treaty, moonAlignment, msgPayload, block.timestamp));
        emit HightideAlert(nation, score, msgPayload);
    }

    function viewAlerts() public view returns (TideSignal[] memory) {
        return alerts;
    }

    function updateThreshold(uint256 newLevel) public onlyAnalyst {
        alertThreshold = newLevel;
    }
}
