// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WhistleblowerImmunityDAO {
    address public steward;

    struct TestimonyEntry {
        string workerName;
        string employerName;
        string violationType;
        string emotionalTag;
    }

    TestimonyEntry[] public registry;

    event WhistleblowerTagged(string workerName, string employerName, string violationType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagWhistleblower(
        string memory workerName,
        string memory employerName,
        string memory violationType,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(TestimonyEntry(workerName, employerName, violationType, emotionalTag));
        emit WhistleblowerTagged(workerName, employerName, violationType, emotionalTag);
    }
}
