// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RitualImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string ritualType;
        string purokName;
        string emotionalTag;
        bool deployed;
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

    function deployRitual(string memory ritualType, string memory purokName, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(ritualType, purokName, emotionalTag, true, false));
    }

    function markImmune(uint256 index) external onlyAdmin {
        entries[index].immune = true;
    }

    function getImmunity(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
