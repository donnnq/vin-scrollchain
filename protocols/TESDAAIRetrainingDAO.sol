// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TESDAAIRetrainingDAO {
    address public steward;

    struct RetrainingEntry {
        string participantName;
        string skillTrack;
        string certificationStatus;
        string emotionalTag;
    }

    RetrainingEntry[] public registry;

    event RetrainingLogged(string participantName, string skillTrack, string certificationStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logRetraining(
        string memory participantName,
        string memory skillTrack,
        string memory certificationStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(RetrainingEntry(participantName, skillTrack, certificationStatus, emotionalTag));
        emit RetrainingLogged(participantName, skillTrack, certificationStatus, emotionalTag);
    }
}
