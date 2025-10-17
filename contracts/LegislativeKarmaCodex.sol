// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegislativeKarmaCodex {
    address public admin;

    struct KarmaEntry {
        string legislatorName;
        string legislativeAction;
        string emotionalTag;
        bool summoned;
        bool resolved;
    }

    KarmaEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonKarma(string memory legislatorName, string memory legislativeAction, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(legislatorName, legislativeAction, emotionalTag, true, false));
    }

    function resolveKarma(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getKarma(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
