// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanChillspotCodex {
    address public steward;

    struct ChillspotClause {
        string location;
        string chillspotType;
        string designElement;
        string emotionalTag;
    }

    ChillspotClause[] public codex;

    event ChillspotLogged(string location, string chillspotType, string designElement, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logChillspot(
        string memory location,
        string memory chillspotType,
        string memory designElement,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ChillspotClause(location, chillspotType, designElement, emotionalTag));
        emit ChillspotLogged(location, chillspotType, designElement, emotionalTag);
    }
}
