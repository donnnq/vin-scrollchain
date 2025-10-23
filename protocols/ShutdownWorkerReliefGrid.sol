// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShutdownWorkerReliefGrid {
    address public steward;

    struct ReliefEntry {
        string agencyName;
        uint256 unpaidWorkers;
        uint256 emergencyFundAllocated;
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    ReliefEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deployRelief(string memory agencyName, uint256 unpaidWorkers, uint256 emergencyFundAllocated, string memory emotionalTag) external onlySteward {
        entries.push(ReliefEntry(agencyName, unpaidWorkers, emergencyFundAllocated, emotionalTag, true, false));
    }

    function sealReliefEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getReliefEntry(uint256 index) external view returns (ReliefEntry memory) {
        return entries[index];
    }
}
