// SPDX-License-Identifier: TRIAL-ARCHIVES
pragma solidity ^0.8.19;

contract vinScrollTrialArchives {
    struct ArchivedTrial {
        string respondent;
        uint yesVotes;
        uint noVotes;
        string verdict;
        uint timestamp;
    }

    ArchivedTrial[] public archive;

    event TrialArchived(string respondent, string verdict, uint time);

    function storeTrial(string calldata respondent, uint yes, uint no, string calldata verdict) external {
        archive.push(ArchivedTrial(respondent, yes, no, verdict, block.timestamp));
        emit TrialArchived(respondent, verdict, block.timestamp);
    }

    function getArchiveCount() external view returns (uint) {
        return archive.length;
    }

    function fetchTrial(uint index) external view returns (ArchivedTrial memory) {
        require(index < archive.length, "Index out of bounds");
        return archive[index];
    }
}
