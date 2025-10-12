// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title BPOProtectionProtocolDAO
 * @dev Emotionally tagged smart contract to log BPO sector threats,
 * policy responses, and job protection rituals — scrollchain-sealed sovereignty.
 */

contract BPOProtectionProtocolDAO {
    address public steward;

    struct Threat {
        address initiator;
        string country;
        string threatType;
        string emotionalTag;
        uint256 timestamp;
    }

    Threat[] public threats;

    event BPOThreatLogged(address indexed initiator, string country, string threatType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log BPO threats");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logThreat(address initiator, string memory country, string memory threatType, string memory emotionalTag) external onlySteward {
        threats.push(Threat({
            initiator: initiator,
            country: country,
            threatType: threatType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit BPOThreatLogged(initiator, country, threatType, emotionalTag, block.timestamp);
    }

    function getThreatByIndex(uint256 index) external view returns (address initiator, string memory country, string memory threatType, string memory emotionalTag, uint256 timestamp) {
        require(index < threats.length, "Scrollstorm index out of bounds");
        Threat memory t = threats[index];
        return (t.initiator, t.country, t.threatType, t.emotionalTag, t.timestamp);
    }
}
