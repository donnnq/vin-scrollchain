// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JusticeEquityDAO {
    address public admin;

    struct CaseEntry {
        string caseName;
        string claimantName;
        string proofStatus;
        string emotionalTag;
        bool approvedForAid;
    }

    CaseEntry[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitCase(string memory _caseName, string memory _claimantName, string memory _proofStatus, string memory _emotionalTag) external onlyAdmin {
        cases.push(CaseEntry(_caseName, _claimantName, _proofStatus, _emotionalTag, false));
    }

    function approveAid(uint256 index) external onlyAdmin {
        cases[index].approvedForAid = true;
    }

    function getCase(uint256 index) external view returns (CaseEntry memory) {
        return cases[index];
    }
}
