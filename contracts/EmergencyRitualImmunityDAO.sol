// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmergencyRitualImmunityDAO {
    address public admin;

    struct ImmunityEntry {
        string purokName;
        string emergencyType;
        string emotionalTag;
        bool ritualized;
        bool immune;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function ritualizeEmergency(string memory purokName, string memory emergencyType, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(purokName, emergencyType, emotionalTag, true, false));
    }

    function markImmune(uint256 index) external onlyAdmin {
        entries[index].immune = true;
    }

    function getImmunity(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
