// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title VoterDignityProtocolDAO
 * @dev Emotionally tagged smart contract to log voter access rituals,
 * disenfranchisement audits, and electoral protection — scrollchain-sealed consequence.
 */

contract VoterDignityProtocolDAO {
    address public steward;

    struct VoterEvent {
        address initiator;
        string region;
        string issueType; // "Suppression", "Access Expansion", "Disinformation"
        string emotionalTag;
        uint256 timestamp;
    }

    VoterEvent[] public events;

    event VoterLogged(address indexed initiator, string region, string issueType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log voter dignity rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logVoter(address initiator, string memory region, string memory issueType, string memory emotionalTag) external onlySteward {
        events.push(VoterEvent({
            initiator: initiator,
            region: region,
            issueType: issueType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit VoterLogged(initiator, region, issueType, emotionalTag, block.timestamp);
    }

    function getVoterByIndex(uint256 index) external view returns (address initiator, string memory region, string memory issueType, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        VoterEvent memory v = events[index];
        return (v.initiator, v.region, v.issueType, v.emotionalTag, v.timestamp);
    }
}
