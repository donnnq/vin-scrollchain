// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayMediaLiteracyCodex {
    address public steward;

    struct LiteracyEntry {
        string barangay;
        string literacySignal;
        string codexMechanism;
        string emotionalTag;
    }

    LiteracyEntry[] public codex;

    event MediaLiteracyTagged(string barangay, string literacySignal, string codexMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagLiteracy(
        string memory barangay,
        string memory literacySignal,
        string memory codexMechanism,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(LiteracyEntry(barangay, literacySignal, codexMechanism, emotionalTag));
        emit MediaLiteracyTagged(barangay, literacySignal, codexMechanism, emotionalTag);
    }
}
