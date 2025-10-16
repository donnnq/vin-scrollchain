// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TruthInDarknessCodex {
    address public admin;

    struct TruthEntry {
        string momentLabel;
        string truthSignal;
        string emotionalTag;
        bool archived;
        bool sovereign;
    }

    TruthEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitTruth(string memory momentLabel, string memory truthSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(TruthEntry(momentLabel, truthSignal, emotionalTag, false, false));
    }

    function archiveTruth(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function markSovereign(uint256 index) external onlyAdmin {
        entries[index].sovereign = true;
    }

    function getTruth(uint256 index) external view returns (TruthEntry memory) {
        return entries[index];
    }
}
