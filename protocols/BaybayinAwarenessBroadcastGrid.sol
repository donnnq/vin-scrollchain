// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BaybayinAwarenessBroadcastGrid {
    address public steward;

    struct BroadcastEntry {
        string location;
        string baybayinPhrase;
        string broadcastMethod;
        string emotionalTag;
    }

    BroadcastEntry[] public grid;

    event BaybayinBroadcasted(string location, string baybayinPhrase, string broadcastMethod, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function broadcastBaybayin(
        string memory location,
        string memory baybayinPhrase,
        string memory broadcastMethod,
        string memory emotionalTag
    ) public onlySteward {
        grid.push(BroadcastEntry(location, baybayinPhrase, broadcastMethod, emotionalTag));
        emit BaybayinBroadcasted(location, baybayinPhrase, broadcastMethod, emotionalTag);
    }
}
