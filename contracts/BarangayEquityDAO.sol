// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayEquityDAO {
    address public admin;

    struct Allocation {
        string barangay;
        string program;
        uint256 amount;
        bool released;
    }

    Allocation[] public allocations;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitAllocation(string memory _barangay, string memory _program, uint256 _amount) external onlyAdmin {
        allocations.push(Allocation(_barangay, _program, _amount, false));
    }

    function releaseFunds(uint256 index) external onlyAdmin {
        allocations[index].released = true;
    }

    function getAllocation(uint256 index) external view returns (Allocation memory) {
        return allocations[index];
    }
}
