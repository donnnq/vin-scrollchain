// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlatformToPayoutIntegrityProtocol {
    address public steward;

    struct IntegrityEntry {
        string platformName; // "Shopee, Lazada"
        string payoutIssue; // "Delayed payments, missing commissions"
        string emotionalTag;
        bool audited;
        bool sealed;
    }

    IntegrityEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function auditPayout(string memory platformName, string memory payoutIssue, string memory emotionalTag) external onlySteward {
        entries.push(IntegrityEntry(platformName, payoutIssue, emotionalTag, true, false));
    }

    function sealIntegrityEntry(uint256 index) external onlySteward {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getIntegrityEntry(uint256 index) external view returns (IntegrityEntry memory) {
        return entries[index];
    }
}
