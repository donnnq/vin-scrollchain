// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MercyAllocationSincerityFilterProtocol {
    address public validator;

    struct Request {
        address requester;
        string reason;
        uint8 sincerityScore; // 0–100
        bool approved;
        uint256 timestamp;
    }

    Request[] public requests;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function submitRequest(address _requester, string memory _reason, uint8 _score) public onlyValidator {
        bool _approved = _score >= 70;
        requests.push(Request(_requester, _reason, _score, _approved, block.timestamp));
    }

    function getRequest(uint256 index) public view returns (Request memory) {
        return requests[index];
    }

    function totalRequests() public view returns (uint256) {
        return requests.length;
    }
}
