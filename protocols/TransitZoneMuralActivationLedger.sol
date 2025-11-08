// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransitZoneMuralActivationLedger {
    address public steward;

    struct MuralEntry {
        string timestamp;
        string location;
        string artistCollective;
        string theme;
        string communityEngagementSignal;
        string emotionalTag;
    }

    MuralEntry[] public ledger;

    event MuralActivated(string timestamp, string location, string artistCollective, string theme, string communityEngagementSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function activateMural(
        string memory timestamp,
        string memory location,
        string memory artistCollective,
        string memory theme,
        string memory communityEngagementSignal,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(MuralEntry(timestamp, location, artistCollective, theme, communityEngagementSignal, emotionalTag));
        emit MuralActivated(timestamp, location, artistCollective, theme, communityEngagementSignal, emotionalTag);
    }
}
