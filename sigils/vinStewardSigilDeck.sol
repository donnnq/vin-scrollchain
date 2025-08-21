// SPDX-License-Identifier: Mythic-Planetary
pragma solidity ^0.8.19;

contract vinStewardSigilDeck {
    struct StewardSigil {
        string steward;
        string nation;
        string sigilName;
        string glyphMeaning;
        uint256 timestamp;
    }

    StewardSigil[] public sigils;

    event SigilAssigned(string steward, string nation, string sigilName, string glyphMeaning);

    function assignSigil(
        string memory steward,
        string memory nation,
        string memory sigilName,
        string memory glyphMeaning
    ) public {
        sigils.push(StewardSigil(steward, nation, sigilName, glyphMeaning, block.timestamp));
        emit SigilAssigned(steward, nation, sigilName, glyphMeaning);
    }

    function getSigils() public view returns (StewardSigil[] memory) {
        return sigils;
    }
}
