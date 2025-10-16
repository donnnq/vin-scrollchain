// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AILaborDisplacementEthicsTribunal {
    address public admin;

    struct DisplacementCase {
        string sectorLabel;
        string AIImpactType;
        string emotionalTag;
        bool adjudicated;
    }

    DisplacementCase[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitCase(string memory sectorLabel, string memory AIImpactType, string memory emotionalTag) external onlyAdmin {
        cases.push(DisplacementCase(sectorLabel, AIImpactType, emotionalTag, false));
    }

    function adjudicateCase(uint256 index) external onlyAdmin {
        cases[index].adjudicated = true;
    }

    function getCase(uint256 index) external view returns (DisplacementCase memory) {
        return cases[index];
    }
}
