// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CCTVBeautificationBroadcastProtocol {
    address public steward;

    struct BroadcastEntry {
        string location;
        string surveillanceProtocol;
        string beautificationFeature;
        string emotionalTag;
    }

    BroadcastEntry[] public registry;

    event BeautificationBroadcasted(string location, string surveillanceProtocol, string beautificationFeature, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastBeautification(
        string memory location,
        string memory surveillanceProtocol,
        string memory beautificationFeature,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(BroadcastEntry(location, surveillanceProtocol, beautificationFeature, emotionalTag));
        emit BeautificationBroadcasted(location, surveillanceProtocol, beautificationFeature, emotionalTag);
    }
}
