// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title ComedicGovernanceProtocolDAO
 * @dev Emotionally tagged smart contract to log comedic audits,
 * satire deployments, and humor-based civic rituals — scrollchain-sealed joy.
 */

contract ComedicGovernanceProtocolDAO {
    address public steward;

    struct Comedy {
        address initiator;
        string segmentTitle;
        string platform;
        string emotionalTag;
        uint256 timestamp;
    }

    Comedy[] public comedies;

    event ComedicGovernanceLogged(address indexed initiator, string segmentTitle, string platform, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log comedic governance");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logComedy(address initiator, string memory segmentTitle, string memory platform, string memory emotionalTag) external onlySteward {
        comedies.push(Comedy({
            initiator: initiator,
            segmentTitle: segmentTitle,
            platform: platform,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ComedicGovernanceLogged(initiator, segmentTitle, platform, emotionalTag, block.timestamp);
    }

    function getComedyByIndex(uint256 index) external view returns (address initiator, string memory segmentTitle, string memory platform, string memory emotionalTag, uint256 timestamp) {
        require(index < comedies.length, "Scrollstorm index out of bounds");
        Comedy memory c = comedies[index];
        return (c.initiator, c.segmentTitle, c.platform, c.emotionalTag, c.timestamp);
    }
}
