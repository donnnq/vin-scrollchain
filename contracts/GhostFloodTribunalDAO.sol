// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GhostFloodTribunalDAO {
    address public admin;

    struct FloodCase {
        string barangay;
        string projectName;
        string fundAmount;
        string emotionalTag;
        bool referredToOmbudsman;
    }

    FloodCase[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function fileCase(string memory _barangay, string memory _projectName, string memory _fundAmount, string memory _emotionalTag) external onlyAdmin {
        cases.push(FloodCase(_barangay, _projectName, _fundAmount, _emotionalTag, false));
    }

    function referToOmbudsman(uint256 index) external onlyAdmin {
        cases[index].referredToOmbudsman = true;
    }

    function getCase(uint256 index) external view returns (FloodCase memory) {
        return cases[index];
    }
}
