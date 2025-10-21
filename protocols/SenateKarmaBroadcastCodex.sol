// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateKarmaBroadcastCodex {
    address public admin;

    struct BroadcastEntry {
        string senatorName;
        string karmaType; // "Ghost Project Exposure", "Flood Neglect Testimony", "Transparency Failure"
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool aired;
        bool sealed;
    }

    BroadcastEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBroadcast(string memory senatorName, string memory karmaType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(senatorName, karmaType, codexClause, emotionalTag, true, false, false));
    }

    function confirmAiring(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function sealBroadcastEntry(uint256 index) external onlyAdmin {
        require(entries[index].aired, "Must be aired first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
