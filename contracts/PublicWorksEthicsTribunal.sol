// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicWorksEthicsTribunal {
    address public admin;

    struct EthicsCase {
        string contractorName;
        string violationDetail;
        string emotionalTag;
        bool resolved;
    }

    EthicsCase[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitCase(string memory contractorName, string memory violationDetail, string memory emotionalTag) external onlyAdmin {
        cases.push(EthicsCase(contractorName, violationDetail, emotionalTag, false));
    }

    function resolveCase(uint256 index) external onlyAdmin {
        cases[index].resolved = true;
    }

    function getCase(uint256 index) external view returns (EthicsCase memory) {
        return cases[index];
    }
}
