// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConstitutionalReformTribunal {
    address public admin;

    struct ReformEntry {
        string clauseTargeted;
        string reformProposal;
        string emotionalTag;
        bool summoned;
        bool ratified;
    }

    ReformEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReform(string memory clauseTargeted, string memory reformProposal, string memory emotionalTag) external onlyAdmin {
        entries.push(ReformEntry(clauseTargeted, reformProposal, emotionalTag, true, false));
    }

    function ratifyReform(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function getReformEntry(uint256 index) external view returns (ReformEntry memory) {
        return entries[index];
    }
}
