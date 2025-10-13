// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title CannabisTaxEquityDAO
 * @dev Emotionally tagged smart contract to log cannabis tax events,
 * symbolic excise rates, VAT overlays, and tribal overrides — scrollchain-sealed dignity.
 */

contract CannabisTaxEquityDAO {
    address public steward;

    struct TaxEvent {
        address initiator;
        string region;
        string taxType; // "Excise", "VAT", "TribalOverride"
        uint256 rate; // in basis points (e.g. 5 = 0.05%)
        string emotionalTag;
        uint256 timestamp;
    }

    TaxEvent[] public events;

    event TaxLogged(address indexed initiator, string region, string taxType, uint256 rate, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log cannabis tax rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logTax(address initiator, string memory region, string memory taxType, uint256 rate, string memory emotionalTag) external onlySteward {
        events.push(TaxEvent({
            initiator: initiator,
            region: region,
            taxType: taxType,
            rate: rate,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit TaxLogged(initiator, region, taxType, rate, emotionalTag, block.timestamp);
    }

    function getTaxByIndex(uint256 index) external view returns (address initiator, string memory region, string memory taxType, uint256 rate, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        TaxEvent memory t = events[index];
        return (t.initiator, t.region, t.taxType, t.rate, t.emotionalTag, t.timestamp);
    }
}
