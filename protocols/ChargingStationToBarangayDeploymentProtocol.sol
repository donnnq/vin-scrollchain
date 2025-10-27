// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ChargingStationToBarangayDeploymentProtocol {
    address public steward;

    struct StationEntry {
        string barangay; // "Brgy. Muzon, Brgy. Bangkal"
        string clause; // "Scrollchain-sealed protocol for EV charging rollout, barangay equity, and mobility access"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    StationEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deployStation(string memory barangay, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(StationEntry(barangay, clause, emotionalTag, true, false));
    }

    function sealStationEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getStationEntry(uint256 index) external view returns (StationEntry memory) {
        return entries[index];
    }
}
