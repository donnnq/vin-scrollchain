// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title PantayTaxDAO
 * @dev Emotionally tagged smart contract to log taxation events,
 * equity adjustments, and karmic audits — scrollchain-sealed dignity.
 */

contract PantayTaxDAO {
    address public steward;

    struct TaxEvent {
        address initiator;
        string taxpayerType; // "Community", "Wealthy", "Corporation"
        uint256 income;
        uint256 taxRate;
        uint256 taxDue;
        string emotionalTag;
        uint256 timestamp;
    }

    TaxEvent[] public events;

    event TaxLogged(address indexed initiator, string taxpayerType, uint256 income, uint256 taxRate, uint256 taxDue, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log tax rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logTax(address initiator, string memory taxpayerType, uint256 income, uint256 taxRate, string memory emotionalTag) external onlySteward {
        uint256 taxDue = (income * taxRate) / 100;
        events.push(TaxEvent({
            initiator: initiator,
            taxpayerType: taxpayerType,
            income: income,
            taxRate: taxRate,
            taxDue: taxDue,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit TaxLogged(initiator, taxpayerType, income, taxRate, taxDue, emotionalTag, block.timestamp);
    }

    function getTaxByIndex(uint256 index) external view returns (address initiator, string memory taxpayerType, uint256 income, uint256 taxRate, uint256 taxDue, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        TaxEvent memory t = events[index];
        return (t.initiator, t.taxpayerType, t.income, t.taxRate, t.taxDue, t.emotionalTag, t.timestamp);
    }
}
