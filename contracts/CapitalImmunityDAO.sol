// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CapitalImmunityDAO {
    address public admin;

    struct ImmunityEntry {
        string entityName;
        string censorshipClaim;
        string emotionalTag;
        bool summoned;
        bool protected;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonImmunity(string memory entityName, string memory censorshipClaim, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(entityName, censorshipClaim, emotionalTag, true, false));
    }

    function protectEntity(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function getImmunity(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
