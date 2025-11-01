// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarbedWireEthicsCodex {
    address public steward;

    struct WireTag {
        string location;
        string deterrentType;
        string emotionalTag;
        string dignityClause;
    }

    WireTag[] public codex;

    event WireTagged(string location, string deterrentType, string emotionalTag, string dignityClause);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagWire(
        string memory location,
        string memory deterrentType,
        string memory emotionalTag,
        string memory dignityClause
    ) public onlySteward {
        codex.push(WireTag(location, deterrentType, emotionalTag, dignityClause));
        emit WireTagged(location, deterrentType, emotionalTag, dignityClause);
    }
}
