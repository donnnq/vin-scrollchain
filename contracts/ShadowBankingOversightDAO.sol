// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShadowBankingOversightDAO {
    address public admin;

    struct OversightEntry {
        string lenderName;
        string riskClause;
        string emotionalTag;
        bool flagged;
    }

    OversightEntry[] public oversight;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _lenderName, string memory _riskClause, string memory _emotionalTag) external onlyAdmin {
        oversight.push(OversightEntry(_lenderName, _riskClause, _emotionalTag, false));
    }

    function flagEntry(uint256 index) external onlyAdmin {
        oversight[index].flagged = true;
    }

    function getEntry(uint256 index) external view returns (OversightEntry memory) {
        return oversight[index];
    }
}
