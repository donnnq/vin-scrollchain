// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BallotTrustDAO {
    address public steward;

    struct TrustEntry {
        string ballotType;
        string trustChallenge;
        string restorationAction;
        string emotionalTag;
    }

    TrustEntry[] public registry;

    event BallotTrustTagged(string ballotType, string trustChallenge, string restorationAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagTrust(
        string memory ballotType,
        string memory trustChallenge,
        string memory restorationAction,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(TrustEntry(ballotType, trustChallenge, restorationAction, emotionalTag));
        emit BallotTrustTagged(ballotType, trustChallenge, restorationAction, emotionalTag);
    }
}
