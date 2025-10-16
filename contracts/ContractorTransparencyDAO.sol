// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractorTransparencyDAO {
    address public admin;

    struct ContractorEntry {
        string contractorName;
        string projectInvolved;
        string transparencyNote;
        string emotionalTag;
        bool flagged;
    }

    ContractorEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory contractorName, string memory projectInvolved, string memory transparencyNote, string memory emotionalTag) external onlyAdmin {
        entries.push(ContractorEntry(contractorName, projectInvolved, transparencyNote, emotionalTag, false));
    }

    function flagEntry(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function getEntry(uint256 index) external view returns (ContractorEntry memory) {
        return entries[index];
    }
}
