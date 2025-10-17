// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ICIProsecutionTransparencyCodex {
    address public admin;

    struct ProsecutionEntry {
        string caseTitle;
        string interrogationMethod;
        string emotionalTag;
        bool publicized;
        bool archived;
    }

    ProsecutionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logProsecution(string memory caseTitle, string memory interrogationMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(ProsecutionEntry(caseTitle, interrogationMethod, emotionalTag, true, false));
    }

    function archiveProsecution(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getProsecutionEntry(uint256 index) external view returns (ProsecutionEntry memory) {
        return entries[index];
    }
}
