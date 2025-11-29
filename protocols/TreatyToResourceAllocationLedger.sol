// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToResourceAllocationLedger {
    string public batchID = "1321.9.184";
    string public steward = "Vinvin";

    address public admin;

    struct Allocation {
        string sector;      // health, education, infrastructure
        uint256 amount;     // resource units or budget
        string status;      // allocated, pending, audited
        uint256 timestamp;
    }

    Allocation[] public allocations;

    event AllocationLogged(string sector, uint256 amount, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logAllocation(string memory sector, uint256 amount, string memory status) public onlyAdmin {
        allocations.push(Allocation(sector, amount, status, block.timestamp));
        emit AllocationLogged(sector, amount, status);
    }

    function getAllocation(uint256 index) public view returns (string memory sector, uint256 amount, string memory status, uint256 timestamp) {
        Allocation memory a = allocations[index];
        return (a.sector, a.amount, a.status, a.timestamp);
    }
}
