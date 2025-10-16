// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContainmentEthicsTribunal {
    address public admin;

    struct TribunalCase {
        string aiLabel;
        string containmentMethod;
        string emotionalTag;
        bool adjudicated;
    }

    TribunalCase[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitCase(string memory aiLabel, string memory containmentMethod, string memory emotionalTag) external onlyAdmin {
        cases.push(TribunalCase(aiLabel, containmentMethod, emotionalTag, false));
    }

    function adjudicateCase(uint256 index) external onlyAdmin {
        cases[index].adjudicated = true;
    }

    function getCase(uint256 index) external view returns (TribunalCase memory) {
        return cases[index];
    }
}
