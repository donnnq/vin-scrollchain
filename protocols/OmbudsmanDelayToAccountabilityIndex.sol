// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OmbudsmanDelayToAccountabilityIndex {
    address public steward;

    struct DelayEntry {
        string officialName; // "Ex-Ombudsman Martires"
        string caseSubject; // "Sen. Joel"
        string delayDuration; // "3 years"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    DelayEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexDelay(string memory officialName, string memory caseSubject, string memory delayDuration, string memory emotionalTag) external onlySteward {
        entries.push(DelayEntry(officialName, caseSubject, delayDuration, emotionalTag, true, false));
    }

    function sealDelayEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getDelayEntry(uint256 index) external view returns (DelayEntry memory) {
        return entries[index];
    }
}
