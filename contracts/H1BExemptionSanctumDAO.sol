// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract H1BExemptionSanctumDAO {
    address public admin;

    struct ExemptionEntry {
        string applicantName;
        string skillDomain;
        string emotionalTag;
        bool summoned;
        bool granted;
    }

    ExemptionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonExemption(string memory applicantName, string memory skillDomain, string memory emotionalTag) external onlyAdmin {
        entries.push(ExemptionEntry(applicantName, skillDomain, emotionalTag, true, false));
    }

    function grantExemption(uint256 index) external onlyAdmin {
        entries[index].granted = true;
    }

    function getExemptionEntry(uint256 index) external view returns (ExemptionEntry memory) {
        return entries[index];
    }
}
