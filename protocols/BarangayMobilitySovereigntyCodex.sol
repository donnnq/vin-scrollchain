// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayMobilitySovereigntyCodex {
    address public steward;

    struct MobilityClause {
        string barangay;
        string transportMode;
        string accessProtocol;
        string emotionalTag;
    }

    MobilityClause[] public codex;

    event MobilitySovereigntyTagged(string barangay, string transportMode, string accessProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagMobility(
        string memory barangay,
        string memory transportMode,
        string memory accessProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(MobilityClause(barangay, transportMode, accessProtocol, emotionalTag));
        emit MobilitySovereigntyTagged(barangay, transportMode, accessProtocol, emotionalTag);
    }
}
