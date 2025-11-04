// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthLedLiterationIndex {
    address public steward;

    struct LiterationEntry {
        string barangay;
        string literacyDomain;
        string youthSignal;
        string emotionalTag;
    }

    LiterationEntry[] public index;

    event YouthLiterationIndexed(string barangay, string literacyDomain, string youthSignal, string emotionalTag);

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
        string memory youthSignal,
        string memory emotionalTag
    ) public onlySteward {
        index.push(LiterationEntry(barangay, literacyDomain, youthSignal, emotionalTag));
        emit YouthLiterationIndexed(barangay, literacyDomain, youthSignal, emotionalTag);
    }
}
