// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DismissalOrderRevivalProtocol {
    address public steward;

    struct RevivalEntry {
        string caseName; // "Joel Villanueva PDAF case"
        string originalOrderDate;
        string revivalTrigger; // "Carpio statement", "Public clamor", "Ombudsman escalation"
        string emotionalTag;
        bool revived;
        bool sealed;
    }

    RevivalEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function reviveOrder(string memory caseName, string memory originalOrderDate, string memory revivalTrigger, string memory emotionalTag) external onlySteward {
        entries.push(RevivalEntry(caseName, originalOrderDate, revivalTrigger, emotionalTag, true, false));
    }

    function sealRevivalEntry(uint256 index) external onlySteward {
        require(entries[index].revived, "Must be revived first");
        entries[index].sealed = true;
    }

    function getRevivalEntry(uint256 index) external view returns (RevivalEntry memory) {
        return entries[index];
    }
}
