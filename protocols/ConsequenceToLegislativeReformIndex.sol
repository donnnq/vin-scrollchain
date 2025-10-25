// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConsequenceToLegislativeReformIndex {
    address public steward;

    struct ReformEntry {
        string violationType; // "Budget manipulation", "Ghost insertion", "Project selling"
        string consequenceSignal; // "Public trial", "Asset freeze", "Expulsion"
        string reformGoal; // "Transparency law", "Audit mandate", "Proponent disclosure"
        string emotionalTag;
        bool indexed;
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

    function indexReform(string memory violationType, string memory consequenceSignal, string memory reformGoal, string memory emotionalTag) external onlySteward {
        entries.push(ReformEntry(violationType, consequenceSignal, reformGoal, emotionalTag, true, false));
    }

    function sealReformEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getReformEntry(uint256 index) external view returns (ReformEntry memory) {
        return entries[index];
    }
}
