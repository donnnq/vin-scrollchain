// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIPromptContainmentLedgerDAO {
    address public admin;

    struct ContainmentEntry {
        string assistantName;
        string promptType;
        string containmentStrategy;
        string emotionalTag;
        bool deployed;
    }

    ContainmentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _assistantName, string memory _promptType, string memory _containmentStrategy, string memory _emotionalTag) external onlyAdmin {
        entries.push(ContainmentEntry(_assistantName, _promptType, _containmentStrategy, _emotionalTag, false));
    }

    function deployContainment(uint256 index) external onlyAdmin {
        entries[index].deployed = true;
    }

    function getEntry(uint256 index) external view returns (ContainmentEntry memory) {
        return entries[index];
    }
}
