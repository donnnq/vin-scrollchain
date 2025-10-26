// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkerToLegislativeLobbyProtocol {
    address public steward;

    struct LobbyEntry {
        string workerSector; // "Delivery riders, factory workers, contractuals"
        string legislativeDemand; // "Mandatory benefits, inspector audits, grievance fast-track"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    LobbyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateLobby(string memory workerSector, string memory legislativeDemand, string memory emotionalTag) external onlySteward {
        entries.push(LobbyEntry(workerSector, legislativeDemand, emotionalTag, true, false));
    }

    function sealLobbyEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getLobbyEntry(uint256 index) external view returns (LobbyEntry memory) {
        return entries[index];
    }
}
