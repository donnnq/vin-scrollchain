// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PartisanMemeImmunityCodex {
    address public steward;

    struct MemeEntry {
        string memeTitle;
        string partisanSlant;
        string immunityProtocol;
        string emotionalTag;
    }

    MemeEntry[] public codex;

    event PartisanMemeLogged(string memeTitle, string partisanSlant, string immunityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logMeme(
        string memory memeTitle,
        string memory partisanSlant,
        string memory immunityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(MemeEntry(memeTitle, partisanSlant, immunityProtocol, emotionalTag));
        emit PartisanMemeLogged(memeTitle, partisanSlant, immunityProtocol, emotionalTag);
    }
}
