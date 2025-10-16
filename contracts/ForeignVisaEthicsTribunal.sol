// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForeignVisaEthicsTribunal {
    address public admin;

    struct VisaCase {
        string passportHolder;
        string ethicsConcern;
        string emotionalTag;
        bool adjudicated;
    }

    VisaCase[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitCase(string memory passportHolder, string memory ethicsConcern, string memory emotionalTag) external onlyAdmin {
        cases.push(VisaCase(passportHolder, ethicsConcern, emotionalTag, false));
    }

    function adjudicateCase(uint256 index) external onlyAdmin {
        cases[index].adjudicated = true;
    }

    function getCase(uint256 index) external view returns (VisaCase memory) {
        return cases[index];
    }
}
