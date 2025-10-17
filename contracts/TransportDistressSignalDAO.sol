// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransportDistressSignalDAO {
    address public admin;

    struct DistressEntry {
        string sector;
        string signalType;
        string emotionalTag;
        bool logged;
        bool escalated;
    }

    DistressEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logSignal(string memory sector, string memory signalType, string memory emotionalTag) external onlyAdmin {
        entries.push(DistressEntry(sector, signalType, emotionalTag, true, false));
    }

    function escalateSignal(uint256 index) external onlyAdmin {
        entries[index].escalated = true;
    }

    function getDistressEntry(uint256 index) external view returns (DistressEntry memory) {
        return entries[index];
    }
}
