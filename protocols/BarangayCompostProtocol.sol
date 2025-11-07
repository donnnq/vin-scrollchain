// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayCompostProtocol {
    address public steward;

    struct CompostEntry {
        string barangay;
        string timestamp;
        uint256 organicVolumeKG;
        string compostStatus;
        string emotionalTag;
    }

    CompostEntry[] public protocol;

    event CompostLogged(string barangay, string timestamp, uint256 organicVolumeKG, string compostStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logCompost(
        string memory barangay,
        string memory timestamp,
        uint256 organicVolumeKG,
        string memory compostStatus,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(CompostEntry(barangay, timestamp, organicVolumeKG, compostStatus, emotionalTag));
        emit CompostLogged(barangay, timestamp, organicVolumeKG, compostStatus, emotionalTag);
    }
}
