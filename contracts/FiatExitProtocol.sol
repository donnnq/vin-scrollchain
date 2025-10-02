// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Fiat Exit Protocol v1.0
/// @notice Tracks crypto-to-fiat conversions with emotional tagging and forensic traceability

contract FiatExitProtocol {
    address public originator;

    struct ExitEvent {
        string assetTag; // e.g. "BTC", "ETH"
        uint256 amount;
        string exchangeTag; // e.g. "Binance", "Coinbase"
        string emotionalTag; // e.g. "Urgency", "Suspicion", "Restitution"
        uint256 timestamp;
    }

    ExitEvent[] public exitLog;

    constructor() {
        originator = msg.sender;
    }

    function logExit(
        string memory assetTag,
        uint256 amount,
        string memory exchangeTag,
        string memory emotionalTag
    ) external {
        exitLog.push(ExitEvent({
            assetTag: assetTag,
            amount: amount,
            exchangeTag: exchangeTag,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));
    }

    function totalFiatConverted() external view returns (uint256 total) {
        for (uint256 i = 0; i < exitLog.length; i++) {
            total += exitLog[i].amount;
        }
    }
}
