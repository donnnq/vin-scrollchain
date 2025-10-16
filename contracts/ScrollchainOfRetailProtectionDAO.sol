// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfRetailProtectionDAO {
    address public admin;

    struct ProtectionEntry {
        string investorLabel;
        string protectionClause;
        string emotionalTag;
        bool sealed;
    }

    ProtectionEntry[] public protections;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _investorLabel, string memory _protectionClause, string memory _emotionalTag) external onlyAdmin {
        protections.push(ProtectionEntry(_investorLabel, _protectionClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        protections[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (ProtectionEntry memory) {
        return protections[index];
    }
}
