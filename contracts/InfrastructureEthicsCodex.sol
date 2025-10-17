// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureEthicsCodex {
    address public admin;

    struct EthicsEntry {
        string projectName;
        string ethicalConcern;
        string emotionalTag;
        bool summoned;
        bool resolved;
    }

    EthicsEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonEthicsReview(string memory projectName, string memory ethicalConcern, string memory emotionalTag) external onlyAdmin {
        entries.push(EthicsEntry(projectName, ethicalConcern, emotionalTag, true, false));
    }

    function resolveEthicsReview(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getEthicsEntry(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
