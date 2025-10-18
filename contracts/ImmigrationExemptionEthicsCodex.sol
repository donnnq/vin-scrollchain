// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ImmigrationExemptionEthicsCodex {
    address public admin;

    struct ExemptionEntry {
        string exemptionType;
        string justification;
        string emotionalTag;
        bool summoned;
        bool approved;
    }

    ExemptionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonExemption(string memory exemptionType, string memory justification, string memory emotionalTag) external onlyAdmin {
        entries.push(ExemptionEntry(exemptionType, justification, emotionalTag, true, false));
    }

    function approveExemption(uint256 index) external onlyAdmin {
        entries[index].approved = true;
    }

    function getExemptionEntry(uint256 index) external view returns (ExemptionEntry memory) {
        return entries[index];
    }
}
