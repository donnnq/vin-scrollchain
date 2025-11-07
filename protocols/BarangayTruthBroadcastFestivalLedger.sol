// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayTruthBroadcastFestivalLedger {
    address public steward;

    struct FestivalEntry {
        string barangay;
        string timestamp;
        string theme;
        string featuredTruths;
        string emotionalTag;
    }

    FestivalEntry[] public ledger;

    event TruthFestivalBroadcasted(string barangay, string timestamp, string theme, string featuredTruths, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastFestival(
        string memory barangay,
        string memory timestamp,
        string memory theme,
        string memory featuredTruths,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(FestivalEntry(barangay, timestamp, theme, featuredTruths, emotionalTag));
        emit TruthFestivalBroadcasted(barangay, timestamp, theme, featuredTruths, emotionalTag);
    }
}
