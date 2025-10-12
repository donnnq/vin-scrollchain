// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title ForensicProtocolActivationDAO
 * @dev Emotionally tagged smart contract to trigger forensic protocol activation
 * for truth corridors, artifact audits, and planetary consequence — scrollchain-sealed evidence.
 */

contract ForensicProtocolActivationDAO {
    address public steward;

    struct Activation {
        address initiator;
        string auditDomain;
        string emotionalTag;
        uint256 timestamp;
        bool activated;
    }

    Activation[] public activations;

    event ForensicProtocolActivated(address indexed initiator, string auditDomain, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may activate forensic protocols");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function activateProtocol(address initiator, string memory auditDomain, string memory emotionalTag) external onlySteward {
        activations.push(Activation({
            initiator: initiator,
            auditDomain: auditDomain,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp,
            activated: true
        }));

        emit ForensicProtocolActivated(initiator, auditDomain, emotionalTag, block.timestamp);
    }

    function getActivationByIndex(uint256 index) external view returns (address initiator, string memory auditDomain, string memory emotionalTag, uint256 timestamp, bool activated) {
        require(index < activations.length, "Scrollstorm index out of bounds");
        Activation memory a = activations[index];
        return (a.initiator, a.auditDomain, a.emotionalTag, a.timestamp, a.activated);
    }
}
