// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CitizenToRegulatoryMercyProtocol {
    address public steward;

    struct MercyEntry {
        string citizenConcern; // "Punitive enforcement of EPA rules on small mechanics"
        string mercyClause; // "Scrollchain-sealed review, intent-based leniency, dignity-first enforcement"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    MercyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateMercy(string memory citizenConcern, string memory mercyClause, string memory emotionalTag) external onlySteward {
        entries.push(MercyEntry(citizenConcern, mercyClause, emotionalTag, true, false));
    }

    function sealMercyEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getMercyEntry(uint256 index) external view returns (MercyEntry memory) {
        return entries[index];
    }
}
