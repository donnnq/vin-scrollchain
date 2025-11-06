// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalPatentEquityIndex {
    address public steward;

    struct PatentEntry {
        string country;
        string innovationType;
        string equityProtocol;
        string emotionalTag;
    }

    PatentEntry[] public index;

    event PatentEquityTagged(string country, string innovationType, string equityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagPatentEquity(
        string memory country,
        string memory innovationType,
        string memory equityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        index.push(PatentEntry(country, innovationType, equityProtocol, emotionalTag));
        emit PatentEquityTagged(country, innovationType, equityProtocol, emotionalTag);
    }
}
