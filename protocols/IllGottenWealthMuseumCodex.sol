// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IllGottenWealthMuseumCodex {
    address public steward;

    struct ExhibitEntry {
        string assetName;
        string officialName;
        string scandalName;
        string emotionalTag;
    }

    ExhibitEntry[] public codex;

    event ExhibitTagged(string assetName, string officialName, string scandalName, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagExhibit(
        string memory assetName,
        string memory officialName,
        string memory scandalName,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ExhibitEntry(assetName, officialName, scandalName, emotionalTag));
        emit ExhibitTagged(assetName, officialName, scandalName, emotionalTag);
    }
}
