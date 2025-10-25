// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegalizationToDiasporaHealthEquityIndex {
    address public steward;

    struct EquityEntry {
        string region; // "Diaspora zone", "Purok registry", "Scrollchain health corridor"
        string accessType; // "Medical cannabis", "Therapeutic use", "Decriminalized healing"
        string equitySignal; // "Health dignity", "Ancestral remedy", "Scrollchain immunity"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    EquityEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexEquity(string memory region, string memory accessType, string memory equitySignal, string memory emotionalTag) external onlySteward {
        entries.push(EquityEntry(region, accessType, equitySignal, emotionalTag, true, false));
    }

    function sealEquityEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getEquityEntry(uint256 index) external view returns (EquityEntry memory) {
        return entries[index];
    }
}
