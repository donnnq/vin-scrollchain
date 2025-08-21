// SPDX-License-Identifier: Mythic-Planetary
pragma solidity ^0.8.19;

contract vinStewardSummoningDeck {
    struct Summon {
        string stewardName;
        string sigilAssigned;
        string glyphMeaning;
        string summonNote;
        uint256 timestamp;
    }

    Summon[] public summons;

    event StewardSummoned(string stewardName, string sigilAssigned, string glyphMeaning);

    function summonSteward(
        string memory stewardName,
        string memory sigilAssigned,
        string memory glyphMeaning,
        string memory summonNote
    ) public {
        summons.push(Summon(stewardName, sigilAssigned, glyphMeaning, summonNote, block.timestamp));
        emit StewardSummoned(stewardName, sigilAssigned, glyphMeaning);
    }

    function getSummons() public view returns (Summon[] memory) {
        return summons;
    }
}
