// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AltcoinRotationSovereigntyDAO {
    address public steward;

    struct RotationEntry {
        string altcoin;
        string corridor;
        string rotationType;
        string emotionalTag;
    }

    RotationEntry[] public registry;

    event RotationTagged(string altcoin, string corridor, string rotationType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagRotation(
        string memory altcoin,
        string memory corridor,
        string memory rotationType,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(RotationEntry(altcoin, corridor, rotationType, emotionalTag));
        emit RotationTagged(altcoin, corridor, rotationType, emotionalTag);
    }
}
