// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CandidateVerificationKarmaProtocol {
    address public steward;

    struct VerificationEntry {
        string candidateName;
        string verificationMethod;
        string karmaSignal;
        string emotionalTag;
    }

    VerificationEntry[] public registry;

    event CandidateVerified(string candidateName, string verificationMethod, string karmaSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function verifyCandidate(
        string memory candidateName,
        string memory verificationMethod,
        string memory karmaSignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(VerificationEntry(candidateName, verificationMethod, karmaSignal, emotionalTag));
        emit CandidateVerified(candidateName, verificationMethod, karmaSignal, emotionalTag);
    }
}
