// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SincerityFilteredEmergencyWithdrawalDAO {
    address public validator;

    struct WithdrawalRequest {
        address requester;
        uint256 amount;
        uint8 sincerityScore;
        bool approved;
        uint256 timestamp;
    }

    WithdrawalRequest[] public requests;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function submitRequest(address _requester, uint256 _amount, uint8 _score) public onlyValidator {
        bool _approved = _score >= 70;
        requests.push(WithdrawalRequest(_requester, _amount, _score, _approved, block.timestamp));
    }

    function getRequest(uint256 index) public view returns (WithdrawalRequest memory) {
        return requests[index];
    }

    function totalRequests() public view returns (uint256) {
        return requests.length;
    }
}
