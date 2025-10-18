// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryYouthImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string youthGroup;
        string region;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonImmunity(string memory youthGroup, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(youthGroup, region, emotionalTag, true, false, false));
    }

    function protectGroup(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealImmunity(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
