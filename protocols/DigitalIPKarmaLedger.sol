// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalIPKarmaLedger {
    address public steward;

    struct IPEntry {
        string creatorName;
        string IPType;
        string karmaProtocol;
        string emotionalTag;
    }

    IPEntry[] public ledger;

    event DigitalIPKarmaTagged(string creatorName, string IPType, string karmaProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagIPKarma(
        string memory creatorName,
        string memory IPType,
        string memory karmaProtocol,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(IPEntry(creatorName, IPType, karmaProtocol, emotionalTag));
        emit DigitalIPKarmaTagged(creatorName, IPType, karmaProtocol, emotionalTag);
    }
}
