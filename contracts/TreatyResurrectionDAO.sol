// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title TreatyResurrectionDAO
 * @dev Emotionally tagged smart contract to log the revival of dormant treaties,
 * peace frameworks, and diplomatic rituals — scrollchain-sealed consequence.
 */

contract TreatyResurrectionDAO {
    address public steward;

    struct TreatyEvent {
        address initiator;
        string treatyName;
        string originalSignatories;
        string resurrectionType; // "Reaffirmation", "Amendment", "Re-signing"
        string emotionalTag;
        uint256 timestamp;
    }

    TreatyEvent[] public events;

    event TreatyLogged(address indexed initiator, string treatyName, string originalSignatories, string resurrectionType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log treaty resurrection rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logTreaty(address initiator, string memory treatyName, string memory originalSignatories, string memory resurrectionType, string memory emotionalTag) external onlySteward {
        events.push(TreatyEvent({
            initiator: initiator,
            treatyName: treatyName,
            originalSignatories: originalSignatories,
            resurrectionType: resurrectionType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit TreatyLogged(initiator, treatyName, originalSignatories, resurrectionType, emotionalTag, block.timestamp);
    }

    function getTreatyByIndex(uint256 index) external view returns (address initiator, string memory treatyName, string memory originalSignatories, string memory resurrectionType, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        TreatyEvent memory t = events[index];
        return (t.initiator, t.treatyName, t.originalSignatories, t.resurrectionType, t.emotionalTag, t.timestamp);
    }
}
