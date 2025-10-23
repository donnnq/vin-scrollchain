// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SeafarerVisaRevocationAuditProtocol {
    address public steward;

    struct RevocationEntry {
        string seafarerID;
        string revocationLocation; // "US Port", "Philippine Airport"
        string revocationType; // "No case", "Forced signature", "Pre-departure cancellation"
        string emotionalTag;
        bool audited;
        bool sealed;
    }

    RevocationEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function auditRevocation(string memory seafarerID, string memory revocationLocation, string memory revocationType, string memory emotionalTag) external onlySteward {
        entries.push(RevocationEntry(seafarerID, revocationLocation, revocationType, emotionalTag, true, false));
    }

    function sealRevocationEntry(uint256 index) external onlySteward {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getRevocationEntry(uint256 index) external view returns (RevocationEntry memory) {
        return entries[index];
    }
}
