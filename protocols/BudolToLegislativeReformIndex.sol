// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BudolToLegislativeReformIndex {
    address public steward;

    struct ReformEntry {
        string deceptionType; // "False announcement", "Delayed execution", "Untracked investment"
        string publicSignal; // "Gatchalian quote", "Senate frustration", "Diaspora audit"
        string reformGoal; // "Transparency law", "Investment traceability", "Proponent disclosure"
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

    function indexReform(string memory deceptionType, string memory publicSignal, string memory reformGoal, string memory emotionalTag) external onlySteward {
        entries.push(ReformEntry(deceptionType, publicSignal, reformGoal, emotionalTag, true, false));
    }

    function sealReformEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getReformEntry(uint256 index) external view returns (ReformEntry memory) {
        return entries[index];
    }
}
