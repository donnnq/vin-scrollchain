// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AltcoinCatalystCodex {
    address public steward;

    struct CatalystEntry {
        string altcoin;
        string catalystType;
        string corridor;
        string emotionalTag;
    }

    CatalystEntry[] public codex;

    event CatalystTagged(string altcoin, string catalystType, string corridor, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagCatalyst(
        string memory altcoin,
        string memory catalystType,
        string memory corridor,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(CatalystEntry(altcoin, catalystType, corridor, emotionalTag));
        emit CatalystTagged(altcoin, catalystType, corridor, emotionalTag);
    }
}
