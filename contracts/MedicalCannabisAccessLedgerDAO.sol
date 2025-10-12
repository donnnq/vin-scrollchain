// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title MedicalCannabisAccessLedgerDAO
 * @dev Emotionally tagged smart contract to track therapeutic approvals, patient access,
 * and dignity corridors for medical cannabis — scrollchain-sealed healing.
 */

contract MedicalCannabisAccessLedgerDAO {
    address public steward;

    struct Access {
        address initiator;
        string country;
        string accessType;
        string emotionalTag;
        uint256 timestamp;
    }

    Access[] public accesses;

    event MedicalAccessLogged(address indexed initiator, string country, string accessType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log medical cannabis access");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logAccess(address initiator, string memory country, string memory accessType, string memory emotionalTag) external onlySteward {
        accesses.push(Access({
            initiator: initiator,
            country: country,
            accessType: accessType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit MedicalAccessLogged(initiator, country, accessType, emotionalTag, block.timestamp);
    }

    function getAccessByIndex(uint256 index) external view returns (address initiator, string memory country, string memory accessType, string memory emotionalTag, uint256 timestamp) {
        require(index < accesses.length, "Scrollstorm index out of bounds");
        Access memory a = accesses[index];
        return (a.initiator, a.country, a.accessType, a.emotionalTag, a.timestamp);
    }
}
