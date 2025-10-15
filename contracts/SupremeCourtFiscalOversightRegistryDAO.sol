// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SupremeCourtFiscalOversightRegistryDAO {
    address public admin;

    struct OversightEntry {
        string caseTitle;
        string oversightClause;
        string emotionalTag;
        bool validated;
    }

    OversightEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitOversight(string memory _caseTitle, string memory _oversightClause, string memory _emotionalTag) external onlyAdmin {
        registry.push(OversightEntry(_caseTitle, _oversightClause, _emotionalTag, false));
    }

    function validateOversight(uint256 index) external onlyAdmin {
        registry[index].validated = true;
    }

    function getOversight(uint256 index) external view returns (OversightEntry memory) {
        return registry[index];
    }
}
