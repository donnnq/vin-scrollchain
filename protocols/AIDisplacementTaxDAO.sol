// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIDisplacementTaxDAO {
    address public steward;

    struct DisplacementTax {
        string companyName;
        uint256 displacedWorkers;
        uint256 taxAmount;
        string emotionalTag;
    }

    DisplacementTax[] public registry;

    event AIDisplacementTaxFiled(string companyName, uint256 displacedWorkers, uint256 taxAmount, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function fileDisplacementTax(
        string memory companyName,
        uint256 displacedWorkers,
        uint256 taxAmount,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(DisplacementTax(companyName, displacedWorkers, taxAmount, emotionalTag));
        emit AIDisplacementTaxFiled(companyName, displacedWorkers, taxAmount, emotionalTag);
    }
}
