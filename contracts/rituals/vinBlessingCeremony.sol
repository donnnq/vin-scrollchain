// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinBlessingCeremony {
    struct Blessing {
        string workerName;
        string completedJourney; // "Housing", "Aid", "Education", "All"
        string mythicTitle;
        string legacyNote;
        uint256 timestamp;
    }

    Blessing[] public blessings;

    event WorkerBlessed(string workerName, string completedJourney, string mythicTitle, string legacyNote);

    function blessWorker(
        string memory name,
        string memory journey,
        string memory title,
        string memory note
    ) public {
        blessings.push(Blessing(name, journey, title, note, block.timestamp));
        emit WorkerBlessed(name, journey, title, note);
    }

    function getBlessing(uint index) public view returns (
        string memory, string memory, string memory, string memory, uint256
    ) {
        Blessing memory b = blessings[index];
        return (b.workerName, b.completedJourney, b.mythicTitle, b.legacyNote, b.timestamp);
    }

    function totalBlessings() public view returns (uint) {
        return blessings.length;
    }
}
