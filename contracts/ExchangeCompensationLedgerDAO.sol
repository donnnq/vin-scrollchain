// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ExchangeCompensationLedgerDAO {
    address public steward;

    struct CompensationEvent {
        string exchangeName; // "Binance", "FTX", "KuCoin"
        uint256 amountPaid; // 283000000
        string reason; // "Market Chaos", "Liquidation Spike"
        string emotionalTag;
        uint256 timestamp;
    }

    CompensationEvent[] public events;

    event CompensationLogged(
        string exchangeName,
        uint256 amountPaid,
        string reason,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may log compensation rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logCompensation(
        string memory exchangeName,
        uint256 amountPaid,
        string memory reason,
        string memory emotionalTag
    ) external onlySteward {
        events.push(CompensationEvent({
            exchangeName: exchangeName,
            amountPaid: amountPaid,
            reason: reason,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit CompensationLogged(exchangeName, amountPaid, reason, emotionalTag, block.timestamp);
    }
}
