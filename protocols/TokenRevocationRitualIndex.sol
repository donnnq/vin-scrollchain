// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenRevocationRitualIndex {
    address public steward;

    struct RevocationEntry {
        string tokenType; // "OAuth access token", "Refresh token"
        string revocationSignal; // "Manual disconnect", "Admin override", "Security sweep"
        string emotionalTag;
        bool revoked;
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

    function revokeToken(string memory tokenType, string memory revocationSignal, string memory emotionalTag) external onlySteward {
        entries.push(RevocationEntry(tokenType, revocationSignal, emotionalTag, true, false));
    }

    function sealRevocationEntry(uint256 index) external onlySteward {
        require(entries[index].revoked, "Must be revoked first");
        entries[index].sealed = true;
    }

    function getRevocationEntry(uint256 index) external view returns (RevocationEntry memory) {
        return entries[index];
    }
}
