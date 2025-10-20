// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NEPTransparencyDAO {
    address public admin;

    struct TransparencyEntry {
        string agency;
        string budgetYear;
        string allocationFormula;
        string emotionalTag;
        bool summoned;
        bool clarified;
        bool sealed;
    }

    TransparencyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTransparency(string memory agency, string memory budgetYear, string memory allocationFormula, string memory emotionalTag) external onlyAdmin {
        entries.push(TransparencyEntry(agency, budgetYear, allocationFormula, emotionalTag, true, false, false));
    }

    function confirmClarification(uint256 index) external onlyAdmin {
        entries[index].clarified = true;
    }

    function sealTransparencyEntry(uint256 index) external onlyAdmin {
        require(entries[index].clarified, "Must be clarified first");
        entries[index].sealed = true;
    }

    function getTransparencyEntry(uint256 index) external view returns (TransparencyEntry memory) {
        return entries[index];
    }
}
