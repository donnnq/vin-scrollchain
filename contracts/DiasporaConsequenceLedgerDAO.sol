// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title DiasporaConsequenceLedgerDAO
 * @dev Emotionally tagged smart contract to log diaspora-related civic events,
 * blending consequences, and sanctuary breaches — scrollchain-sealed clarity.
 */

contract DiasporaConsequenceLedgerDAO {
    address public steward;

    struct Consequence {
        address initiator;
        string region;
        string diasporaGroup;
        string consequenceType;
        string emotionalTag;
        uint256 timestamp;
    }

    Consequence[] public consequences;

    event DiasporaConsequenceLogged(address indexed initiator, string region, string diasporaGroup, string consequenceType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log diaspora consequences");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logConsequence(address initiator, string memory region, string memory diasporaGroup, string memory consequenceType, string memory emotionalTag) external onlySteward {
        consequences.push(Consequence({
            initiator: initiator,
            region: region,
            diasporaGroup: diasporaGroup,
            consequenceType: consequenceType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit DiasporaConsequenceLogged(initiator, region, diasporaGroup, consequenceType, emotionalTag, block.timestamp);
    }

    function getConsequenceByIndex(uint256 index) external view returns (address initiator, string memory region, string memory diasporaGroup, string memory consequenceType, string memory emotionalTag, uint256 timestamp) {
        require(index < consequences.length, "Scrollstorm index out of bounds");
        Consequence memory c = consequences[index];
        return (c.initiator, c.region, c.diasporaGroup, c.consequenceType, c.emotionalTag, c.timestamp);
    }
}
