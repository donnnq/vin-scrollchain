// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PowerTrippingAuditDAO {
    address public steward;

    struct AbuseEntry {
        string authorityFigure;
        string abuseContext;
        string impactOnWorker;
        string emotionalTag;
    }

    AbuseEntry[] public registry;

    event PowerTrippingTagged(string authorityFigure, string abuseContext, string impactOnWorker, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagAbuse(
        string memory authorityFigure,
        string memory abuseContext,
        string memory impactOnWorker,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(AbuseEntry(authorityFigure, abuseContext, impactOnWorker, emotionalTag));
        emit PowerTrippingTagged(authorityFigure, abuseContext, impactOnWorker, emotionalTag);
    }
}
