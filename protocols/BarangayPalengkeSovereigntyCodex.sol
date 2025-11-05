// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayPalengkeSovereigntyCodex {
    address public steward;

    struct SovereigntyClause {
        string barangay;
        string palengkeName;
        string sovereigntyProtocol;
        string emotionalTag;
    }

    SovereigntyClause[] public codex;

    event PalengkeSovereigntyTagged(string barangay, string palengkeName, string sovereigntyProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSovereignty(
        string memory barangay,
        string memory palengkeName,
        string memory sovereigntyProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SovereigntyClause(barangay, palengkeName, sovereigntyProtocol, emotionalTag));
        emit PalengkeSovereigntyTagged(barangay, palengkeName, sovereigntyProtocol, emotionalTag);
    }
}
