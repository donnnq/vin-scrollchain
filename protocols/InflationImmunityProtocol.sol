// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InflationImmunityProtocol {
    address public admin;

    struct ImmunityEntry {
        string entityName;
        string sector;
        string strategyUsed;
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

    function summonImmunity(string memory entityName, string memory sector, string memory strategyUsed, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(entityName, sector, strategyUsed, emotionalTag, true, false, false));
    }

    function confirmImmunity(uint256 index) external onlyAdmin {
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
