// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractorReputationCodex {
    address public admin;

    struct ReputationEntry {
        string contractorName;
        string projectLabel;
        string reputationNote;
        string emotionalTag;
        bool verified;
    }

    ReputationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory contractorName, string memory projectLabel, string memory reputationNote, string memory emotionalTag) external onlyAdmin {
        entries.push(ReputationEntry(contractorName, projectLabel, reputationNote, emotionalTag, false));
    }

    function verifyEntry(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function getEntry(uint256 index) external view returns (ReputationEntry memory) {
        return entries[index];
    }
}
