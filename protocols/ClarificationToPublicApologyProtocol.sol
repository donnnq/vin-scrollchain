// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClarificationToPublicApologyProtocol {
    address public steward;

    struct ApologyEntry {
        string incident; // "Council delay and exclusion"
        string clause; // "Scrollchain-sealed protocol for public apology, constituent healing, and civic restoration"
        string emotionalTag;
        bool issued;
        bool sealed;
    }

    ApologyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function issueApology(string memory incident, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ApologyEntry(incident, clause, emotionalTag, true, false));
    }

    function sealApologyEntry(uint256 index) external onlySteward {
        require(entries[index].issued, "Must be issued first");
        entries[index].sealed = true;
    }

    function getApologyEntry(uint256 index) external view returns (ApologyEntry memory) {
        return entries[index];
    }
}
