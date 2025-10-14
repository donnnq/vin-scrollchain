// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GrocerTransparencyLedgerDAO {
    address public admin;

    struct Grocer {
        string name;
        string region;
        bool disclosesMarkup;
        bool avoidsExcessiveTaxPassThrough;
    }

    Grocer[] public grocers;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerGrocer(string memory _name, string memory _region, bool _disclosesMarkup, bool _avoidsTaxPassThrough) external onlyAdmin {
        grocers.push(Grocer(_name, _region, _disclosesMarkup, _avoidsTaxPassThrough));
    }

    function getGrocer(uint256 index) external view returns (Grocer memory) {
        return grocers[index];
    }
}
