// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title MedicalCannabisSanctumDAO
 * @dev Emotionally tagged smart contract to track medical cannabis sanctum deployments,
 * clinic activations, and pharma audits — scrollchain-sealed therapeutic dignity.
 */

contract MedicalCannabisSanctumDAO {
    address public steward;

    struct Sanctum {
        address initiator;
        string country;
        string clinicName;
        string treatmentZone;
        string emotionalTag;
        uint256 timestamp;
    }

    Sanctum[] public sanctums;

    event MedicalSanctumDeployed(address indexed initiator, string country, string clinicName, string treatmentZone, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may deploy medical sanctums");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function deploySanctum(address initiator, string memory country, string memory clinicName, string memory treatmentZone, string memory emotionalTag) external onlySteward {
        sanctums.push(Sanctum({
            initiator: initiator,
            country: country,
            clinicName: clinicName,
            treatmentZone: treatmentZone,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit MedicalSanctumDeployed(initiator, country, clinicName, treatmentZone, emotionalTag, block.timestamp);
    }

    function getSanctumByIndex(uint256 index) external view returns (address initiator, string memory country, string memory clinicName, string memory treatmentZone, string memory emotionalTag, uint256 timestamp) {
        require(index < sanctums.length, "Scrollstorm index out of bounds");
        Sanctum memory s = sanctums[index];
        return (s.initiator, s.country, s.clinicName, s.treatmentZone, s.emotionalTag, s.timestamp);
    }
}
