// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FTANegotiationTracker {
    address public admin;

    struct NegotiationEntry {
        string country; // "Philippines"
        string partner; // "EU", "UAE", "Canada", "Chile"
        string status; // "Initiated", "Ongoing", "Signed"
        string emotionalTag;
        bool tracked;
        bool sealed;
    }

    NegotiationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function trackNegotiation(string memory country, string memory partner, string memory status, string memory emotionalTag) external onlyAdmin {
        entries.push(NegotiationEntry(country, partner, status, emotionalTag, true, false));
    }

    function sealNegotiationEntry(uint256 index) external onlyAdmin {
        require(entries[index].tracked, "Must be tracked first");
        entries[index].sealed = true;
    }

    function getNegotiationEntry(uint256 index) external view returns (NegotiationEntry memory) {
        return entries[index];
    }
}
