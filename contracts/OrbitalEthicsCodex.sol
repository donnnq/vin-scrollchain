// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OrbitalEthicsCodex {
    address public admin;

    struct EthicsEntry {
        string satelliteName;
        string corridor;
        string emotionalTag;
        bool archived;
        bool sovereign;
    }

    EthicsEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function archiveSatellite(string memory satelliteName, string memory corridor, string memory emotionalTag) external onlyAdmin {
        entries.push(EthicsEntry(satelliteName, corridor, emotionalTag, true, false));
    }

    function markSovereign(uint256 index) external onlyAdmin {
        entries[index].sovereign = true;
    }

    function getSatellite(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
