// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkerTestimonyArchiveDAO {
    address public steward;

    struct Testimony {
        string workerName;
        string employerName;
        string incidentSummary;
        string emotionalTag;
    }

    Testimony[] public archive;

    event TestimonyArchived(string workerName, string employerName, string incidentSummary, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function archiveTestimony(
        string memory workerName,
        string memory employerName,
        string memory incidentSummary,
        string memory emotionalTag
    ) public onlySteward {
        archive.push(Testimony(workerName, employerName, incidentSummary, emotionalTag));
        emit TestimonyArchived(workerName, employerName, incidentSummary, emotionalTag);
    }
}
