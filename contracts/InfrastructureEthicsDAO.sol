// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureEthicsDAO {
    address public admin;

    struct EthicsEntry {
        string projectName;
        string ethicsConcern;
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

    function summonConcern(string memory projectName, string memory ethicsConcern, string memory emotionalTag) external onlyAdmin {
        entries.push(EthicsEntry(projectName, ethicsConcern, emotionalTag, true, false));
    }

    function resolveConcern(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getEthicsEntry(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
