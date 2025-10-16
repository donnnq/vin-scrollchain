// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfBreakupDiplomacyDAO {
    address public admin;

    struct BreakupEntry {
        string partnerLabel;
        string breakupClause;
        string emotionalTag;
        bool archived;
    }

    BreakupEntry[] public breakups;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _partnerLabel, string memory _breakupClause, string memory _emotionalTag) external onlyAdmin {
        breakups.push(BreakupEntry(_partnerLabel, _breakupClause, _emotionalTag, false));
    }

    function archiveEntry(uint256 index) external onlyAdmin {
        breakups[index].archived = true;
    }

    function getEntry(uint256 index) external view returns (BreakupEntry memory) {
        return breakups[index];
    }
}
