// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ICICaseBuildupDAO {
    address public admin;

    struct CaseEntry {
        string projectName;
        string region;
        string buildupStage;
        string emotionalTag;
        bool filed;
    }

    CaseEntry[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitCase(string memory _projectName, string memory _region, string memory _buildupStage, string memory _emotionalTag) external onlyAdmin {
        cases.push(CaseEntry(_projectName, _region, _buildupStage, _emotionalTag, false));
    }

    function fileCase(uint256 index) external onlyAdmin {
        cases[index].filed = true;
    }

    function getCase(uint256 index) external view returns (CaseEntry memory) {
        return cases[index];
    }
}
