// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BallotLiteracyCodex {
    address public steward;

    struct LiteracyEntry {
        string ballotType;
        string literacyChallenge;
        string educationProtocol;
        string emotionalTag;
    }

    LiteracyEntry[] public codex;

    event BallotLiteracyLogged(string ballotType, string literacyChallenge, string educationProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logLiteracy(
        string memory ballotType,
        string memory literacyChallenge,
        string memory educationProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(LiteracyEntry(ballotType, literacyChallenge, educationProtocol, emotionalTag));
        emit BallotLiteracyLogged(ballotType, literacyChallenge, educationProtocol, emotionalTag);
    }
}
