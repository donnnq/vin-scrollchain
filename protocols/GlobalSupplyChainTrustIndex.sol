// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalSupplyChainTrustIndex {
    address public steward;

    struct TrustEntry {
        string country;
        string reliabilityScore;
        string transparencyProtocol;
        string emotionalTag;
    }

    TrustEntry[] public index;

    event SupplyChainTrustBroadcasted(string country, string reliabilityScore, string transparencyProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastTrust(
        string memory country,
        string memory reliabilityScore,
        string memory transparencyProtocol,
        string memory emotionalTag
    ) public onlySteward {
        index.push(TrustEntry(country, reliabilityScore, transparencyProtocol, emotionalTag));
        emit SupplyChainTrustBroadcasted(country, reliabilityScore, transparencyProtocol, emotionalTag);
    }
}
