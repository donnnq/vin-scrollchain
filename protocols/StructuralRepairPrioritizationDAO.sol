// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract StructuralRepairPrioritizationDAO {
    address public validator;

    struct RepairRequest {
        string addressDetail;
        string barangay;
        uint8 priorityScore; // 0–100
        string reason;
        uint256 timestamp;
    }

    RepairRequest[] public requests;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function submitRequest(string memory _addressDetail, string memory _barangay, uint8 _score, string memory _reason) public onlyValidator {
        require(_score <= 100, "Score must be 0–100");
        requests.push(RepairRequest(_addressDetail, _barangay, _score, _reason, block.timestamp));
    }

    function getRequest(uint256 index) public view returns (RepairRequest memory) {
        return requests[index];
    }

    function totalRequests() public view returns (uint256) {
        return requests.length;
    }
}
