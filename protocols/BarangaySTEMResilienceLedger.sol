// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangaySTEMResilienceLedger {
    address public steward;

    struct ResilienceEntry {
        string barangay;
        string STEMDomain;
        string resilienceMechanism;
        string emotionalTag;
    }

    ResilienceEntry[] public ledger;

    event STEMResilienceTagged(string barangay, string STEMDomain, string resilienceMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagResilience(
        string memory barangay,
        string memory STEMDomain,
        string memory resilienceMechanism,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ResilienceEntry(barangay, STEMDomain, resilienceMechanism, emotionalTag));
        emit STEMResilienceTagged(barangay, STEMDomain, resilienceMechanism, emotionalTag);
    }
}
