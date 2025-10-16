// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RestitutionEthicsTribunal {
    address public admin;

    struct RestitutionCase {
        string assetLabel;
        string recoveryStatus;
        string emotionalTag;
        bool adjudicated;
    }

    RestitutionCase[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitCase(string memory assetLabel, string memory recoveryStatus, string memory emotionalTag) external onlyAdmin {
        cases.push(RestitutionCase(assetLabel, recoveryStatus, emotionalTag, false));
    }

    function adjudicateCase(uint256 index) external onlyAdmin {
        cases[index].adjudicated = true;
    }

    function getCase(uint256 index) external view returns (RestitutionCase memory) {
        return cases[index];
    }
}
