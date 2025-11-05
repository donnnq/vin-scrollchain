// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RegionalIncomeSovereigntyIndex {
    address public steward;

    struct SovereigntyEntry {
        string region;
        string incomeBracket;
        string sovereigntyProtocol;
        string emotionalTag;
    }

    SovereigntyEntry[] public index;

    event IncomeSovereigntyTagged(string region, string incomeBracket, string sovereigntyProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSovereignty(
        string memory region,
        string memory incomeBracket,
        string memory sovereigntyProtocol,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SovereigntyEntry(region, incomeBracket, sovereigntyProtocol, emotionalTag));
        emit IncomeSovereigntyTagged(region, incomeBracket, sovereigntyProtocol, emotionalTag);
    }
}
