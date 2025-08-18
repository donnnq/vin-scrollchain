// SPDX-License-Identifier: Civic-Integrity
pragma solidity ^0.8.0;

/// @title LumpSumTransparencyAudit
/// @author Vinvin
/// @notice Tracks and audits lump sum allocations in national budgets

contract LumpSumTransparencyAudit {
    address public auditor;
    struct Allocation {
        string agency;
        uint256 amount;
        string purpose;
        bool flagged;
        bool verified;
    }

    Allocation[] public allocations;

    event AllocationLogged(string agency, uint256 amount, string purpose);
    event AllocationFlagged(uint256 index, string reason);
    event AllocationVerified(uint256 index);

    constructor(address _auditor) {
        auditor = _auditor;
    }

    function logAllocation(string memory agency, uint256 amount, string memory purpose) public {
        require(msg.sender == auditor, "Unauthorized scrollsmith");
        allocations.push(Allocation(agency, amount, purpose, false, false));
        emit AllocationLogged(agency, amount, purpose);
    }

    function flagAllocation(uint256 index, string memory reason) public {
        require(msg.sender == auditor, "Only auditor can flag");
        require(index < allocations.length, "Invalid index");
        allocations[index].flagged = true;
        emit AllocationFlagged(index, reason);
    }

    function verifyAllocation(uint256 index) public {
        require(msg.sender == auditor, "Only auditor can verify");
        require(index < allocations.length, "Invalid index");
        allocations[index].verified = true;
        emit AllocationVerified(index);
    }

    function getAllocation(uint256 index) public view returns (Allocation memory) {
        return allocations[index];
    }

    function totalAllocations() public view returns (uint256) {
        return allocations.length;
    }
}
