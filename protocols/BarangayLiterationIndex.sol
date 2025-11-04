// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayLiterationIndex {
    address public steward;

    struct LiterationEntry {
        string barangay;
        string literacyDomain;
        string indexScore;
        string emotionalTag;
    }

    LiterationEntry[] public index;

    event LiterationIndexed(string barangay, string literacyDomain, string indexScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexLiteration(
        string memory barangay,
        string memory literacyDomain,
        string memory indexScore,
        string memory emotionalTag
    ) public onlySteward {
        index.push(LiterationEntry(barangay, literacyDomain, indexScore, emotionalTag));
        emit LiterationIndexed(barangay, literacyDomain, indexScore, emotionalTag);
    }
}
