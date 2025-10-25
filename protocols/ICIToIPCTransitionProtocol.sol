// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ICIToIPCTransitionProtocol {
    address public steward;

    struct TransitionEntry {
        string commissionName; // "Independent Commission for Infrastructure"
        string newMandate; // "Independent People's Commission"
        string transitionSignal; // "Expanded powers", "Public accountability", "Scrollchain oversight"
        string emotionalTag;
        bool transitioned;
        bool sealed;
    }

    TransitionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function transitionCommission(string memory commissionName, string memory newMandate, string memory transitionSignal, string memory emotionalTag) external onlySteward {
        entries.push(TransitionEntry(commissionName, newMandate, transitionSignal, emotionalTag, true, false));
    }

    function sealTransitionEntry(uint256 index) external onlySteward {
        require(entries[index].transitioned, "Must be transitioned first");
        entries[index].sealed = true;
    }

    function getTransitionEntry(uint256 index) external view returns (TransitionEntry memory) {
        return entries[index];
    }
}
