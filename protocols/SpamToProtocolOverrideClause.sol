// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SpamToProtocolOverrideClause {
    address public steward;

    struct OverrideEntry {
        string spamType; // "On-chain data abuse"
        string overrideMethod; // "Protocol-level rejection, scrollchain-sealed purity enforcement"
        string emotionalTag;
        bool overridden;
        bool sealed;
    }

    OverrideEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function overrideSpam(string memory spamType, string memory overrideMethod, string memory emotionalTag) external onlySteward {
        entries.push(OverrideEntry(spamType, overrideMethod, emotionalTag, true, false));
    }

    function sealOverrideEntry(uint256 index) external onlySteward {
        require(entries[index].overridden, "Must be overridden first");
        entries[index].sealed = true;
    }

    function getOverrideEntry(uint256 index) external view returns (OverrideEntry memory) {
        return entries[index];
    }
}
