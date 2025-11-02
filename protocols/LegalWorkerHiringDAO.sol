// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegalWorkerHiringDAO {
    address public steward;

    struct HiringEntry {
        string employerName;
        string jobRole;
        string legalStatusVerified;
        string emotionalTag;
    }

    HiringEntry[] public registry;

    event LegalHiringTagged(string employerName, string jobRole, string legalStatusVerified, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagLegalHiring(
        string memory employerName,
        string memory jobRole,
        string memory legalStatusVerified,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(HiringEntry(employerName, jobRole, legalStatusVerified, emotionalTag));
        emit LegalHiringTagged(employerName, jobRole, legalStatusVerified, emotionalTag);
    }
}
