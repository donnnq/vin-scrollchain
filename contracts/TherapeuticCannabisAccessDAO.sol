// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title TherapeuticCannabisAccessDAO
 * @dev Emotionally tagged smart contract to log medical cannabis access approvals,
 * dosage protocols, and dignity corridors — scrollchain-sealed healing.
 */

contract TherapeuticCannabisAccessDAO {
    address public steward;

    struct Access {
        address patient;
        string country;
        string diagnosis;
        string dosageProtocol;
        string emotionalTag;
        uint256 timestamp;
    }

    Access[] public accesses;

    event TherapeuticAccessLogged(address indexed patient, string country, string diagnosis, string dosageProtocol, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log therapeutic access");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logAccess(address patient, string memory country, string memory diagnosis, string memory dosageProtocol, string memory emotionalTag) external onlySteward {
        accesses.push(Access({
            patient: patient,
            country: country,
            diagnosis: diagnosis,
            dosageProtocol: dosageProtocol,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit TherapeuticAccessLogged(patient, country, diagnosis, dosageProtocol, emotionalTag, block.timestamp);
    }

    function getAccessByIndex(uint256 index) external view returns (address patient, string memory country, string memory diagnosis, string memory dosageProtocol, string memory emotionalTag, uint256 timestamp) {
        require(index < accesses.length, "Scrollstorm index out of bounds");
        Access memory a = accesses[index];
        return (a.patient, a.country, a.diagnosis, a.dosageProtocol, a.emotionalTag, a.timestamp);
    }
}
