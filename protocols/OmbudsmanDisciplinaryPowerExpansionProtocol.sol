// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OmbudsmanDisciplinaryPowerExpansionProtocol {
    address public steward;

    struct PowerEntry {
        string actionType; // "Suspend", "Dismiss", "Prosecute", "Blacklist"
        string targetScope; // "Appointed officials", "Elected officials", "Party-list reps"
        string enforcementBarrier; // "Senate override", "Judicial delay", "Political immunity"
        string emotionalTag;
        bool expanded;
        bool sealed;
    }

    PowerEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function expandPower(string memory actionType, string memory targetScope, string memory enforcementBarrier, string memory emotionalTag) external onlySteward {
        entries.push(PowerEntry(actionType, targetScope, enforcementBarrier, emotionalTag, true, false));
    }

    function sealPowerEntry(uint256 index) external onlySteward {
        require(entries[index].expanded, "Must be expanded first");
        entries[index].sealed = true;
    }

    function getPowerEntry(uint256 index) external view returns (PowerEntry memory) {
        return entries[index];
    }
}
