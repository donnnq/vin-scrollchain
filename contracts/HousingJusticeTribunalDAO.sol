// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HousingJusticeTribunalDAO {
    address public admin;

    struct Case {
        string city;
        string issue;
        address petitioner;
        bool resolved;
    }

    Case[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitCase(string memory _city, string memory _issue, address _petitioner) external {
        cases.push(Case(_city, _issue, _petitioner, false));
    }

    function resolveCase(uint256 index) external onlyAdmin {
        cases[index].resolved = true;
    }

    function getCase(uint256 index) external view returns (Case memory) {
        return cases[index];
    }
}
