// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OrbitalEthicsDAO {
    address public admin;

    struct EthicsEntry {
        string satelliteLabel;
        string breachConcern;
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

    function submitConcern(string memory satelliteLabel, string memory breachConcern, string memory emotionalTag) external onlyAdmin {
        entries.push(EthicsEntry(satelliteLabel, breachConcern, emotionalTag, false, false));
    }

    function flagConcern(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function resolveConcern(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getConcern(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
