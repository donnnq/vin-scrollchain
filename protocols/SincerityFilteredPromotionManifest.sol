// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SincerityFilteredPromotionManifest {
    address public validator;

    struct Promotion {
        address employee;
        string newRole;
        uint8 sincerityScore;
        bool approved;
        uint256 timestamp;
    }

    Promotion[] public promotions;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function evaluatePromotion(address _employee, string memory _newRole, uint8 _score) public onlyValidator {
        bool _approved = _score >= 80;
        promotions.push(Promotion(_employee, _newRole, _score, _approved, block.timestamp));
    }

    function getPromotion(uint256 index) public view returns (Promotion memory) {
        return promotions[index];
    }

    function totalPromotions() public view returns (uint256) {
        return promotions.length;
    }
}
