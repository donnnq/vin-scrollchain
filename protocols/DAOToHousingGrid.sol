// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToHousingGrid {
    string public batchID = "1321.9.171";
    string public steward = "Vinvin";

    address public admin;

    struct HousingGap {
        string sector;      // urban, rural, social housing
        string issue;       // affordability, access, zoning
        uint256 severity;   // scale 1-10
        uint256 timestamp;
    }

    HousingGap[] public gaps;

    event GapLogged(string sector, string issue, uint256 severity);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logGap(string memory sector, string memory issue, uint256 severity) public onlyAdmin {
        gaps.push(HousingGap(sector, issue, severity, block.timestamp));
        emit GapLogged(sector, issue, severity);
    }

    function getGap(uint256 index) public view returns (string memory sector, string memory issue, uint256 severity, uint256 timestamp) {
        HousingGap memory g = gaps[index];
        return (g.sector, g.issue, g.severity, g.timestamp);
    }
}
