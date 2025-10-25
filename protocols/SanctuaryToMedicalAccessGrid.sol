// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SanctuaryToMedicalAccessGrid {
    address public steward;

    struct MedicalEntry {
        string sanctuaryLocation; // "Ordos", "Yujiapu", "Kangbashi"
        string accessType; // "Mobile clinic", "Telemedicine", "Local health steward"
        string targetGroup; // "Displaced families", "Low-income migrants"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    MedicalEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deployMedicalAccess(string memory sanctuaryLocation, string memory accessType, string memory targetGroup, string memory emotionalTag) external onlySteward {
        entries.push(MedicalEntry(sanctuaryLocation, accessType, targetGroup, emotionalTag, true, false));
    }

    function sealMedicalEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getMedicalEntry(uint256 index) external view returns (MedicalEntry memory) {
        return entries[index];
    }
}
