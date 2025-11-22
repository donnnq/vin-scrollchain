// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToReconstructionFundProtocol {
    string public batchID = "1321.9.102";
    string public steward = "Vinvin";

    address public admin;

    struct FundAllocation {
        uint256 amount;
        string purpose; // e.g., "infrastructure", "healthcare", "education"
        uint256 timestamp;
    }

    FundAllocation[] public allocations;

    event FundAllocated(uint256 amount, string purpose);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function allocateFunds(uint256 amount, string memory purpose) public onlyAdmin {
        allocations.push(FundAllocation(amount, purpose, block.timestamp));
        emit FundAllocated(amount, purpose);
    }

    function getAllocation(uint256 index) public view returns (uint256 amount, string memory purpose, uint256 timestamp) {
        FundAllocation memory f = allocations[index];
        return (f.amount, f.purpose, f.timestamp);
    }
}
