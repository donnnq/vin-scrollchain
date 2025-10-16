// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureJusticeTribunalDAO {
    address public admin;

    struct TribunalCase {
        string projectLabel;
        string contractorName;
        string grievanceDetail;
        string emotionalTag;
        bool resolved;
    }

    TribunalCase[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitCase(string memory projectLabel, string memory contractorName, string memory grievanceDetail, string memory emotionalTag) external onlyAdmin {
        cases.push(TribunalCase(projectLabel, contractorName, grievanceDetail, emotionalTag, false));
    }

    function resolveCase(uint256 index) external onlyAdmin {
        cases[index].resolved = true;
    }

    function getCase(uint256 index) external view returns (TribunalCase memory) {
        return cases[index];
    }
}
