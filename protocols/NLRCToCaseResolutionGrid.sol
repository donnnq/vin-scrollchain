// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NLRCToCaseResolutionGrid {
    address public steward;

    struct ResolutionEntry {
        string caseType; // "Underpayment, illegal dismissal, missing benefits"
        string delayCause; // "Backlog, manual processing, inspector negligence"
        string emotionalTag;
        bool summoned;
        bool sealed;
    }

    ResolutionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function summonResolution(string memory caseType, string memory delayCause, string memory emotionalTag) external onlySteward {
        entries.push(ResolutionEntry(caseType, delayCause, emotionalTag, true, false));
    }

    function sealResolutionEntry(uint256 index) external onlySteward {
        require(entries[index].summoned, "Must be summoned first");
        entries[index].sealed = true;
    }

    function getResolutionEntry(uint256 index) external view returns (ResolutionEntry memory) {
        return entries[index];
    }
}
