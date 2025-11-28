// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToHiringStageGrid {
    string public batchID = "1321.9.164";
    string public steward = "Vinvin";

    address public admin;

    struct HiringStage {
        string stage;       // 1-day hire, 3 months, 6 months, 1 year
        string description; // probation, evaluation, stability
        uint256 timestamp;
    }

    HiringStage[] public stages;

    event StageLogged(string stage, string description);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logStage(string memory stage, string memory description) public onlyAdmin {
        stages.push(HiringStage(stage, description, block.timestamp));
        emit StageLogged(stage, description);
    }

    function getStage(uint256 index) public view returns (string memory stage, string memory description, uint256 timestamp) {
        HiringStage memory s = stages[index];
        return (s.stage, s.description, s.timestamp);
    }
}
