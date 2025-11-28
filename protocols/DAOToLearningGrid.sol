// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToLearningGrid {
    string public batchID = "1321.9.166";
    string public steward = "Vinvin";

    address public admin;

    struct LearningAccess {
        string sector;      // public, private, vocational
        string gap;         // teacher shortage, curriculum inequity
        uint256 severity;   // scale 1-10
        uint256 timestamp;
    }

    LearningAccess[] public accesses;

    event AccessLogged(string sector, string gap, uint256 severity);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logAccess(string memory sector, string memory gap, uint256 severity) public onlyAdmin {
        accesses.push(LearningAccess(sector, gap, severity, block.timestamp));
        emit AccessLogged(sector, gap, severity);
    }

    function getAccess(uint256 index) public view returns (string memory sector, string memory gap, uint256 severity, uint256 timestamp) {
        LearningAccess memory a = accesses[index];
        return (a.sector, a.gap, a.severity, a.timestamp);
    }
}
