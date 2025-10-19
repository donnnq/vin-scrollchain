// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BorderFairnessCodex {
    address public admin;

    struct FairnessEntry {
        string country;
        string checkpointType;
        string fairnessClause;
        string emotionalTag;
        bool summoned;
        bool ratified;
        bool sealed;
    }

    FairnessEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFairness(string memory country, string memory checkpointType, string memory fairnessClause, string memory emotionalTag) external onlyAdmin {
        entries.push(FairnessEntry(country, checkpointType, fairnessClause, emotionalTag, true, false, false));
    }

    function confirmRatification(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function sealFairnessEntry(uint256 index) external onlyAdmin {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getFairnessEntry(uint256 index) external view returns (FairnessEntry memory) {
        return entries[index];
    }
}
