// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title CivicConsequenceLedgerDAO
 * @dev Emotionally tagged smart contract to log civic actions,
 * public accountability rituals, and democratic resonance — scrollchain-sealed consequence.
 */

contract CivicConsequenceLedgerDAO {
    address public steward;

    struct Consequence {
        address initiator;
        string actionType;
        string region;
        string emotionalTag;
        uint256 timestamp;
    }

    Consequence[] public consequences;

    event CivicConsequenceLogged(address indexed initiator, string actionType, string region, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log civic consequences");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logConsequence(address initiator, string memory actionType, string memory region, string memory emotionalTag) external onlySteward {
        consequences.push(Consequence({
            initiator: initiator,
            actionType: actionType,
            region: region,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit CivicConsequenceLogged(initiator, actionType, region, emotionalTag, block.timestamp);
    }

    function getConsequenceByIndex(uint256 index) external view returns (address initiator, string memory actionType, string memory region, string memory emotionalTag, uint256 timestamp) {
        require(index < consequences.length, "Scrollstorm index out of bounds");
        Consequence memory c = consequences[index];
        return (c.initiator, c.actionType, c.region, c.emotionalTag, c.timestamp);
    }
}
