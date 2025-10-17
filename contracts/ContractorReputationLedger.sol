// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractorReputationLedger {
    address public admin;

    struct ReputationEntry {
        string contractorName;
        string reputationSignal;
        string emotionalTag;
        bool logged;
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

    function logReputation(string memory contractorName, string memory reputationSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(ReputationEntry(contractorName, reputationSignal, emotionalTag, true, false));
    }

    function verifyReputation(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function getReputationEntry(uint256 index) external view returns (ReputationEntry memory) {
        return entries[index];
    }
}
