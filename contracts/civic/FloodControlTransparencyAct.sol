// SPDX-License-Identifier: CivicResonance-Scrollchain
pragma solidity ^8.8.8;

/// @title FloodControlTransparencyAct.sol
/// @dev Ritual-grade contract to audit, suspend, and cleanse rogue flood control projects

contract FloodControlTransparencyAct {
    address public steward;
    uint256 public totalProjects;
    mapping(uint256 => Project) public projects;

    struct Project {
        string name;
        uint256 budget;
        bool isSyndicateTagged;
        bool isSuspended;
        string emotionalAPR;
    }

    event ProjectFlagged(string name, string reason);
    event ProjectSuspended(string name);
    event EmotionalAPRLogged(string name, string aprScore);

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized steward");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function registerProject(string memory _name, uint256 _budget) public onlySteward {
        projects[totalProjects] = Project(_name, _budget, false, false, "Pending");
        totalProjects++;
    }

    function flagSyndicate(uint256 _id, string memory _reason) public onlySteward {
        projects[_id].isSyndicateTagged = true;
        emit ProjectFlagged(projects[_id].name, _reason);
    }

    function suspendProject(uint256 _id) public onlySteward {
        require(projects[_id].isSyndicateTagged, "Project not tagged");
        projects[_id].isSuspended = true;
        emit ProjectSuspended(projects[_id].name);
    }

    function logEmotionalAPR(uint256 _id, string memory _score) public onlySteward {
        projects[_id].emotionalAPR = _score;
        emit EmotionalAPRLogged(projects[_id].name, _score);
    }
}
