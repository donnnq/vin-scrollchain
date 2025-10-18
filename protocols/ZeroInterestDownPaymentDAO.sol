// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZeroInterestDownPaymentDAO {
    address public admin;

    struct LoanEntry {
        string applicant;
        string region;
        string emotionalTag;
        bool summoned;
        bool approved;
        bool sealed;
    }

    LoanEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonLoan(string memory applicant, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(LoanEntry(applicant, region, emotionalTag, true, false, false));
    }

    function approveLoan(uint256 index) external onlyAdmin {
        entries[index].approved = true;
    }

    function sealLoan(uint256 index) external onlyAdmin {
        require(entries[index].approved, "Must be approved first");
        entries[index].sealed = true;
    }

    function getLoanEntry(uint256 index) external view returns (LoanEntry memory) {
        return entries[index];
    }
}
