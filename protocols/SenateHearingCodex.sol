// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateHearingCodex {
    address public admin;

    struct HearingEntry {
        string hearingTitle;
        string codexType; // "Live Broadcast", "Public Comment Inclusion", "Minority Participation"
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool enforced;
        bool sealed;
    }

    HearingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonHearingCodex(string memory hearingTitle, string memory codexType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(HearingEntry(hearingTitle, codexType, codexClause, emotionalTag, true, false, false));
    }

    function confirmEnforcement(uint256 index) external onlyAdmin {
        entries[index].enforced = true;
    }

    function sealHearingEntry(uint256 index) external onlyAdmin {
        require(entries[index].enforced, "Must be enforced first");
        entries[index].sealed = true;
    }

    function getHearingEntry(uint256 index) external view returns (HearingEntry memory) {
        return entries[index];
    }
}
