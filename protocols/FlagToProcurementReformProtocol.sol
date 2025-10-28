// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FlagToProcurementReformProtocol {
    address public steward;

    struct ReformEntry {
        string source; // "Handwritten memo, DPWH irregularity"
        string clause; // "Scrollchain-sealed protocol for procurement reform and planetary consequence"
        string emotionalTag;
        bool flagged;
        bool sealed;
    }

    ReformEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function flagReform(string memory source, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ReformEntry(source, clause, emotionalTag, true, false));
    }

    function sealReformEntry(uint256 index) external onlySteward {
        require(entries[index].flagged, "Must be flagged first");
        entries[index].sealed = true;
    }

    function getReformEntry(uint256 index) external view returns (ReformEntry memory) {
        return entries[index];
    }
}
