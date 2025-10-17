// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicBroadcastEthicsDAO {
    address public admin;

    struct EthicsEntry {
        string broadcasterName;
        string ethicsConcern;
        string emotionalTag;
        bool flagged;
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

    function flagConcern(string memory broadcasterName, string memory ethicsConcern, string memory emotionalTag) external onlyAdmin {
        entries.push(EthicsEntry(broadcasterName, ethicsConcern, emotionalTag, true, false));
    }

    function resolveConcern(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getEthicsEntry(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
