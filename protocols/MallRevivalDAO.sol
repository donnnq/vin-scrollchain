// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MallRevivalDAO {
    address public steward;

    struct RevivalEntry {
        string mallName;
        string decayFactor;
        string revivalStrategy;
        string emotionalTag;
    }

    RevivalEntry[] public registry;

    event MallRevivalTagged(string mallName, string decayFactor, string revivalStrategy, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRevival(
        string memory mallName,
        string memory decayFactor,
        string memory revivalStrategy,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(RevivalEntry(mallName, decayFactor, revivalStrategy, emotionalTag));
        emit MallRevivalTagged(mallName, decayFactor, revivalStrategy, emotionalTag);
    }
}
