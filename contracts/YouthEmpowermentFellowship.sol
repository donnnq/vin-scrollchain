// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthEmpowermentFellowship {
    address public admin;

    struct EmpowermentEntry {
        string region;
        string sport;
        string emotionalTag;
        bool activated;
        bool audited;
    }

    EmpowermentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function activateFellowship(string memory region, string memory sport, string memory emotionalTag) external onlyAdmin {
        entries.push(EmpowermentEntry(region, sport, emotionalTag, true, false));
    }

    function auditFellowship(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function getEmpowermentEntry(uint256 index) external view returns (EmpowermentEntry memory) {
        return entries[index];
    }
}
