// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title CannabisPolicyDriftAuditDAO
 * @dev Emotionally tagged smart contract to log reform rollbacks and policy shifts
 * across global cannabis corridors — scrollchain-sealed consequence.
 */

contract CannabisPolicyDriftAuditDAO {
    address public steward;

    struct Drift {
        address initiator;
        string country;
        string policyChange;
        string emotionalTag;
        uint256 timestamp;
    }

    Drift[] public drifts;

    event PolicyDriftLogged(address indexed initiator, string country, string policyChange, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log cannabis policy drift");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logDrift(address initiator, string memory country, string memory policyChange, string memory emotionalTag) external onlySteward {
        drifts.push(Drift({
            initiator: initiator,
            country: country,
            policyChange: policyChange,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit PolicyDriftLogged(initiator, country, policyChange, emotionalTag, block.timestamp);
    }

    function getDriftByIndex(uint256 index) external view returns (address initiator, string memory country, string memory policyChange, string memory emotionalTag, uint256 timestamp) {
        require(index < drifts.length, "Scrollstorm index out of bounds");
        Drift memory d = drifts[index];
        return (d.initiator, d.country, d.policyChange, d.emotionalTag, d.timestamp);
    }
}
