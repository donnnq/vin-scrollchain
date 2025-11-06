// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SanctionsReversalKarmaIndex {
    address public steward;

    struct KarmaEntry {
        string countryName;
        string sanctionType;
        string reversalProtocol;
        string emotionalTag;
    }

    KarmaEntry[] public index;

    event SanctionsReversalTagged(string countryName, string sanctionType, string reversalProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagReversal(
        string memory countryName,
        string memory sanctionType,
        string memory reversalProtocol,
        string memory emotionalTag
    ) public onlySteward {
        index.push(KarmaEntry(countryName, sanctionType, reversalProtocol, emotionalTag));
        emit SanctionsReversalTagged(countryName, sanctionType, reversalProtocol, emotionalTag);
    }
}
