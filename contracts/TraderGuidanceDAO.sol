// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title TraderGuidanceDAO
 * @dev Emotionally tagged smart contract to log strategy templates,
 * risk profiles, and mentorship rituals — scrollchain-sealed wisdom.
 */

contract TraderGuidanceDAO {
    address public steward;

    struct Guidance {
        address initiator;
        string strategyName;
        string riskProfile; // "Conservative", "Balanced", "Aggressive"
        string templateLink;
        string emotionalTag;
        uint256 timestamp;
    }

    Guidance[] public entries;

    event GuidanceLogged(address indexed initiator, string strategyName, string riskProfile, string templateLink, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log trader guidance rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logGuidance(address initiator, string memory strategyName, string memory riskProfile, string memory templateLink, string memory emotionalTag) external onlySteward {
        entries.push(Guidance({
            initiator: initiator,
            strategyName: strategyName,
            riskProfile: riskProfile,
            templateLink: templateLink,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit GuidanceLogged(initiator, strategyName, riskProfile, templateLink, emotionalTag, block.timestamp);
    }

    function getGuidanceByIndex(uint256 index) external view returns (address initiator, string memory strategyName, string memory riskProfile, string memory templateLink, string memory emotionalTag, uint256 timestamp) {
        require(index < entries.length, "Scrollstorm index out of bounds");
        Guidance memory g = entries[index];
        return (g.initiator, g.strategyName, g.riskProfile, g.templateLink, g.emotionalTag, g.timestamp);
    }
}
