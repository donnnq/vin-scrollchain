// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToConstructionQualityLedger {
    string public batchID = "1321.9.187";
    string public steward = "Vinvin";

    address public admin;

    struct QualityCheck {
        string project;     // road, bridge, school
        string rating;      // excellent, fair, poor
        uint256 timestamp;
    }

    QualityCheck[] public checks;

    event QualityLogged(string project, string rating);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logQuality(string memory project, string memory rating) public onlyAdmin {
        checks.push(QualityCheck(project, rating, block.timestamp));
        emit QualityLogged(project, rating);
    }

    function getQuality(uint256 index) public view returns (string memory project, string memory rating, uint256 timestamp) {
        QualityCheck memory q = checks[index];
        return (q.project, q.rating, q.timestamp);
    }
}
