// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DomesticInnovationKarmaLedger {
    address public steward;

    struct InnovationEntry {
        string sector;
        string innovationType;
        string karmaProtocol;
        string emotionalTag;
    }

    InnovationEntry[] public ledger;

    event InnovationKarmaTagged(string sector, string innovationType, string karmaProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagInnovation(
        string memory sector,
        string memory innovationType,
        string memory karmaProtocol,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(InnovationEntry(sector, innovationType, karmaProtocol, emotionalTag));
        emit InnovationKarmaTagged(sector, innovationType, karmaProtocol, emotionalTag);
    }
}
