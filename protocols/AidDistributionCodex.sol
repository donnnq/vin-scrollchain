// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AidDistributionCodex {
    address public steward;

    struct DistributionEntry {
        string aidType;
        string distributionChallenge;
        string reformAction;
        string emotionalTag;
    }

    DistributionEntry[] public codex;

    event AidDistributionLogged(string aidType, string distributionChallenge, string reformAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logDistribution(
        string memory aidType,
        string memory distributionChallenge,
        string memory reformAction,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(DistributionEntry(aidType, distributionChallenge, reformAction, emotionalTag));
        emit AidDistributionLogged(aidType, distributionChallenge, reformAction, emotionalTag);
    }
}
