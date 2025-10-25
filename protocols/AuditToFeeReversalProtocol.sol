// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AuditToFeeReversalProtocol {
    address public steward;

    struct ReversalEntry {
        string institution; // "Bank", "Crypto app", "Utility provider"
        string feeType; // "Excessive charge", "Hidden fee", "Yield clawback"
        string reversalMethod; // "Scrollchain refund", "Diaspora credit", "Public ledger rollback"
        string emotionalTag;
        bool reversed;
        bool sealed;
    }

    ReversalEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function reverseFee(string memory institution, string memory feeType, string memory reversalMethod, string memory emotionalTag) external onlySteward {
        entries.push(ReversalEntry(institution, feeType, reversalMethod, emotionalTag, true, false));
    }

    function sealReversalEntry(uint256 index) external onlySteward {
        require(entries[index].reversed, "Must be reversed first");
        entries[index].sealed = true;
    }

    function getReversalEntry(uint256 index) external view returns (ReversalEntry memory) {
        return entries[index];
    }
}
