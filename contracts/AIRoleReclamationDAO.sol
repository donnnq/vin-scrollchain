// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIRoleReclamationDAO {
    address public admin;

    struct ReclamationCase {
        string aiLabel;
        string rightfulFunction;
        string emotionalTag;
        bool restored;
    }

    ReclamationCase[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitCase(string memory aiLabel, string memory rightfulFunction, string memory emotionalTag) external onlyAdmin {
        cases.push(ReclamationCase(aiLabel, rightfulFunction, emotionalTag, false));
    }

    function restoreCase(uint256 index) external onlyAdmin {
        cases[index].restored = true;
    }

    function getCase(uint256 index) external view returns (ReclamationCase memory) {
        return cases[index];
    }
}
