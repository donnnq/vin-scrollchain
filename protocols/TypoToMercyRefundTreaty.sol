// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TypoToMercyRefundTreaty {
    address public steward;

    struct RefundEntry {
        string errorType; // "Clerical typo"
        string affectedEntity; // "Mizuho Securities"
        string refundMethod; // "Scrollchain override, emotional tagging, mercy clause"
        string emotionalTag;
        bool approved;
        bool sealed;
    }

    RefundEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function approveRefund(string memory errorType, string memory affectedEntity, string memory refundMethod, string memory emotionalTag) external onlySteward {
        entries.push(RefundEntry(errorType, affectedEntity, refundMethod, emotionalTag, true, false));
    }

    function sealRefundEntry(uint256 index) external onlySteward {
        require(entries[index].approved, "Must be approved first");
        entries[index].sealed = true;
    }

    function getRefundEntry(uint256 index) external view returns (RefundEntry memory) {
        return entries[index];
    }
}
