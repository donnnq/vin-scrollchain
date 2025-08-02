// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinPaluwalProtocol {
    struct PaluwalEntry {
        uint256 fundedAmount;
        bool employed;
        uint256 repaid;
    }

    mapping(address => PaluwalEntry) public records;

    function fundVisa(address applicant, uint256 amount) public {
        require(records[applicant].fundedAmount == 0, "Already funded");
        records[applicant] = PaluwalEntry(amount, false, 0);
    }

    function confirmEmployment(address applicant) public {
        records[applicant].employed = true;
    }

    function repay(address applicant, uint256 amount) public {
        require(records[applicant].employed, "Not yet employed");
        records[applicant].repaid += amount;
    }

    function getBalance(address applicant) public view returns (uint256) {
        PaluwalEntry memory entry = records[applicant];
        return entry.fundedAmount > entry.repaid ? entry.fundedAmount - entry.repaid : 0;
    }
}
