// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MiningSiteRewildingManifest {
    address public steward;

    struct RewildingEntry {
        string siteID;
        string timestamp;
        string nativeSpeciesIntroduced;
        string ecologicalStatus;
        string emotionalTag;
    }

    RewildingEntry[] public manifest;

    event SiteRewilded(string siteID, string timestamp, string nativeSpeciesIntroduced, string ecologicalStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function rewildSite(
        string memory siteID,
        string memory timestamp,
        string memory nativeSpeciesIntroduced,
        string memory ecologicalStatus,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(RewildingEntry(siteID, timestamp, nativeSpeciesIntroduced, ecologicalStatus, emotionalTag));
        emit SiteRewilded(siteID, timestamp, nativeSpeciesIntroduced, ecologicalStatus, emotionalTag);
    }
}
