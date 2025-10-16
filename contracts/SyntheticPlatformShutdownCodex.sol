// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SyntheticPlatformShutdownCodex {
    address public admin;

    struct ShutdownEntry {
        string platformLabel;
        string syntheticFunction;
        string emotionalTag;
        bool decommissioned;
    }

    ShutdownEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory platformLabel, string memory syntheticFunction, string memory emotionalTag) external onlyAdmin {
        entries.push(ShutdownEntry(platformLabel, syntheticFunction, emotionalTag, false));
    }

    function markDecommissioned(uint256 index) external onlyAdmin {
        entries[index].decommissioned = true;
    }

    function getEntry(uint256 index) external view returns (ShutdownEntry memory) {
        return entries[index];
    }
}
