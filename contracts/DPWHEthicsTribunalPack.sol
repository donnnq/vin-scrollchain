// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DPWHEthicsTribunalPack {
    address public admin;

    struct EthicsCase {
        string officialName;
        string violationType;
        string emotionalTag;
        bool adjudicated;
    }

    EthicsCase[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitCase(string memory officialName, string memory violationType, string memory emotionalTag) external onlyAdmin {
        cases.push(EthicsCase(officialName, violationType, emotionalTag, false));
    }

    function adjudicateCase(uint256 index) external onlyAdmin {
        cases[index].adjudicated = true;
    }

    function getCase(uint256 index) external view returns (EthicsCase memory) {
        return cases[index];
    }
}
