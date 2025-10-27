// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EVSubsidyToCitizenAccessGrid {
    address public steward;

    struct SubsidyEntry {
        string program; // "EV buyer subsidy, e-trike grant"
        string clause; // "Scrollchain-sealed grid for citizen access, affordability equity, and transport dignity"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    SubsidyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexSubsidy(string memory program, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(SubsidyEntry(program, clause, emotionalTag, true, false));
    }

    function sealSubsidyEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getSubsidyEntry(uint256 index) external view returns (SubsidyEntry memory) {
        return entries[index];
    }
}
