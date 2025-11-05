// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanGreeningKarmaIndex {
    address public steward;

    struct KarmaEntry {
        string siteName;
        string greeningAct;
        string karmaSignal;
        string emotionalTag;
    }

    KarmaEntry[] public index;

    event UrbanGreeningKarmaTagged(string siteName, string greeningAct, string karmaSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagKarma(
        string memory siteName,
        string memory greeningAct,
        string memory karmaSignal,
        string memory emotionalTag
    ) public onlySteward {
        index.push(KarmaEntry(siteName, greeningAct, karmaSignal, emotionalTag));
        emit UrbanGreeningKarmaTagged(siteName, greeningAct, karmaSignal, emotionalTag);
    }
}
