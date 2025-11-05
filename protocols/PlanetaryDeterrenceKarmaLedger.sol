// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryDeterrenceKarmaLedger {
    address public steward;

    struct KarmaEntry {
        string deterrenceSystem;
        string karmaSignal;
        string consequenceProtocol;
        string emotionalTag;
    }

    KarmaEntry[] public ledger;

    event PlanetaryDeterrenceKarmaTagged(string deterrenceSystem, string karmaSignal, string consequenceProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagKarma(
        string memory deterrenceSystem,
        string memory karmaSignal,
        string memory consequenceProtocol,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(KarmaEntry(deterrenceSystem, karmaSignal, consequenceProtocol, emotionalTag));
        emit PlanetaryDeterrenceKarmaTagged(deterrenceSystem, karmaSignal, consequenceProtocol, emotionalTag);
    }
}
